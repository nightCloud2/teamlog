# 공지사항 모음

## Index
- [:loudspeaker: 0422 공지사항](#0422-공지사항)
- [:loudspeaker: 0423 공지사항](#0423-공지사항)
- [:loudspeaker: 0424 공지사항](#0424-공지사항)
- [:loudspeaker: 0426 공지사항](#0426-공지사항)
- [:loudspeaker: 0429 공지사항](#0429-공지사항)
- [:loudspeaker: 0430 팀회의](#0430-팀회의)
- [:loudspeaker: 0502 팀회의](#0502-팀회의)
- [:loudspeaker: 0503 팀회의](#0503-팀회의)
- [:loudspeaker: 0508 팀회의](#0508-팀회의)
- [:loudspeaker: 치즈메이트 README](https://github.com/wafflu/teamlog/blob/master/소개용도.md)

<br><br>


# 0422-공지사항

Mail_classify

sale_img <- 교차에 넣어야하나?

마이페이지
마이페이지 - 회원탈퇴

- 취소 -> 사용자 소개글 페이지로 이동

3. 취소 버튼

- 메인 페이지로 이동

취소시 어디로 가는지 모르겠음

커뮤니티
alert 메세지창 버튼 2개로 바꾸면 좋을듯함
OK / Cancel - OK버튼을 누르면 로그인창으로 이동

블라블라, 고민/상담에 더보기란 추가가 있었으면 좋겠습니다

인기글 - 인기글 카테고리 클릭시 어떤 카테고리의 인기글인지 알수 있으면 좋겠습니다

금칙어 리스트 하나 추가가

문의하기

- 자주묻는질문 <- 설명 추가 클릭시 링크이동

판매 나눔 페이지 (41)
레이아웃 관련물어보기

---

<깃 remote 만드는 법>

1. remote 추가
   git remote add [별명] https://github.com/wafflu/teamlog.git

2. remote 확인
   git remote -v

```
$ git remote -v
origin  https://github.com/[본인깃id]/teamlog.git (fetch) => 내꺼
origin  https://github.com/[본인깃id]/teamlog.git (push)
[별명]  https://github.com/wafflu/teamlog.git (fetch) => 팀장꺼
[별명]  https://github.com/wafflu/teamlog.git (push)
```

3. pull 하기
   git pull [별명] master

---

<테이블 수정>

    1. sale
    	- tag 컬럼 삭제
    	- biding 컬럼명 bid_cd로 변경

    2. sale_history에서
    	- addr_name을 varchar(20)로 수정
    	- addr_nm 삭제
    	- tag 컬럼 삭제
    	- trade_s_cd_2를 null로 변경
    	- buy_id를 null로 변경
    	- buy_nick을 null로 변경

    3. user_info1
    	- user_info1에서 user_info로 테이블명 수정

    4. addr_cd
    	- 사용상태 default값 빠짐

    5. biding_history
    	- grand_state 컬럼명을 grant_state로 변경
    	- price를 null로 변경
    	- grant_date를 null로 변경

# 0423-공지사항

정렬기준 테이블 변경

<테이블 변경 빠진거>

1. alter table sale change biding bid_cd char;
2. biding_history 테이블
   - grant_date를 null로 변경
     - alter table biding_history modify grant_date timestamp NULL;
3. sale 테이블
   - up_cnt를 hoist_cnt로 변경
     - alter table sale change up_cnt hoist_cnt int;
   - hoisting을 h_date로 변경
     - alter table sale change hoisting h_date timestamp;
   - prop_cnt를 bid_cnt로 변경
     - alter table sale change prop_cnt bid_cnt int;
   - app_cnt를 삭제
     - alter table sale drop column app_cnt;
4. hoisting_history 테이블
   - hoisting을 h_date로 변경
     - alter table hoisting_history change hoisting h_date timestamp;

<br>

# 0424-공지사항

1. first_id - null 값 허용으로 변경

<br>

# 0426-추가사항

first_date 기본값 null값
이미지 테이블 변경
판매카테고리 전체 수정

<br>

# 0429-공지사항

실행 부탁드려요~

```
alter table sale_history
    modify addr_name varchar(100) not null;

alter table sale_history
    modify pickup_addr_name varchar(100) null;

alter table sale_history
    modify detail_addr text null;

alter table biding
    add bid_state char default 'Y' null after reason;

alter table biding_history
    drop column cx_date;

alter table biding_history
    add bid_state char not null comment '신청/취소 상태' after reason;

alter table biding_history
    modify bid_date timestamp not null comment '신청/취소한 일자';


alter table biding_history
    modify bid_state char not null comment '신청/취소 상태' after reason;

alter table biding_history
    modify bid_date timestamp not null comment '신청/취소한 일자';
```

<br>

# 0430-팀회의

1. 회의
   날짜를 정해두고 코드 발표시간 갖기(이번주 목 or 금)

- 안재헌, 진정훈 한데까지만 보고
- git commit 자주하기

2. 2차 개발 발표
   주마다 점검시간 갖기(월)

3. sql

- 이미지를 쪼갠다
- - join하지 않고 select하는 것으로

- join 사용하는 경우, subquery 사용하는 경우 고려하기

4. 시스템 컬럼

- first, last insert할 때 4개 다 넣기
- update할 때는 last만
- 날짜는 now()로 default 하면 됨

<br>

# 0502-팀회의

<p style="font-size:24px; font-weight='bold'; color='red';">서비스 단에서 예외처리할시 음수처리 꼭 필수</p><br>

- 팀 발표 - 5월7일(화) PM : 11:00
- Mockito : https://indigo-continent-753.notion.site/Mock-63709cb6242949758d9db8cc785d1448?pvs=4

- 세션관련 내일 회의하기

<br>

# 0503-팀회의
1. 세션 관련 회의
- 세션에 사용자id, 사용자nick, 주소관련 정보 저장

<br>

# 0508-팀회의

- 스프링부트 참고자료 : <a href="https://github.com/team-pepero/top-casting-be?tab=readme-ov-file">낚시 사이트임</a>

- 0509 - 김경식강사님의 ajax 강의 오후 2시
@ControllerAdvice - notion

# 0520
ImgRepository 안에 파일 넣어주기 

INSERT INTO img (group_no, imgtype, file_rt, u_name, o_name, e_name, img_full_rt, w_size, h_size, r_date, state, first_date, first_id, last_date, last_id) VALUES (0, 'home', 'img', 'store.png', 'store', '.png', 'img/store.png', 0, 0, '2024-05-19 21:18:58', 'Y', '2024-05-19 21:18:58', 'admin', '2024-05-19 21:18:58', 'admin');
INSERT INTO img (group_no, imgtype, file_rt, u_name, o_name, e_name, img_full_rt, w_size, h_size, r_date, state, first_date, first_id, last_date, last_id) VALUES (0, 'home', 'img', 'person.png', 'person', '.png', 'img/person.png', 0, 0, '2024-05-19 21:18:58', 'Y', '2024-05-19 21:18:58', 'admin', '2024-05-19 21:18:58', 'admin');
INSERT INTO img (group_no, imgtype, file_rt, u_name, o_name, e_name, img_full_rt, w_size, h_size, r_date, state, first_date, first_id, last_date, last_id) VALUES (0, 'home', 'img', 'search.png', 'search', '.png', 'img/search.png', 0, 0, '2024-05-19 21:18:58', 'Y', '2024-05-19 21:18:58', 'admin', '2024-05-19 21:18:58', 'admin');
INSERT INTO img (group_no, imgtype, file_rt, u_name, o_name, e_name, img_full_rt, w_size, h_size, r_date, state, first_date, first_id, last_date, last_id) VALUES (0, 'home', 'img', 'logo.png', 'logo', '.png', 'img/logo.png', 0, 0, '2024-05-19 21:18:58', 'Y', '2024-05-19 21:18:58', 'admin', '2024-05-19 21:18:58', 'admin');
INSERT INTO img (group_no, imgtype, file_rt, u_name, o_name, e_name, img_full_rt, w_size, h_size, r_date, state, first_date, first_id, last_date, last_id) VALUES (0, 'home', 'img', 'chat.png', 'chat', '.png', 'img/chat.png', 0, 0, '2024-05-19 21:18:58', 'Y', '2024-05-19 21:18:58', 'admin', '2024-05-19 21:18:58', 'admin');
