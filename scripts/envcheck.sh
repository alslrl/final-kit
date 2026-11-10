#!/usr/bin/env bash
# 사용: bash .kit/scripts/envcheck.sh   → ops/ENV.md 에 기록 (전달 방식은 정하지 않는다)
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; OUT="$ROOT/ops/ENV.md"; mkdir -p "$ROOT/ops"
v(){ command -v "$1" >/dev/null 2>&1 && { "$@" 2>&1 | head -1; } || echo "없음"; }
net(){ code=$(curl -sS -m 5 -o /dev/null -w '%{http_code}' "$1" 2>/dev/null); echo "${code:-실패}"; }
{
  echo "# ENV ($(date '+%m-%d %H:%M'))"
  echo "- 폴더: $ROOT"
  echo "- codex: $(v codex --version)"
  echo "- codex queue: $(codex queue --help >/dev/null 2>&1 && echo 있음 || echo 없음)"
  echo "- CODEX_THREAD_ID: ${CODEX_THREAD_ID:-(이 셸에는 없음. Codex 세션 안에서만 보임)}"
  echo "- python3: $(v python3 --version) / pip: $(v pip3 --version | cut -d' ' -f1-2)"
  echo "- node: $(v node --version) / npm: $(v npm --version)"
  echo "- git: $(v git --version)"
  echo "- 인터넷: pypi $(net https://pypi.org/simple/) / npm $(net https://registry.npmjs.org/) / github $(net https://github.com)"
} > "$OUT"
cat "$OUT"
