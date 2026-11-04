#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
calculator="$script_dir/../simple-interest.sh"

assert_output() {
    local expected="$1"
    shift
    local actual

    actual="$("$calculator" "$@" | tail -n 1)"
    if [[ "$actual" != "$expected" ]]; then
        printf 'Expected "%s", got "%s"\n' "$expected" "$actual" >&2
        exit 1
    fi
}

assert_output "Simple Interest: 100.00" 1000 5 2
assert_output "Simple Interest: 12.50" 100 2.5 5
assert_output "Simple Interest: 0.00" 0 5 10

if "$calculator" 1000 -5 2 >/dev/null 2>&1; then
    printf 'Negative values should be rejected.\n' >&2
    exit 1
fi

if "$calculator" 1000 5 >/dev/null 2>&1; then
    printf 'An incomplete argument list should be rejected.\n' >&2
    exit 1
fi

printf 'All simple-interest tests passed.\n'
