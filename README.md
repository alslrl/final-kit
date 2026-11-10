# final-kit

SK하이닉스 AI 해커톤 결선용 개인 작업 지침입니다. Codex CLI 세션 여러 개가 역할을 나눠 일하면서, 정해진 것과 안 정해진 것, 누가 무엇을 하는지를 파일(ops/)로 함께 봅니다. 과제 결과물이나 정답 코드는 들어 있지 않습니다.

## 설치 (과제 폴더 루트에서)

```bash
git clone --depth 1 https://github.com/alslrl/final-kit .kit && bash .kit/scripts/install.sh && bash .kit/scripts/envcheck.sh
```

설치 후 Codex를 (다시) 실행해야 AGENTS.md를 읽습니다.

## 진행 순서

1. 첫 터미널에서 `codex` → "너는 main 세션이야. 역할은 main. main.md 시작 순서대로 진행해." (등록 → 서브에이전트로 README·데이터 파악 → 과제의 큰 흐름(docs/TASK_MAP.md)을 보여 주고 멈춤)
2. 큰 흐름을 보고 모르겠거나 알아볼 것을 말하면 메인이 docs/QUESTIONS.md에 적음 → 요구사항 표 → 필요한 세션 제안(리서치·공부 세션은 docs/를 읽고 시작)
3. 메인이 제안한 세션 목록(등록 이름, 역할, 첫 문장) 중에서 내가 정함
4. 터미널을 하나씩 열어 `codex` → 메인이 준 첫 문장을 붙여 넣음. 각 세션은 `register.sh`로 자기 ID를 명부에 적음
5. 메인이 첫 인터뷰 세션으로 전달 테스트 → 전달 방식(queue / queue(승인 필요) / 수동) 결정
6. 이후 세션끼리는 `send.sh`로 한 줄 메시지. 수동 모드면 세션이 출력한 [전달할 문장]을 내가 해당 터미널에 붙여 넣음

## 당일 뜰 수 있는 창 (Nomad 0.163 리허설 기준)

- 업데이트 안내 → 2. Skip / 폴더 신뢰 → 1. Trust and continue
- 기본 샌드박스에서는 `codex queue`와 `.git` 쓰기가 막혀 승인 창이 뜹니다. 아래 세 가지는 처음 뜰 때 `p`(다시 묻지 않기)를 고르면 이후 묻지 않습니다.
  - `bash .kit/scripts/send.sh` (세션마다 한 번)
  - `git add`, `git commit`

## 들어 있는 것

- `AGENTS.md`: 공통 규칙 (설치 시 과제 폴더 AGENTS.md 끝에 덧붙음)
- `roles/`: 역할 카드 7개. main, interview, research, build, verify, study, docs
- `templates/ops/`: 원장 양식. SESSIONS(명부·전달 방식), STATE, DECISIONS, OPEN, MESSAGES
- `templates/`: REQUIREMENTS, INTERVIEW, PLAN, VERIFY-SECTION
- `guides/`: 인터뷰 방법, 과제 지도, 서술형 대비
- `scripts/`: install, envcheck, register(명부 등록), send(메시지), ack(전달 테스트 수신), mode(전달 방식 기록)
- `CHEATSHEET.md`: clone이 막힐 때 직접 칠 최소 규칙

## 확인된 동작 (2026-11-10)

- `codex queue --thread <ID> --message ...`는 대기 중인 대화형 세션에 바로 들어가 처리됩니다. 작업 중인 세션은 지금 턴이 끝난 뒤 받습니다.
- 세션 안 AI가 기본 샌드박스에서 `codex queue`를 실행하면 실패합니다. 샌드박스 밖 실행 승인이 필요합니다.
- 큐로 받은 메시지는 받는 세션에 사용자 입력처럼 보입니다. 그래서 send.sh가 `[from: 보낸 이름 → 받는 이름]`을 붙이고, AGENTS.md는 이를 승인으로 보지 않게 합니다.
