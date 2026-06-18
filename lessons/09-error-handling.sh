#!/usr/bin/env bash
set -euo pipefail

# Lesson 09: Error Handling
# Learning objectives:
#   - Understand strict mode: set -e, set -u, and set -o pipefail.
#   - Inspect exit codes with $?.
#   - Use trap for cleanup and debugging.
#   - Validate commands and inputs before work begins.
# Estimated time: 20 minutes
# Prerequisites: Lessons 01-08, Bash 4+

lesson_09_error_handler() {
  local line_number="${1:-unknown}"
  echo "A command failed near line ${line_number}" >&2
}

show_lesson_09_demo() {
  local previous_status=0

  trap 'lesson_09_error_handler "${LINENO}"' ERR
  echo "Strict mode is already enabled at the top of this file."
  command -v bash >/dev/null
  previous_status=$?
  echo "Exit code of the last successful command: ${previous_status}"
  echo "bash is available"
  trap - ERR
}

safe_divide() {
  local left="${1:-}"
  local right="${2:-}"

  if [[ "${right}" -eq 0 ]]; then
    echo "Error: division by zero" >&2
    return 1
  fi

  printf '%s\n' "$((left / right))"
}

require_command() {
  local command_name="${1:-}"

  if command -v "${command_name}" >/dev/null 2>&1; then
    return 0
  fi

  echo "Error: command not found: ${command_name}" >&2
  return 1
}

read_json_value() {
  local file_path="${1:-}"
  local key="${2:-}"
  local line=""
  local current_key=""
  local current_value=""

  if [[ ! -f "${file_path}" ]]; then
    echo "Error: file not found: ${file_path}" >&2
    return 1
  fi

  while IFS= read -r line; do
    if [[ "${line}" =~ ^[[:space:]]*\"([^\"]+)\"[[:space:]]*:[[:space:]]*\"([^\"]*)\" ]]; then
      current_key="${BASH_REMATCH[1]}"
      current_value="${BASH_REMATCH[2]}"
      if [[ "${current_key}" == "${key}" ]]; then
        printf '%s\n' "${current_value}"
        return 0
      fi
    fi
  done < "${file_path}"

  echo "Error: key not found: ${key}" >&2
  return 1
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_09_demo
fi

# ---- FOLLOW ALONG ----
# TODO 1: Add a cleanup trap that removes a practice file when the script exits.
# TODO 2: Call require_command with a command you know exists and one that does not.
# TODO 3: Change safe_divide to validate non-numeric input.
# TODO 4: Create a tiny JSON file and try read_json_value against it.
