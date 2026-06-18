#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/06-arrays.sh
  . "${BATS_TEST_DIRNAME}/../lessons/06-arrays.sh"
}

@test "array_sum totals all arguments" {
  run array_sum 1 2 3 4
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "10" ]]
}

@test "array_contains returns success when the item exists" {
  run array_contains banana apple banana cherry
  [[ "${status}" -eq 0 ]]
}

@test "array_contains returns failure when the item is missing" {
  run array_contains kiwi apple banana cherry
  [[ "${status}" -eq 1 ]]
}

@test "array_join combines items with the delimiter" {
  run array_join ',' red green blue
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "red,green,blue" ]]
}
