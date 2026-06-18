#!/usr/bin/env bash
set -euo pipefail

# Lesson 10: Capstone - File I/O
# Learning objectives:
#   - Read and write files with echo, cat, and redirection.
#   - Process files line by line with while read.
#   - Work with CSV data using cut, awk, and shell loops.
#   - Use trap for cleanup around temporary practice files.
# Estimated time: 25 minutes
# Prerequisites: Lessons 01-09, Bash 4+

show_lesson_10_demo() {
  local demo_file
  demo_file="$(mktemp "${PWD}/lesson10-demo.XXXXXX")"

  trap 'rm -f "${demo_file}"' EXIT

  echo "Name,Score,Grade,Timestamp" > "${demo_file}"
  echo "Ada,95,A,2026-01-01T00:00:00Z" >> "${demo_file}"
  echo "Grace,88,B,2026-01-01T00:00:01Z" >> "${demo_file}"

  local average_score

  echo "Created demo CSV: ${demo_file}"
  cat "${demo_file}"
  average_score="$(get_class_average "${demo_file}")"
  echo "Average score: ${average_score}"

  trap - EXIT
  rm -f "${demo_file}"
}

new_student_record() {
  local name="${1:-}"
  local score="${2:-}"
  local grade=""
  local timestamp=""

  if [[ ! "${score}" =~ ^[0-9]+$ ]] || [[ "${score}" -lt 0 ]] || [[ "${score}" -gt 100 ]]; then
    echo "Error: score must be between 0 and 100" >&2
    return 1
  fi

  if [[ "${score}" -ge 90 ]]; then
    grade='A'
  elif [[ "${score}" -ge 80 ]]; then
    grade='B'
  elif [[ "${score}" -ge 70 ]]; then
    grade='C'
  elif [[ "${score}" -ge 60 ]]; then
    grade='D'
  else
    grade='F'
  fi

  timestamp="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  printf '%s,%s,%s,%s\n' "${name}" "${score}" "${grade}" "${timestamp}"
}

get_class_average() {
  local file_path="${1:-}"
  local line=""
  local score=""
  local total=0
  local count=0

  if [[ ! -f "${file_path}" ]]; then
    echo "Error: file not found: ${file_path}" >&2
    return 1
  fi

  if [[ ! -s "${file_path}" ]]; then
    echo "Error: file is empty: ${file_path}" >&2
    return 1
  fi

  while IFS= read -r line; do
    if [[ "${line}" == 'Name,Score,Grade,Timestamp' ]]; then
      continue
    fi

    score="$(cut -d',' -f2 <<< "${line}")"
    if [[ -n "${score}" ]]; then
      total=$((total + score))
      count=$((count + 1))
    fi
  done < "${file_path}"

  if [[ "${count}" -eq 0 ]]; then
    echo "Error: no student records found in ${file_path}" >&2
    return 1
  fi

  printf '%s\n' "$((total / count))"
}

export_grade_report() {
  local output_file="${1:-}"
  local record=""

  printf 'Name,Score,Grade,Timestamp\n' > "${output_file}"
  while IFS= read -r record; do
    if [[ -n "${record}" ]]; then
      printf '%s\n' "${record}" >> "${output_file}"
    fi
  done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_10_demo
fi

# ---- FOLLOW ALONG ----
# TODO 1: Create three student records and save them to a CSV file.
# TODO 2: Append another record with >> and recompute the class average.
# TODO 3: Use awk or cut to print only the Name and Grade columns.
# TODO 4: Add a cleanup trap around your own practice report file.
