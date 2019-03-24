#!/bin/bash
set -ue

readonly THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && pwd)"
readonly BINMODE=755
readonly DOCMODE=644
readonly PREFIX="${1:-/usr/local}"
readonly PREFIX_BIN="${PREFIX}/bin"

# Install (bin)
echo install -d "${PREFIX_BIN}"
install -d "${PREFIX_BIN}"
echo install -m "${BINMODE}" "${THIS_DIR}/bin/echo-meme" "${PREFIX_BIN}/echo-meme"
install -m "${BINMODE}" "${THIS_DIR}/bin/echo-meme" "${PREFIX_BIN}/echo-meme"
