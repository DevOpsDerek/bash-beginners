#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/04-conditionals.sh
  . "${BATS_TEST_DIRNAME}/../lessons/04-conditionals.sh"
}

@test "get_season maps month to season" {
  run get_season 4
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Spring" ]]
}

@test "get_letter_grade returns A for high score" {
  run get_letter_grade 95
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "A" ]]
}

@test "get_letter_grade rejects out-of-range scores" {
  run get_letter_grade 101
  [[ "${status}" -eq 1 ]]
}

@test "get_day_type identifies weekends" {
  run get_day_type Sunday
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Weekend" ]]
}

@test "get_day_type identifies weekdays" {
  run get_day_type monday
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Weekday" ]]
}
