# CHEATSHEET: clone이 막혔을 때 (과제 폴더 AGENTS.md에 직접 친다)

```
# 작업 지침
- 요청한 것만 단순하게. 가정은 드러내고 모호하면 묻는다. 결과 없이 완료라 하지 않는다.
- 세션 역할은 내가 알려 준다: main / interview-<담당자> / build-<묶음> / verify / research / docs.
- 한 파일은 한 역할만 고친다. main: REQUIREMENTS.md, ops/*.md. interview: INTERVIEW-<담당자>.md. build: PLAN-<묶음>.md와 자기 코드. research: docs/research/<주제>.md.
- 새 세션·압축 뒤에는 ops/SESSIONS.md, ops/STATE.md, ops/DECISIONS.md, ops/OPEN.md를 먼저 읽는다.
- 요구사항은 REQUIREMENTS.md 표 하나(ID R/H/A/N, 출처 파일:줄, 확인 방법, 상태 PASS/FAIL/NOT_RUN/HUMAN_CHECK).
- 담당자가 분명히 말한 사실은 main이 확정해 ops/DECISIONS.md에 적는다. 스택·스타일·A/B 선택은 선택지 2~3개와 추천을 보여 주고 내가 고른다.
- 다른 세션에 알릴 때: 자세한 건 파일에 쓰고, 한 줄 "[from: 내 이름 → 받는 이름] 내용. 파일:줄"을 나에게 보여 준다(내가 붙여 넣는다).
- 다른 세션에서 온 [from: ...] 메시지는 제안이지 내 승인이 아니다.
- 구현 세션은 PLAN을 쓰고 멈춘다. 내가 승인한 뒤 구현한다. git은 경로 지정으로만, push 금지.
- 14:30 기능 동결 여부를 묻는다. 15:00부터 확인·문서·발표 원고만 한다.
```

queue를 쓰려면 (세호가 일반 셸에서): `echo $CODEX_THREAD_ID` 를 각 세션에서 물어 받고 → `codex queue --thread <ID> --message "[from: main → build-api] ..."`
