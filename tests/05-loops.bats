#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/05-loops.sh
  . "${BATS_TEST_DIRNAME}/../lessons/05-loops.sh"
}

@test "get_factorial returns 120 for 5" {
  run get_factorial 5
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "120" ]]
}

@test "get_factorial rejects negative numbers" {
  run get_factorial -1
  [[ "${status}" -eq 1 ]]
}

@test "get_fizzbuzz prints the expected sequence to 5" {
  run get_fizzbuzz 5
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = $'1\n2\nFizz\n4\nBuzz' ]]
}

@test "get_even_numbers prints even values up to max" {
  run get_even_numbers 8
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = $'2\n4\n6\n8' ]]
}
