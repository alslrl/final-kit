#!/usr/bin/env bash
# 사용: bash .kit/scripts/register.sh <등록 이름> <역할> [--replace]
#   역할: main interview research build verify study docs
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; KIT="$ROOT/.kit"; S="$ROOT/ops/SESSIONS.md"
name="$1"; role="$2"; rep="$3"
case "$role" in main|interview|research|build|verify|study|docs) ;; *) echo "역할은 main interview research build verify study docs 중 하나"; exit 1;; esac
case "$name" in ""|*" "*|*"|"*) echo "등록 이름에 빈칸이나 | 를 쓰지 마세요"; exit 1;; esac
[ -f "$S" ] || { echo "ops/SESSIONS.md 없음. 먼저 install.sh"; exit 1; }
id="${CODEX_THREAD_ID:-}"
[ -n "$id" ] || { echo "CODEX_THREAD_ID가 비어 있음. Codex 세션 안에서 실행하세요."; exit 1; }
row="| $name | $role | $id | $(date '+%H:%M') |"
if awk -v n="| $name |" '/^## 명부/{on=1;next} on && index($0,n)==1{f=1} END{exit !f}' "$S"; then
  if [ "$rep" = "--replace" ]; then
    awk -v n="| $name |" -v r="$row" '/^## 명부/{on=1} on && index($0,n)==1{print r; next}{print}' "$S" > "$S.tmp" && mv "$S.tmp" "$S"
    echo "교체: $row"
  else echo "이미 등록된 이름: $name (이어받는 세션이면 --replace)"; exit 1; fi
else echo "$row" >> "$S"; echo "등록: $row"; fi
suffix="${name#*-}"; [ "$suffix" = "$name" ] && suffix=""
if [ "$role" = interview ]; then f="$ROOT/INTERVIEW${suffix:+-$suffix}.md"; [ -e "$f" ] || cp "$KIT/templates/INTERVIEW.md" "$f"; echo "내 파일: $(basename "$f")"; fi
if [ "$role" = build ]; then f="$ROOT/PLAN-${suffix:-$name}.md"; [ -e "$f" ] || cp "$KIT/templates/PLAN.md" "$f"; echo "내 파일: $(basename "$f")"; fi
echo "전달 방식: $(sed -n 's/^전달 방식: *//p' "$S" | head -1)"
echo "다음: .kit/roles/$role.md 읽기"
