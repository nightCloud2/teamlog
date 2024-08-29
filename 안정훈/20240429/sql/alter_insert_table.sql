-- 쿼리 변경 부분
alter table sale_history
    modify addr_name varchar(101) not null;

alter table sale_history
    modify pickup_addr_name varchar(100) null;
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

-- insert문
INSERT INTO teamproject.user (id, pw, name, nick, birth, gender, phone_num, safe_num, foreigner, email, s_cd, addr_det, first_date, first_id, last_date, last_id) VALUES ('asdf', '1234', '김스프링', '봄', '2001-03-03', 'F', '01012345678', '05012345678', 'N', 'asdf@naver.com', 'O', '123-24', '2024-04-22 19:47:00', 'admin', '2024-04-22 19:47:00', 'admin');
INSERT INTO teamproject.user (id, pw, name, nick, birth, gender, phone_num, safe_num, foreigner, email, s_cd, addr_det, first_date, first_id, last_date, last_id) VALUES ('david234', 'david995', '데이비드', 'minyoung', '1995-05-21', 'M', '01098765432', '05023002690', 'Y', 'markdavid@naver.com', 'F', '88-27', '2024-04-23 10:25:25', '', null, null);
INSERT INTO teamproject.user (id, pw, name, nick, birth, gender, phone_num, safe_num, foreigner, email, s_cd, addr_det, first_date, first_id, last_date, last_id) VALUES ('user001', '1234', '사용자01', '방가방가', '1980-03-11', 'M', '01012345678', '05098761234', 'N', 'user001@gmail.com', 'O', 'ㅇㅇ로', '2024-04-25 10:41:00', null, null, null);
INSERT INTO teamproject.user (id, pw, name, nick, birth, gender, phone_num, safe_num, foreigner, email, s_cd, addr_det, first_date, first_id, last_date, last_id) VALUES ('user123', '1234', '이하늘', 'skyLee', '1990-05-21', 'F', '01098765432', '05043202568', 'N', 'sky90@google.com', 'O', '사직로8길 4', '2024-04-23 10:25:25', '', null, null);

INSERT INTO teamproject.addr_cd (no, ur_id, addr_cd, addr_name, state, first_date, first_id, last_date, last_id) VALUES (1, 'user123', '11010720', '서울특별시 종로구 사직동', 'Y', '2024-04-23 10:24:58', '', null, null);
INSERT INTO teamproject.addr_cd (no, ur_id, addr_cd, addr_name, state, first_date, first_id, last_date, last_id) VALUES (2, 'david234', '11010530', '서울특별시 종로구 청운효자동', 'Y', '2024-04-23 10:24:58', '', null, null);
INSERT INTO teamproject.addr_cd (no, ur_id, addr_cd, addr_name, state, first_date, first_id, last_date, last_id) VALUES (3, 'asdf', '11060710', '서울특별시 동대문구 회기동', 'Y', '2024-04-23 10:24:58', '', null, null);
INSERT INTO teamproject.addr_cd (no, ur_id, addr_cd, addr_name, state, first_date, first_id, last_date, last_id) VALUES (4, 'asdf', '11060720', '서울특별시 동대문구 휘경1동', 'Y', '2024-04-23 10:24:58', '', null, null);
INSERT INTO teamproject.addr_cd (no, ur_id, addr_cd, addr_name, state, first_date, first_id, last_date, last_id) VALUES (5, 'user001', '11060710', '서울특별시 동대문구 회기동', 'Y', '2024-04-23 10:24:00', null, null, null);
INSERT INTO teamproject.addr_cd (no, ur_id, addr_cd, addr_name, state, first_date, first_id, last_date, last_id) VALUES (6, 'user001', '11060720', '서울특별시 동대문구 휘경1동', 'Y', '2024-04-23 10:24:00', null, null, null);



select * from sale;

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
    'hi',
    '강남역 4번 출구 앞(지상)', -- 픽업 장소 이름
    '나이키' -- 브랜드
FROM
    addr_cd
WHERE
    ur_id = 'david234'
LIMIT 1 offset 0;

INSERT INTO sale (addr_cd, addr_name, seller_id, seller_nick, sal_i_cd, sal_name, pro_s_cd, tx_s_cd, trade_s_cd_1,
                  sal_s_cd, title, contents, bid_cd, pickup_addr_cd, pickup_addr_name, detail_addr, brand, first_id, last_id)
SELECT
    a.addr_cd,  -- 주소 코드 선택
    a.addr_name, -- 주소 이름 선택
    'asdf', -- 판매자 ID
    (SELECT nick FROM user WHERE id='asdf'), -- 판매자 닉네임 선택
    '010002001', -- 판매 카테고리 코드
    (SELECT name FROM sale_category WHERE sal_cd='010002001'), -- 판매 카테고리 이름 선택
    'C', -- 상품 상태 코드 (새 상품)
    'F', -- 거래 방식 코드 (직거래)
    'O', -- 거래 형태 코드 (온라인)
    'S', -- 판매 상태 코드 (판매 중)
    '[나눔]캠핑 의자',
    '캠핑의자 처분합니다.
사정상 캠핑을 앞으로 못갈꺼 같아서 나눔합니다.', -- 상품 설명
    'F', -- 가격제시/나눔 여부
    '11010530', -- 픽업 장소 코드
    (select addr_name as pickup_addr_cd from administrative where 1=1 and addr_cd='11010530'),
    '강남역 4번 출구 앞(지상)', -- 픽업 장소 이름
    '나이키', -- 브랜드
    'admin', -- 최초 작성자 ID
    'admin' -- 최종 수정자 ID
FROM
    addr_cd a
WHERE
    a.ur_id = 'asdf'
LIMIT 1 OFFSET 1;

select * from sale_history;

INSERT INTO biding(sal_no, addr_cd, addr_name, bid_cd, buyer_id, reason, bid_date, first_id, last_id)
SELECT
    no,
    addr_cd,
    addr_name,
    bid_cd,
    'user123',
    '받고싶어요 제발제발',
    now(),
    'admin',
    'admin'
FROM
    sale a
WHERE
    no = '6'
LIMIT 1;

select * from biding;
select * from biding_history;