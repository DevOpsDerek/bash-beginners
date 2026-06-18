#!/usr/bin/env bash
set -euo pipefail

# Lesson 07: Functions Basics
# Learning objectives:
#   - Define and call functions.
#   - Work with $1, $2, $#, and $@ inside functions.
#   - Use local variables to avoid leaking state.
#   - Return status codes and send values back with output.
# Estimated time: 20 minutes
# Prerequisites: Lessons 01-06, Bash 4+

show_lesson_07_demo() {
  helper_with_function_keyword() {
    local message="${1:-no message}"
    echo "function keyword example: ${message}"
  }

  helper_with_name_syntax() {
    local count="$#"
    echo "name() syntax example with ${count} argument(s)"
  }

  helper_with_function_keyword "Hello"
  helper_with_name_syntax one two
}

circle_area() {
  local radius="${1:-}"

  if [[ ! "${radius}" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: radius must be a non-negative number" >&2
    return 1
  fi

  awk "BEGIN{printf \"%.4f\\n\", 3.14159265358979*${radius}*${radius}}"
}

to_title_case() {
  local text="${*:-}"

  awk '
    {
      for (i = 1; i <= NF; i++) {
        $i = toupper(substr($i, 1, 1)) tolower(substr($i, 2))
      }
      print
    }
  ' <<< "${text}"
}

repeat_string() {
  local text="${1:-}"
  local count="${2:-0}"
  local result=""
  local current

  if [[ ! "${count}" =~ ^[0-9]+$ ]]; then
    echo "Error: count must be 0 or greater" >&2
    return 1
  fi

  for ((current = 0; current < count; current++)); do
    result+="${text}"
  done

  printf '%s\n' "${result}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_07_demo
fi

# ---- FOLLOW ALONG ----
# TODO 1: Write a function that greets two people by name.
# TODO 2: Update repeat_string so it can insert a separator.
# TODO 3: Call circle_area with 2, 4, and 10.
# TODO 4: Print $# inside a function and compare it to $@.
