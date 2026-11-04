#!/usr/bin/env bash

set -euo pipefail

usage() {
    cat <<'EOF'
Usage:
  simple-interest.sh [PRINCIPAL RATE TIME]
  simple-interest.sh --help

Calculate simple interest using:
  (principal * rate * time) / 100
EOF
}

is_non_negative_number() {
    [[ "$1" =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]]
}

read_value() {
    local label="$1"
    local value

    read -r -p "$label" value
    printf '%s' "$value"
}

validate_value() {
    local name="$1"
    local value="$2"

    if ! is_non_negative_number "$value"; then
        printf 'Error: %s must be a non-negative number.\n' "$name" >&2
        exit 1
    fi
}

if [[ "$#" -eq 1 && "$1" == "--help" ]]; then
    usage
    exit 0
fi

if [[ "$#" -ne 0 && "$#" -ne 3 ]]; then
    usage >&2
    exit 2
fi

echo "Simple Interest Calculator"

if [[ "$#" -eq 3 ]]; then
    principal="$1"
    rate="$2"
    time="$3"
else
    principal="$(read_value 'Enter Principal Amount: ')"
    rate="$(read_value 'Enter Rate of Interest: ')"
    time="$(read_value 'Enter Time Period (in years): ')"
fi

validate_value "principal" "$principal"
validate_value "rate" "$rate"
validate_value "time" "$time"

interest="$(awk -v principal="$principal" -v rate="$rate" -v time="$time" \
    'BEGIN { printf "%.2f", (principal * rate * time) / 100 }')"

printf 'Simple Interest: %s\n' "$interest"
