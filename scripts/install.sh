#!/usr/bin/env bash
# 사용: 과제 폴더 루트에서  bash .kit/scripts/install.sh
set -e
KIT="$(cd "$(dirname "$0")/.." && pwd)"
{ [ -s AGENTS.md ] && printf '\n\n'; cat "$KIT/AGENTS.md"; } >> AGENTS.md
mkdir -p ops docs/research
for f in SESSIONS STATE DECISIONS OPEN MESSAGES; do
  [ -e "ops/$f.md" ] || cp "$KIT/templates/ops/$f.md" "ops/$f.md"
done
[ -e REQUIREMENTS.md ] || cp "$KIT/templates/REQUIREMENTS.md" REQUIREMENTS.md
if [ -d .git ]; then
  { mkdir -p .git/info && { grep -qxF '.kit/' .git/info/exclude 2>/dev/null || echo '.kit/' >> .git/info/exclude; }; } 2>/dev/null \
    || echo "note: .git/info/exclude에 쓰지 못했습니다. .kit/는 커밋하지 마세요."
  if [ -z "$(git config user.name 2>/dev/null)" ] || [ -z "$(git config user.email 2>/dev/null)" ]; then
    { git config user.name "Seho Sohn (Codex)" && git config user.email codex@localhost; } 2>/dev/null \
      && echo "note: 이 폴더에만 git 사용자 설정을 넣었습니다." || echo "note: git 사용자 설정을 넣지 못했습니다."
  fi
fi
echo "done: AGENTS.md 덧붙임, ops/ · REQUIREMENTS.md · docs/research/ 준비"
echo "다음: bash .kit/scripts/envcheck.sh  → 그다음 Codex를 (다시) 실행"
