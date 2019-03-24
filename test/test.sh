#!/bin/bash

if [ -n "$BASH_VERSION" ]; then
  echo "Testing for bash $BASH_VERSION"
fi

# Directory name of this file
readonly THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && pwd)"

oneTimeSetUp(){
  BIN_DIR="${THIS_DIR}/../bin/"
  BIN_NAME="echo-meme"
  EXEC="${BIN_DIR}${BIN_NAME}"
}

setUp(){
    echo ">>>>>>>>>>" >&2
}

tearDown(){
    echo "<<<<<<<<<<" >&2
    echo >&2
}

test_empty_message() {
  ${EXEC} -r > /dev/null
  actual=$?
  expected=1
  assertEquals "$expected" "$actual"

  seq 3 | ${EXEC} -r -s > /dev/null
  actual=$?
  expected=1
  assertEquals "$expected" "$actual"
}

test_invalid_registration() {
  ${EXEC} -r 'あいうえお' > /dev/null
  actual=$?
  expected=1
  assertEquals "$expected" "$actual"
}

test_version() {
  pattern="^echo-meme v[0-9].[0-9].[0-9]$"
  [[ "$(${EXEC} --version)" =~ $pattern ]]
  actual=$?
  expected=0
  assertEquals "$expected" "$actual"
}

test_help() {
  ${EXEC} --help > /dev/null
  actual=$?
  expected=0
  assertEquals "$expected" "$actual"
}

test_stdin() {
  pattern="^.*1 2 3.*$"
  [[ "$(seq 3 | ${EXEC} -s)" =~ $pattern ]]
  actual=$?
  expected=0
  assertEquals "$expected" "$actual"

  pattern="^.*あいうえお.*$"
  [[ "$(echo あいうえお | ${EXEC} -s)" =~ $pattern ]]
  actual=$?
  expected=0
  assertEquals "$expected" "$actual"
}

test_normal() {
  pattern="^.*あいうえお.*$"
  [[ "$(${EXEC} あいうえお)" =~ $pattern ]]
  actual=$?
  expected=0
  assertEquals "$expected" "$actual"
}

# shellcheck source=/dev/null
. "${THIS_DIR}/shunit2/shunit2"
