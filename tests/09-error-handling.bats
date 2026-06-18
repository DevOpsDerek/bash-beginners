#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/09-error-handling.sh
  . "${BATS_TEST_DIRNAME}/../lessons/09-error-handling.sh"
}

@test "safe_divide returns an integer result" {
  run safe_divide 8 2
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "4" ]]
}

@test "safe_divide rejects division by zero" {
  run safe_divide 8 0
  [[ "${status}" -eq 1 ]]
  [[ "${output}" = "Error: division by zero" ]]
}

@test "require_command succeeds for bash" {
  run require_command bash
  [[ "${status}" -eq 0 ]]
}

@test "require_command fails for a missing command" {
  run require_command definitely-not-a-real-command
  [[ "${status}" -eq 1 ]]
  [[ "${output}" = "Error: command not found: definitely-not-a-real-command" ]]
}

@test "read_json_value reads a simple string value" {
  local json_file
  json_file="${BATS_TEST_DIRNAME}/sample.json"
  printf '{\n  "name": "Ada",\n  "role": "Engineer"\n}\n' > "${json_file}"

  run read_json_value "${json_file}" role
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "Engineer" ]]
}

@test "read_json_value fails when the key is missing" {
  local json_file
  json_file="${BATS_TEST_DIRNAME}/sample-missing.json"
  printf '{\n  "name": "Ada"\n}\n' > "${json_file}"

  run read_json_value "${json_file}" role
  [[ "${status}" -eq 1 ]]
  [[ "${output}" = "Error: key not found: role" ]]
}
