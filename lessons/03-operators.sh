#!/usr/bin/env bash
set -euo pipefail

# Lesson 03: Operators
# Learning objectives:
#   - Do arithmetic with $(( ... )).
#   - Compare integers with -eq, -ne, -lt, -gt, -le, and -ge.
#   - Compare strings and test for empty values.
#   - Use regex matching with =~.
# Estimated time: 15 minutes
# Prerequisites: Lessons 01-02, Bash 4+

show_lesson_03_demo() {
  local left=10
  local right=3
  local name="Bash"
  local empty_value=""

  echo "10 + 3 = $((left + right))"
  echo "10 - 3 = $((left - right))"

  if [[ "${left}" -gt "${right}" ]]; then
    echo "${left} is greater than ${right}"
  fi

  if [[ "${name}" == "Bash" ]]; then
    echo "String comparison succeeded"
  fi

  if [[ -z "${empty_value}" ]]; then
    echo "The variable is empty"
  fi

  local lesson_label="lesson-03"

  if [[ "${lesson_label}" =~ ^lesson-[0-9]+$ ]]; then
    echo "Regex match succeeded"
  fi
}

calculate() {
  local left="${1:-}"
  local operator="${2:-}"
  local right="${3:-}"

  case "${operator}" in
    '+')
      printf '%s\n' "$((left + right))"
      ;;
    '-')
      printf '%s\n' "$((left - right))"
      ;;
    '*')
      printf '%s\n' "$((left * right))"
      ;;
    '/')
      if [[ "${right}" -eq 0 ]]; then
        echo "Error: division by zero" >&2
        return 1
      fi
      printf '%s\n' "$((left / right))"
      ;;
    *)
      echo "Error: unknown operator: ${operator}" >&2
      return 1
      ;;
  esac
}

is_match() {
  local value="${1:-}"
  local regex="${2:-}"

  if [[ "${value}" =~ ${regex} ]]; then
    return 0
  fi

  return 1
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_03_demo
fi

# ---- FOLLOW ALONG ----
# TODO 1: Add a modulo (%) example to the demo section.
# TODO 2: Compare two different strings with == and !=.
# TODO 3: Write a regex that matches an email-like value.
# TODO 4: Call calculate with each supported operator.
