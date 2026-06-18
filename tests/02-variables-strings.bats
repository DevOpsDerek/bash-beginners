#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/02-variables-strings.sh
  . "${BATS_TEST_DIRNAME}/../lessons/02-variables-strings.sh"
}

@test "to_uppercase converts text to uppercase" {
  run to_uppercase "bash rocks"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "BASH ROCKS" ]]
}

@test "get_string_length returns character count" {
  run get_string_length "hello"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "5" ]]
}

@test "get_default returns the provided value" {
  run get_default "custom"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "custom" ]]
}

@test "get_default falls back to default when empty" {
  run get_default ""
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "default" ]]
}
