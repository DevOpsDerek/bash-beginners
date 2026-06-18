#!/usr/bin/env bash
set -euo pipefail

# Lesson 01: Hello World & Variables
# Learning objectives:
#   - Print text with echo and printf.
#   - Create variables with no spaces around =.
#   - Quote values safely.
#   - Read script and argument names with $0 and $1.
# Estimated time: 10 minutes
# Prerequisites: Bash 4+

show_lesson_01_demo() {
  # echo is quick and friendly for simple text output.
  echo "Hello from Bash"

  # printf gives you formatting control.
  printf 'Script name: %s\n' "$0"
  printf 'First argument: %s\n' "${1:-<none>}"

  # Variable assignment has no spaces around the equals sign.
  local first_name="Ada"
  local last_name="Lovelace"

  # Double quotes allow variable expansion.
  echo "Welcome, ${first_name}"

  # Braces can make variable names easier to read.
  echo "Full name: ${first_name} ${last_name}"

  # Single quotes treat most characters literally.
  echo "Single quotes do not expand \$first_name."

  # Comments begin with # and are ignored by Bash.
  echo "Comments help future readers understand your script."
}

greet() {
  local name="${1:-}"
  printf 'Hello, %s!\n' "${name}"
}

get_full_name() {
  local first_name="${1:-}"
  local last_name="${2:-}"
  printf '%s %s\n' "${first_name}" "${last_name}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_01_demo "${1:-}"
  greet "${1:-Bash beginner}"
fi

# ---- FOLLOW ALONG ----
# TODO 1: Change the first_name variable in show_lesson_01_demo and rerun the script.
# TODO 2: Add a middle name variable and print all three names with printf.
# TODO 3: Call greet with your own name from the command line.
# TODO 4: Create a variable called favorite_editor and print it with echo.
