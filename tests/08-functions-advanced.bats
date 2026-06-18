#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/08-functions-advanced.sh
  . "${BATS_TEST_DIRNAME}/../lessons/08-functions-advanced.sh"
}

@test "parse_options reads name and verbose flag" {
  run parse_options -n Casey -v
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "name=Casey verbose=1" ]]
}

@test "parse_options defaults verbose to 0" {
  run parse_options -n Casey
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "name=Casey verbose=0" ]]
}

@test "parse_options rejects invalid options" {
  run parse_options -x
  [[ "${status}" -eq 1 ]]
}

@test "fibonacci returns the tenth value" {
  run fibonacci 10
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "55" ]]
}

@test "fibonacci rejects negative input" {
  run fibonacci -1
  [[ "${status}" -eq 1 ]]
}
