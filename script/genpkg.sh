#!/bin/bash
set -ue
trap 'rm -f $REPO_DIR/echo-meme.tar.gz' EXIT
readonly REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && cd ../ && pwd)"
tar zcvf "${REPO_DIR}"/echo-meme.tar.gz -C "${REPO_DIR}" bin man .tar2package.yml
docker run -i greymd/tar2rpm < "${REPO_DIR}"/echo-meme.tar.gz > "${REPO_DIR}/pkg/echo-meme.rpm"
docker run -i greymd/tar2deb < "${REPO_DIR}"/echo-meme.tar.gz > "${REPO_DIR}/pkg/echo-meme.deb"
