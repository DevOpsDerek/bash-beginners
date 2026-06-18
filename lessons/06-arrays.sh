#!/usr/bin/env bash
set -euo pipefail

# Lesson 06: Arrays
# Learning objectives:
#   - Build indexed arrays with arr=(...).
#   - Read elements with ${arr[@]} and count them with ${#arr[@]}.
#   - Slice arrays and loop through them.
#   - Store key/value data in associative arrays.
# Estimated time: 20 minutes
# Prerequisites: Lessons 01-05, Bash 4+

show_lesson_06_demo() {
  local fruits=(apple banana cherry)
  local fruit
  declare -A capitals=( [france]=paris [japan]=tokyo )

  echo "First fruit: ${fruits[0]}"
  echo "All fruits: ${fruits[*]}"
  echo "Fruit count: ${#fruits[@]}"
  local fruit_slice=("${fruits[@]:1:2}")

  printf 'Slice of fruits: %s\n' "${fruit_slice[*]}"

  for fruit in "${fruits[@]}"; do
    echo "Fruit item: ${fruit}"
  done

  echo "Capital of France: ${capitals[france]}"
}

array_sum() {
  local sum=0
  local value

  for value in "$@"; do
    sum=$((sum + value))
  done

  printf '%s\n' "${sum}"
}

array_contains() {
  local needle="${1:-}"
  shift || true
  local value

  for value in "$@"; do
    if [[ "${value}" == "${needle}" ]]; then
      return 0
    fi
  done

  return 1
}

array_join() {
  local delimiter="${1:-}"
  shift || true
  local joined=""
  local value

  for value in "$@"; do
    if [[ -z "${joined}" ]]; then
      joined="${value}"
    else
      joined+="${delimiter}${value}"
    fi
  done

  printf '%s\n' "${joined}"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  show_lesson_06_demo
fi

# ---- FOLLOW ALONG ----
# TODO 1: Create an array of three commands you use often.
# TODO 2: Print the last element in that array.
# TODO 3: Add a new key/value pair to the associative array example.
# TODO 4: Call array_join with a comma and a few words.
