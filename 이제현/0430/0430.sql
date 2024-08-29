insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('sale', 1, 's', '2024_04_30', 's_2024_04_30_', '아보카도', '.png', now(), 'user123', now(), 'user123', '2024_04_30/s_2024_04_30_아보카도.png');
insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('sale', 1, 'w', '2024_04_30', 'w_2024_04_30_', '아보카도', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_아보카도.png');
insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('sale', 1, 'w', '2024_04_30', 'w_2024_04_30_', '짱구', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구.png');

insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('community_board', 1, 'c', '2024_04_30', 'w_2024_04_30_', '짱구', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구.png');
insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('community_board', 1, 'c', '2024_04_30', 'w_2024_04_30_', '짱구', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구.png');
insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('community_board', 1, 'c', '2024_04_30', 'w_2024_04_30_', '짱구', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구.png');

insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('event', 1, 'e', '2024_04_30', 'w_2024_04_30_', '짱구1', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구1.png');
insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('event', 1, 'e', '2024_04_30', 'w_2024_04_30_', '짱구2', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구2.png');

insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('user_info', 1, 'e', '2024_04_30', 'w_2024_04_30_', '짱구1', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구1.png');
insert into img (tb_name, tb_no, imgtype, file_rt, u_name, o_name, e_name, first_date, first_id, last_date, last_id, img_full_rt)
values ('user_info', 1, 'e', '2024_04_30', 'w_2024_04_30_', '짱구1', '.png', now(), 'user123', now(), 'user123', '2024_04_30/w_2024_04_30_짱구1.png');

INSERT INTO sale (addr_cd, addr_name, seller_id, seller_nick, sal_i_cd, sal_name, pro_s_cd, tx_s_cd, trade_s_cd_1, trade_s_cd_2,
                  sal_s_cd, title, contents, price, bid_cd, pickup_addr_cd, pickup_addr_name, detail_addr, brand)
SELECT
    addr_cd,  -- 주소 코드 선택
    addr_name, -- 주소 이름 선택
    'david234', -- 판매자 ID
    (SELECT nick FROM user WHERE id='david234'), -- 판매자 닉네임 선택
    '001002002', -- 판매 카테고리 코드
    (SELECT name FROM sale_category WHERE sal_cd='001002002'), -- 판매 카테고리 이름 선택
    'S', -- 상품 상태 코드 (새 상품)
    'S', -- 거래 방식 코드 (직거래)
    'F', -- 거래 형태 코드 (온라인)
    'D', -- 거래 상태 코드 (판매 중)
    'S', -- 판매 상태 코드 (판매 중)
    '나이키 후드티 팝니다(거의 새상품)',
    '나이키 후드티 팝니다. 남녀 공용입니다. 사이즈 Free라서 다 입을 수 있어요!!! (생각보다 크게 나온거 같음) 구매해놓고 몇 번 안 입었습니다. 치즈톡 주세요.', -- 상품 설명
    35000, -- 가격
    'T', -- 가격제시/나눔 여부
    addr_cd, -- 픽업 장소 코드
    addr_name,
    '강남역 4번 출구 앞(지상)', -- 픽업 장소 이름
    '나이키' -- 브랜드
FROM
    addr_cd
WHERE
        ur_id = 'david234'
LIMIT 1 offset 0;


insert into community_board(ur_id, addr_cd,addr_no, commu_cd, addr_name, title, contents, nick) values('user123', '11010720',1,'commu_W','서울특별시 종로구 사직동','고민/상담테스트 제목1','고민/상담 테스트 내용1','skyLee');

INSERT INTO event(evt_cd, active_s_cd, title, contents, s_date, e_date, img_no, prize, ad_id)
values('N', 'P', '3월 신규 유저 환영 이벤트', '신규 유저 중 30분을 추첨하여 스타벅스 기프티콘을 드립니다.', '2024/03/01', '2024/03/31', 471,'스타벅스 기프티콘','admin001');
INSERT INTO event(evt_cd, active_s_cd, title, contents, s_date, e_date, img_no, prize, ad_id)
values('N', 'P', '3월 신규 유저 환영 이벤트', '신규 유저 중 30분을 추첨하여 스타벅스 기프티콘을 드립니다.', '2024/03/01', '2024/03/31', 472,'스타벅스 기프티콘','admin001');

insert into user_info (ur_id, nick, contents)
select id,nick,'안녕하세요'
from user
where id = 'david234';


select * from sale;
select * from community_board;
select * from event;
select * from user_info;

select count(*) from sale;

# 본문 이미지 리스트 가져오기 판매/커뮤니티 본문 이미지
select img_full_rt
from img
where tb_name='sale' and tb_no = 232 and imgtype = 'w' and state = 'Y';

# 서브쿼리 단점
# 연산 비용이 추가된다, 최적화를 받을 수 없다, 쿼리가 복잡해진다.

# 썸네일 이미지 리스트로 불러오기
SELECT s.*, i.img_full_rt
FROM sale s
         LEFT JOIN img i ON s.no = i.tb_no
WHERE i.tb_name = 'sale'
  AND i.imgtype = 's'
  AND i.state = 'Y'
LIMIT 10 OFFSET 0;

# 이벤트 이미지 여러개 불러오기용
SELECT e.*, i.img_full_rt
FROM event e
         LEFT JOIN img i ON e.evt_no = i.tb_no
WHERE i.tb_name = 'event'
  AND i.imgtype = 'e'
  AND i.state = 'Y'
LIMIT 10 OFFSET 0;

# 이벤트 이미지 하나 불러오기용
SELECT e.*, i.img_full_rt
FROM event e
         LEFT JOIN img i ON e.evt_no = i.tb_no
WHERE i.tb_name = 'event'
  AND i.imgtype = 'e'
  AND i.state = 'Y'
LIMIT 1 OFFSET 0;

# 유저 프로필 이미지 하나 불러오기용
SELECT u.*, i.img_full_rt
FROM user_info u
         LEFT JOIN img i ON u.img_no = i.no
WHERE i.tb_name = 'user_info'
  AND i.imgtype = 'u'
  AND i.state = 'Y'
LIMIT 1 OFFSET 0;

alter table event
    add img_full_rt text not null after contents;

alter table user_info
    add img_full_rt text not null after contents;

alter table sale
    add img_full_rt text not null after contents;

select img_full_rt
from img
where tb_name= 'event' and tb_no = 0 and imgtype = 'e' and state = 'Y';

select img_full_rt
from img
where tb_name= 'user_info' and tb_no = 0 and imgtype = 'u' and state = 'Y';