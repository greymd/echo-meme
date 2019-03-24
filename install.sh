#!/bin/bash
set -ue

readonly THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && pwd)"
readonly BINMODE=755
readonly DOCMODE=644
readonly PREFIX="${1:-/usr/local}"
readonly PREFIX_BIN="${PREFIX}/bin"
readonly PREFIX_MAN="${PREFIX}/man"

# Install (bin)
echo install -d "${PREFIX_BIN}"
install -d "${PREFIX_BIN}"
echo install -m "${BINMODE}" "${THIS_DIR}/bin/echo-meme" "${PREFIX_BIN}/echo-meme"
install -m "${BINMODE}" "${THIS_DIR}/bin/echo-meme" "${PREFIX_BIN}/echo-meme"

# Install (man)
echo install -d "${PREFIX_MAN}"
install -d "${PREFIX_MAN}"
echo install -m "${BINMODE}" "${THIS_DIR}/bin/echo-meme" "${PREFIX_MAN}/echo-meme.1"
install -m "${BINMODE}" "${THIS_DIR}/bin/echo-meme" "${PREFIX_MAN}/echo-meme.1"
