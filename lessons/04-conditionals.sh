#!/usr/bin/env bash
set -euo pipefail

# Lesson 04: Conditionals
# Learning objectives:
#   - Branch with if, elif, and else.
#   - Use [[ ... ]] for readable conditions.
#   - Select patterns with case.
#   - Check files and directories with -e, -f, and -d.
# Estimated time: 20 minutes
# Prerequisites: Lessons 01-03, Bash 4+

show_lesson_04_demo() {
  local score=82
  local sample_path="README.md"

  if [[ "${score}" -ge 90 ]]; then
    echo "Excellent work"
  elif [[ "${score}" -ge 70 ]]; then
    echo "Nice job"
  else
    echo "Keep practicing"
  fi

  case "${1:-monday}" in
    saturday|sunday)
      echo "Weekend branch"
      ;;
    *)
      echo "Weekday branch"
      ;;
  esac

  if [[ -e "${sample_path}" ]]; then
    echo "${sample_path} exists"
  fi

  if [[ -f "${sample_path}" ]]; then
    echo "${sample_path} is a regular file"
  fi

  if [[ -d lessons ]]; then
    echo "lessons is a directory"
  fi
}

get_season() {
  local month="${1:-}"

  case "${month}" in
    12|1|2)
      printf 'Winter\n'
      ;;
    3|4|5)
      printf 'Spring\n'
      ;;
    6|7|8)
      printf 'Summer\n'
      ;;
    9|10|11)
      printf 'Autumn\n'
      ;;
    *)
      echo "Error: month must be between 1 and 12" >&2
      return 1
      ;;
  esac
}

get_letter_grade() {
  local score="${1:-}"

  if [[ ! "${score}" =~ ^[0-9]+$ ]] || [[ "${score}" -lt 0 ]] || [[ "${score}" -gt 100 ]]; then
    echo "Error: score must be between 0 and 100" >&2
    return 1
  fi

  if [[ "${score}" -ge 90 ]]; then
    printf 'A\n'
  elif [[ "${score}" -ge 80 ]]; then
    printf 'B\n'
  elif [[ "${score}" -ge 70 ]]; then
    printf 'C\n'
  elif [[ "${score}" -ge 60 ]]; then
    printf 'D\n'
  else
    printf 'F\n'
  fi
}

get_day_type() {
  local day_name="${1:-}"
  local normalized_day="${day_name,,}"

  case "${normalized_day}" in
    saturday|sunday)
      printf 'Weekend\n'
      ;;
    monday|tuesday|wednesday|thursday|friday)
      printf 'Weekday\n'
      ;;
    *)
      echo "Error: unknown day: ${day_name}" >&2
      return 1
      ;;
  esac
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_04_demo "${1:-monday}"
fi

# ---- FOLLOW ALONG ----
# TODO 1: Add a nested condition that checks for a perfect score.
# TODO 2: Create a case statement that responds to file extensions.
# TODO 3: Use -d to check whether a practice directory exists.
# TODO 4: Call get_letter_grade with several scores and record the output.
