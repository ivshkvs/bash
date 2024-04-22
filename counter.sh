#!/bin/bash

code="$1"
time_begin=$(date -jf "%Y-%m-%d %H:%M:%S" "$2" "+%s")
time_end=$(date -jf "%Y-%m-%d %H:%M:%S" "$3" "+%s")
logfile="$4"

# Errors counter
errors=$(awk -F ':' -v code="$code" -v begin="$time_begin" -v end="$time_end" '$2 == code && $1 >= begin && $1 <= end {count++} END {print count}' "$logfile")

# Result
if [ -z "$errors" ]; then
    echo "No match for error code $code."
else
    echo "Number of error codes $code from [$2] to [$3] - [$errors]"
fi
