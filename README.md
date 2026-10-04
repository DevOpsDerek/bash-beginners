# Getting Started with Bash

[![CI](https://github.com/DevOpsDerek/bash-beginners/actions/workflows/ci.yml/badge.svg)](https://github.com/DevOpsDerek/bash-beginners/actions/workflows/ci.yml)

A beginner-friendly Bash course with 10 hands-on lessons, `shellcheck` linting, and `bats-core` tests.

GitHub Actions runs ShellCheck and the Bats suite on pushes and pull requests
to `main`. GitHub Actions and gh-aw automation are validated through the
centrally maintained `DevOpsDerek/workflows` repository.
A manually triggered documentation-upkeep workflow can propose at most one
documentation-only draft pull request; review any proposal before merging it.

## Course overview

This course teaches Bash fundamentals through small, heavily commented lesson scripts. Each lesson includes:

- a short explanation of core concepts
- safe, runnable demo code
- testable functions at the bottom
- follow-along TODO exercises
- a matching `bats-core` test file

## Prerequisites

- Bash 4+
- `shellcheck`
- `bats-core`
- Git (optional, for version control)

## Install tools

### macOS

```bash
brew install bash shellcheck bats-core
```

> macOS ships with Bash 3.2 by default. Install Homebrew Bash to use features taught in this course, such as uppercase/lowercase string conversion and associative arrays.

### Ubuntu / Debian

```bash
sudo apt-get update
sudo apt-get install -y bash shellcheck git
git clone https://github.com/bats-core/bats-core.git "$HOME/bats-core"
sudo "$HOME/bats-core/install.sh" /usr/local
```

## Repository layout

```text
.
├── README.md
├── .shellcheckrc
├── .gitignore
├── lint.sh
├── run-tests.sh
├── lessons/
├── tests/
└── .github/workflows/ci.yml
```

## How to run a lesson

Run a lesson directly:

```bash
./lessons/01-hello-world.sh Alice
```

Or source a lesson and call one of its functions:

```bash
. ./lessons/03-operators.sh
calculate 8 '*' 7
```

## Lint and test

Run the linter:

```bash
./lint.sh
```

Run the test suite:

```bash
./run-tests.sh
```

## Lesson summary

| Lesson | File | Topics |
| --- | --- | --- |
| 01 | `lessons/01-hello-world.sh` | output, variables, quoting, positional parameters |
| 02 | `lessons/02-variables-strings.sh` | string expansion, defaults, slicing, case conversion |
| 03 | `lessons/03-operators.sh` | arithmetic, comparisons, regex matching |
| 04 | `lessons/04-conditionals.sh` | `if`, `elif`, `else`, `case`, file tests |
| 05 | `lessons/05-loops.sh` | `for`, `while`, `until`, `break`, `continue` |
| 06 | `lessons/06-arrays.sh` | indexed arrays, associative arrays, joins, searches |
| 07 | `lessons/07-functions-basics.sh` | parameters, locals, return codes, reusable functions |
| 08 | `lessons/08-functions-advanced.sh` | `getopts`, iterative patterns, advanced function design |
| 09 | `lessons/09-error-handling.sh` | strict mode, traps, validation, safe failures |
| 10 | `lessons/10-capstone-file-io.sh` | file I/O, CSV data, reports, cleanup patterns |

## Beginner tips

- Quote variable expansions like `"$name"`.
- Prefer `[[ ... ]]` for Bash conditionals.
- Use `local` inside functions to avoid accidental global variables.
- Add `set -euo pipefail` to make scripts safer.
- Run `shellcheck` often — it catches common mistakes early.
- Read the tests to see how each function is expected to behave.
