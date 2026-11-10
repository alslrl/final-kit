#!/usr/bin/env bash
# 사용: bash .kit/scripts/mode.sh queue | "queue(승인 필요)" | 수동     (메인만)
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; S="$ROOT/ops/SESSIONS.md"
case "$1" in "queue"|"queue(승인 필요)"|"수동") ;; *) echo "queue / \"queue(승인 필요)\" / 수동 중 하나"; exit 1;; esac
awk -v m="$1" '/^전달 방식:/{print "전달 방식: " m; next}{print}' "$S" > "$S.tmp" && mv "$S.tmp" "$S"
grep '^전달 방식:' "$S"
