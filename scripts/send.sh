#!/usr/bin/env bash
# 사용: bash .kit/scripts/send.sh <받는 등록 이름> "<한 줄>"
#       bash .kit/scripts/send.sh --test <받는 등록 이름>     (메인: 전달 방식 판정용)
# 종료 코드: 0 보냄 또는 수동 출력 / 2 받는 이름 없음 / 3 전송 실패(수동 문장 출력함)
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; S="$ROOT/ops/SESSIONS.md"; M="$ROOT/ops/MESSAGES.md"
test=""; [ "$1" = "--test" ] && { test=1; shift; }
to="$1"; shift; msg="$*"
col(){ awk -F'|' -v k="$1" -v c="$2" -v want="$3" '/^## 명부/{on=1;next} on{g=$c; gsub(/^ +| +$/,"",g); if(g==k){x=$want; gsub(/^ +| +$/,"",x); print x; exit}}' "$S"; }
mode="$(sed -n 's/^전달 방식: *//p' "$S" | head -1)"
me="$(col "${CODEX_THREAD_ID:-none}" 4 2)"; me="${me:-세호}"
if [ -n "$test" ]; then code="T$(date +%H%M%S)"; msg="[전달 테스트 $code] 받았으면 bash .kit/scripts/ack.sh $code 만 실행하고 다른 답은 하지 마세요."; fi
text="[from: $me → $to] $msg"
log(){ echo "- $(date '+%H:%M:%S') | $me → $to | $1 | $msg" >> "$M"; }
manual(){ echo "[전달할 문장] ($to 터미널에 붙여 넣기)"; echo "$text"; }
toid="$(col "$to" 2 4)"
if [ "$mode" = "수동" ]; then manual; log "수동"; exit 0; fi
if [ -z "$toid" ]; then echo "명부에 '$to' 없음. ops/SESSIONS.md 확인"; manual; log "이름 없음"; exit 2; fi
out="$(codex queue --thread "$toid" --message "$text" 2>&1)"; rc=$?
if [ $rc -eq 0 ]; then
  echo "보냄 → $to"; log "queue 보냄"
  [ -n "$test" ] && echo "수신 확인: 20초쯤 뒤 bash .kit/scripts/ack.sh --check $code"
  exit 0
fi
echo "전송 실패: $(echo "$out" | tail -1)"; manual; log "queue 실패"; exit 3
