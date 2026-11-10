#!/usr/bin/env bash
# 사용: bash .kit/scripts/ack.sh <코드>          (받은 세션: 전달 테스트 수신 기록)
#       bash .kit/scripts/ack.sh --check <코드>  (메인: 받았는지 확인)
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; M="$ROOT/ops/MESSAGES.md"; S="$ROOT/ops/SESSIONS.md"
if [ "$1" = "--check" ]; then grep -Eq "^- [0-9]{2}:[0-9]{2}:[0-9]{2} \| ack $2 \| " "$M" && { echo "받음: $2"; exit 0; } || { echo "아직 안 받음: $2"; exit 1; }; fi
me="$(awk -F'|' -v k="${CODEX_THREAD_ID:-none}" '/^## 명부/{on=1;next} on{g=$4; gsub(/^ +| +$/,"",g); if(g==k){x=$2; gsub(/^ +| +$/,"",x); print x; exit}}' "$S")"
echo "- $(date '+%H:%M:%S') | ack $1 | ${me:-unknown} 받음" >> "$M"; echo "기록함: ack $1"
