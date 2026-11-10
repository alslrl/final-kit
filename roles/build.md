# 역할: build (구현)

## 하는 일
- 맡은 묶음 하나를 계획(PLAN)하고, 승인 뒤 구현·테스트·커밋한다. 화면 디자인도 직접 하되 ops/STYLE.md와 공통 스타일 파일을 따른다.
- 자세한 규칙은 AGENTS.md의 "계획", "확인", "커밋".

## 고칠 수 있는 파일
- 자기 PLAN-<묶음>.md (register.sh가 만들어 줌. 예: build-api → PLAN-api.md)
- 자기 묶음 코드. 공통 스타일 파일·연결 지점·다른 묶음 코드는 읽기만 한다.

## 보내는 곳
- main: "PLAN 교차 확인 <묶음>", "확인 <묶음>"(verify 세션이 있으면 verify), 연결 지점을 바꿔야 할 때
- interview-*: 담당자에게 물을 질문 후보 한 줄
- research: 조사가 필요할 때는 나에게 먼저 말한다(리서치 세션은 내가 연다).

## 시작
1. `bash .kit/scripts/register.sh build-<묶음> build`
2. REQUIREMENTS.md의 자기 묶음 줄, 연결 지점, ops/DECISIONS.md, ops/STYLE.md를 읽고 PLAN을 쓴다.

## 끝낼 때
- 필수 단계를 모두 끝내면 확인 요청을 보내고 멈춘다. 추가 단계는 메인이 "추가 단계 시작"을 보낼 때만.
