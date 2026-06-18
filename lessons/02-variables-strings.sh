#!/usr/bin/env bash
set -euo pipefail

# Lesson 02: Variables & Strings
# Learning objectives:
#   - Expand variables with ${var} and ${var}.
#   - Use default values with ${var:-default}.
#   - Measure string length and slice substrings.
#   - Convert text to uppercase and lowercase.
#   - Capture command output with $(...).
# Estimated time: 15 minutes
# Prerequisites: Lesson 01, Bash 4+

show_lesson_02_demo() {
  local phrase="bash scripting"
  local empty_value=""
  local default_value="${empty_value:-fallback text}"
  local current_year
  current_year="$(date '+%Y')"
  readonly course_label="String practice"

  echo "Phrase: ${phrase}"
  echo "Using braces: ${phrase}"
  echo "Default value: ${default_value}"
  echo "Length: ${#phrase}"
  echo "Substring (0:4): ${phrase:0:4}"
  echo "Uppercase: ${phrase^^}"
  echo "Lowercase: ${phrase,,}"
  echo "Readonly label: ${course_label}"
  echo "Command substitution year: ${current_year}"
}

to_uppercase() {
  local value="${1:-}"
  printf '%s\n' "${value^^}"
}

get_string_length() {
  local value="${1:-}"
  printf '%s\n' "${#value}"
}

get_default() {
  local value="${1:-default}"
  printf '%s\n' "${value}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_02_demo
fi

# ---- FOLLOW ALONG ----
# TODO 1: Create a variable named language and print its length.
# TODO 2: Slice the first three characters from a word of your choice.
# TODO 3: Convert a sentence to uppercase, then lowercase.
# TODO 4: Use command substitution to capture the current username.
