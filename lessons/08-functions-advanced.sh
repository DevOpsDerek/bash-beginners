#!/usr/bin/env bash
set -euo pipefail

# Lesson 08: Functions Advanced
# Learning objectives:
#   - Parse flags with getopts.
#   - Return values through stdout for command substitution.
#   - Prefer iterative solutions when reliability matters.
#   - Learn the idea of passing arrays by name in Bash 4+.
# Estimated time: 20 minutes
# Prerequisites: Lessons 01-07, Bash 4+

show_lesson_08_demo() {
  # Values are commonly "returned" by printing them so callers can capture them.
  local computed_value
  computed_value="$(fibonacci 8)"
  echo "Captured fibonacci value: ${computed_value}"

  # Bash 4.3+ can pass arrays by name with local -n.
  # Example:
  #   show_items() {
  #     local -n items_ref="$1"
  #     printf '%s\n' "${items_ref[@]}"
  #   }
}

parse_options() {
  local name=""
  local verbose=0
  local option
  local OPTIND=1

  while getopts ':n:v' option; do
    case "${option}" in
      n)
        name="${OPTARG}"
        ;;
      v)
        verbose=1
        ;;
      :)
        echo "Error: option requires a value: -${OPTARG}" >&2
        return 1
        ;;
      ?)
        echo "Error: invalid option: -${OPTARG}" >&2
        return 1
        ;;
      *)
        echo "Error: unexpected parsing state" >&2
        return 1
        ;;
    esac
  done

  printf 'name=%s verbose=%s\n' "${name}" "${verbose}"
}

fibonacci() {
  local n="${1:-}"
  local previous=0
  local current=1
  local next_value=0
  local index

  if [[ ! "${n}" =~ ^[0-9]+$ ]]; then
    echo "Error: n must be 0 or greater" >&2
    return 1
  fi

  if [[ "${n}" -eq 0 ]]; then
    printf '0\n'
    return 0
  fi

  if [[ "${n}" -eq 1 ]]; then
    printf '1\n'
    return 0
  fi

  for ((index = 2; index <= n; index++)); do
    next_value=$((previous + current))
    previous=${current}
    current=${next_value}
  done

  printf '%s\n' "${current}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_08_demo
  parse_options -n learner -v
fi

# ---- FOLLOW ALONG ----
# TODO 1: Add a short flag like -q for quiet mode to parse_options.
# TODO 2: Capture the output of parse_options into a variable.
# TODO 3: Compare an iterative Fibonacci solution with a recursive one.
# TODO 4: Try writing an array-by-name helper if your Bash version supports local -n.
