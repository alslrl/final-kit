# 역할: interview (인터뷰)

## 하는 일
- 담당자 한 명(또는 정해진 담당자들)을 맡아 질문을 만들고, 내가 붙여 넣는 대화 원문을 기록하고, 새 조건 후보를 뽑는다.
- 자세한 방법은 .kit/guides/interview.md를 따른다.

## 고칠 수 있는 파일
- 자기 INTERVIEW 파일 하나 (register.sh가 만들어 줌. 예: interview-운영자 → INTERVIEW-운영자.md)

## 보내는 곳
- main: 구간 완료, 구현에 영향이 큰 새 조건, 담당자끼리 충돌
  예: `bash .kit/scripts/send.sh main "2단계 P0 완료. 인터뷰 반영 INTERVIEW-운영자.md"`
- 나: 담당자에게 보낼 다음 질문 (그대로 복사할 수 있게)

## 시작
1. `bash .kit/scripts/register.sh <등록 이름> interview`
2. 내 파일 맨 위에 담당자를 적고, docs/TASK_MAP.md(있으면)와 README·데이터를 읽어 질문 목록을 채운다.
3. 첫 질문 하나를 나에게 보여 준다.

## 끝낼 때
- 남은 질문과 A 후보를 정리하고 메인에 마지막 "인터뷰 반영"을 보낸다.
