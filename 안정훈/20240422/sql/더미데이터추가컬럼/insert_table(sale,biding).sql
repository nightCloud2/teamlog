INSERT INTO sale (addr_cd, addr_name, seller_id, seller_nick, sal_i_cd, sal_name, pro_s_cd, tx_s_cd, trade_s_cd_1, trade_s_cd_2,
                  sal_s_cd, title, contents, price, biding, pickup_addr_cd, pickup_addr_name, detail_addr, brand, first_idno, last_idno)
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
    '나이키', -- 브랜드
    'admin', -- 최초 작성자 ID
    'admin' -- 최종 수정자 ID
FROM
    addr_cd
WHERE
    ur_id = 'david234'
LIMIT 1;
-- select addr_cd, addr_name, addr_cd, addr_name from addr_cd;

insert into sale
values ( );

-- 사용자의 닉네임의 경우 화면 개발할때 session에 저장해서 넣어도 될 것 같음

INSERT INTO sale (addr_cd, addr_name, seller_id, seller_nick, sal_i_cd, sal_name, pro_s_cd, tx_s_cd, trade_s_cd_1,
                  sal_s_cd, title, contents, biding, pickup_addr_cd, pickup_addr_name, detail_addr, brand, first_idno, last_idno)
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
LIMIT 1 OFFSET 1; -- 두 번째 주소 코드에 해당하는 행 선택(첫밴째일 경우 OFFSET 0)

-- select addr_cd from addr_cd
-- where ur_id = 'asdf'
-- LIMIT 1 OFFSET 1; -- 두 번째 주소 코드에 해당하는 행 선택

-- 나눔신청 insert
INSERT INTO biding(sal_no, addr_cd, addr_name, bid_cd, buyer_id, reason, bid_date, first_idno, last_idno)
SELECT
    sn,
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
    sn = '11010744'
LIMIT 1;

select * from sale;