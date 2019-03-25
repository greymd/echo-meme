#!/bin/bash
set -ue
trap 'rm -f $THIS_DIR/echo-meme.tar.gz' EXIT
readonly THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && pwd)"
EM_VERSION="$(/bin/bash "${THIS_DIR}"/bin/echo-meme --version | awk '{print $2}' | sed 's/^v//')"
tar zcvf "${THIS_DIR}"/echo-meme.tar.gz -C "${THIS_DIR}" bin man .tar2package.yml
docker run -i greymd/tar2rpm < "${THIS_DIR}"/echo-meme.tar.gz > "${THIS_DIR}/pkg/echo-meme.rpm"
docker run -i greymd/tar2deb < "${THIS_DIR}"/echo-meme.tar.gz > "${THIS_DIR}/pkg/echo-meme.deb"
