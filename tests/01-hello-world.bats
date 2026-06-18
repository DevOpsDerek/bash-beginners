#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/01-hello-world.sh
  . "${BATS_TEST_DIRNAME}/../lessons/01-hello-world.sh"
}

@test "greet says hello to a name" {
  run greet "Derek"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Hello, Derek!" ]]
}

@test "greet handles an empty argument" {
  run greet ""
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Hello, !" ]]
}

@test "get_full_name joins first and last name" {
  run get_full_name "Ada" "Lovelace"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Ada Lovelace" ]]
}
