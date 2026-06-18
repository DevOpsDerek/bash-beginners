#!/usr/bin/env bash
set -euo pipefail

# Lesson 05: Loops
# Learning objectives:
#   - Iterate with for, while, and until loops.
#   - Use break and continue to control flow.
#   - Generate ranges with seq.
#   - Loop over command output safely.
# Estimated time: 20 minutes
# Prerequisites: Lessons 01-04, Bash 4+

show_lesson_05_demo() {
  local item
  local counter=1

  for item in red green blue; do
    echo "Color: ${item}"
  done

  for ((item = 1; item <= 3; item++)); do
    echo "C-style loop value: ${item}"
  done

  while [[ "${counter}" -le 3 ]]; do
    echo "While counter: ${counter}"
    ((counter++))
  done

  until [[ "${counter}" -gt 5 ]]; do
    echo "Until counter: ${counter}"
    ((counter++))
  done

  for item in $(seq 1 5); do
    if [[ "${item}" -eq 2 ]]; then
      continue
    fi
    if [[ "${item}" -eq 5 ]]; then
      break
    fi
    echo "Controlled loop value: ${item}"
  done
}

get_factorial() {
  local number="${1:-}"
  local result=1
  local current

  if [[ ! "${number}" =~ ^[0-9]+$ ]]; then
    echo "Error: number must be 0 or greater" >&2
    return 1
  fi

  for ((current = 2; current <= number; current++)); do
    result=$((result * current))
  done

  printf '%s\n' "${result}"
}

get_fizzbuzz() {
  local maximum="${1:-}"
  local current

  if [[ ! "${maximum}" =~ ^[0-9]+$ ]]; then
    echo "Error: maximum must be 0 or greater" >&2
    return 1
  fi

  for ((current = 1; current <= maximum; current++)); do
    if (( current % 15 == 0 )); then
      printf 'FizzBuzz\n'
    elif (( current % 3 == 0 )); then
      printf 'Fizz\n'
    elif (( current % 5 == 0 )); then
      printf 'Buzz\n'
    else
      printf '%s\n' "${current}"
    fi
  done
}

get_even_numbers() {
  local maximum="${1:-}"
  local current

  if [[ ! "${maximum}" =~ ^[0-9]+$ ]]; then
    echo "Error: maximum must be 0 or greater" >&2
    return 1
  fi

  for ((current = 2; current <= maximum; current += 2)); do
    printf '%s\n' "${current}"
  done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_05_demo
fi

# ---- FOLLOW ALONG ----
# TODO 1: Print the odd numbers from 1 to 9.
# TODO 2: Write a loop that stops when it sees the word stop.
# TODO 3: Use seq to print numbers 10 through 15.
# TODO 4: Call get_fizzbuzz 20 and compare the output to your expectations.
