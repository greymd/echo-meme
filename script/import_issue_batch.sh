#!/usr/bin/env bash

# ===================================
# Required Environment:
#  * Set SSH key to access GitHub under ~/.ssh/
#  * Set GITHUB_AUTH -- Auth token for GitHub Rest API.
#  * GNU sed, jq, curl, git
# ===================================
set -xue

export GITHUB_AUTH="${GITHUB_AUTH}"
readonly COMMON_HEADER=("--retry" "5" "-H" "User-Agent: Travis/1.0" "-H" "Authorization: token $GITHUB_AUTH" "-H" "Accept: application/vnd.github.v3+json" "-L" "-f")
readonly REPO="greymd/echo-meme"
readonly GIT_REPODIR="${TMPDIR:-/tmp}/${REPO}"
readonly GIT_BRANCH="master"
trap 'rm -rf "${GIT_REPODIR}"' EXIT

get_issue_list () {
  local _repo="$1"
  local _api_url="https://api.github.com/repos/${_repo}/issues"
  curl "${COMMON_HEADER[@]}" "${_api_url}"
}

get_issue () {
  local _repo="$1" ;shift
  local _number="$1"
  local _api_url="https://api.github.com/repos/${_repo}/issues/${_number}"
  curl "${COMMON_HEADER[@]}" "${_api_url}"
}

create_comment () {
  local _repo="$1" ;shift
  local _issue_num="$1" ;shift
  local _comment="$1" ;shift
  local _api_url="https://api.github.com/repos/${_repo}/issues/${_issue_num}/comments"
  curl "${COMMON_HEADER[@]}" \
    -X POST \
    -d '{
      "body": "'"${_comment}"'"
    }' \
    "${_api_url}"
}

git_update () {
  local _repo="$1" ;shift
  local _msg="$1" ;shift
  local _issue_num="$1"
  local _repodir="${GIT_REPODIR}"
  mkdir -p "${_repodir}"
  git clone  -b "$GIT_BRANCH" \
    "git@github.com:${_repo}.git" \
    "${_repodir}" || true
  cd "${_repodir}"
  update_meme "${_repodir}" "$_msg"
  git add "${_repodir}/bin/echo-meme"
  git commit -m "Import new meme (Fix #${_issue_num})"
  git push origin "$GIT_BRANCH"
}

update_meme () {
  local _repodir="$1" ;shift
  local _msg="$1"
  printf '/^[^#]*"@@@TEMPLATE_INSERT_HERE@@@"/i \ \ "%s"' "$_msg" \
    | sed -f - -i "${_repodir}"/bin/echo-meme # GNU sed required
}

regulate_body () {
  grep -oE 'template:\[.+\]' | sed -r 's/^template:\[(.+)\]$/\1/' | sed 's/"/\\"/'
}

main () {
  local _new_meme
  while read -r n; do
    _new_meme="$(get_issue "${REPO}" "$n" | jq -r '.body' | regulate_body)"
    ( git_update "${REPO}" "$_new_meme" "$n" )
    create_comment "${REPO}" "$n" "THIS COMMENT IS POSTED BY BOT -- [$_new_meme] is imported. You rocked it!"
  done < <(get_issue_list "${REPO}" | jq -r '.[].number')
  return 0
}

main ${1+"$@"}
exit $?
