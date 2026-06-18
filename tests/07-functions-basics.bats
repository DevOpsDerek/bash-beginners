#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/07-functions-basics.sh
  . "${BATS_TEST_DIRNAME}/../lessons/07-functions-basics.sh"
}

@test "circle_area returns a formatted floating-point area" {
  run circle_area 2
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "12.5664" ]]
}

@test "to_title_case capitalizes each word" {
  run to_title_case "bash scripting basics"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Bash Scripting Basics" ]]
}

@test "repeat_string repeats text the requested number of times" {
  run repeat_string hi 3
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "hihihi" ]]
}

@test "repeat_string rejects negative counts" {
  run repeat_string hi -1
  [[ "${status}" -eq 1 ]]
}
