#!/usr/bin/env bats
# shellcheck disable=SC2154

setup() {
  # shellcheck disable=SC1091
  # shellcheck source=../lessons/10-capstone-file-io.sh
  . "${BATS_TEST_DIRNAME}/../lessons/10-capstone-file-io.sh"
}

@test "new_student_record creates a CSV line with the expected grade" {
  run new_student_record "Ada" 95
  [[ "${status}" -eq 0 ]]

  IFS=',' read -r name score grade timestamp <<< "${output}"
  [[ "${name}" = "Ada" ]]
  [[ "${score}" = "95" ]]
  [[ "${grade}" = "A" ]]
  [[ -n "${timestamp}" ]]
}

@test "new_student_record rejects scores outside the allowed range" {
  run new_student_record "Ada" 101
  [[ "${status}" -eq 1 ]]
}

@test "get_class_average returns the integer average" {
  local csv_file
  csv_file="${BATS_TEST_DIRNAME}/class.csv"
  cat > "${csv_file}" <<'CSV'
Name,Score,Grade,Timestamp
Ada,90,A,2026-01-01T00:00:00Z
Grace,80,B,2026-01-01T00:00:01Z
Linus,70,C,2026-01-01T00:00:02Z
CSV

  run get_class_average "${csv_file}"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = "80" ]]
}

@test "get_class_average fails for a missing file" {
  run get_class_average "${BATS_TEST_DIRNAME}/does-not-exist.csv"
  [[ "${status}" -eq 1 ]]
}

@test "export_grade_report writes a CSV header and records" {
  local report_file
  report_file="${BATS_TEST_DIRNAME}/report.csv"

  printf '%s\n%s\n' \
    'Ada,95,A,2026-01-01T00:00:00Z' \
    'Grace,88,B,2026-01-01T00:00:01Z' | export_grade_report "${report_file}"

  run cat "${report_file}"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" = $'Name,Score,Grade,Timestamp\nAda,95,A,2026-01-01T00:00:00Z\nGrace,88,B,2026-01-01T00:00:01Z' ]]
}
