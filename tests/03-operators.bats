#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/03-operators.sh
  . "${BATS_TEST_DIRNAME}/../lessons/03-operators.sh"
}

@test "calculate adds two numbers" {
  run calculate 3 + 4
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "7" ]]
}

@test "calculate multiplies two numbers" {
  run calculate 6 '*' 7
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "42" ]]
}

@test "calculate exits 1 on division by zero" {
  run calculate 5 / 0
  [[ "${status}" -eq 1 ]]
}

@test "calculate exits 1 on an unknown operator" {
  run calculate 5 % 2
  [[ "${status}" -eq 1 ]]
}

@test "is_match returns success for matching regex" {
  run is_match "lesson-03" '^lesson-[0-9]+$'
  [[ "${status}" -eq 0 ]]
}

@test "is_match returns failure for non-matching regex" {
  run is_match "lesson-three" '^lesson-[0-9]+$'
  [[ "${status}" -eq 1 ]]
}
