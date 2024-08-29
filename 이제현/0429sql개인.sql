select * from sale;
select * from sale_img;
select * from img;

# 썸네일용 가져오기
select s.no as s_no, i.imgtype, s.title as s_title, s.price as s_price, s.r_date as s_r_date, i.file_rt, i.u_name, i.o_name, i.e_name
from img i, sale s, sale_img si
where si.sal_no = s.no and si.img_no = i.no and i.imgtype = 's';

#선택한 게시글의 이미지 불러오기
select i.file_rt, i.u_name, i.o_name, i.e_name
from img i, sale s, sale_img si
where si.sal_no = s.no and si.img_no = i.no and s.no = 41 and i.imgtype = 'w';


# 아래 커뮤이미지랑 판매이미지 만드는 과정
INSERT INTO community_img (post_no, img_no)
SELECT s.sn AS post_no, i.no AS img_no
FROM post s, img i
where s.sn = 3 and i.tb_name = 'post' and i.tb_no = 3;

select * from community_img;
select * from post;

INSERT INTO sale_img (sal_no, img_no)
SELECT s.no AS sale_no, i.no AS img_no
FROM sale s, img i
where s.no = 28 and i.tb_name = 'sale' and i.tb_no = 28;

select * from sale_img;
select * from sale;

select
* from img i
where i.tb_name = 'sale' and tb_no = 87;

update img set state = 'N' where tb_name='sale' and tb_no = 87 and o_name = '마루1';

update img
set state = if(state = 'Y', 'N', 'Y')
where tb_name='sale' and tb_no = 87 and o_name = '마루1';


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
    addr_name,
    '강남역 4번 출구 앞(지상)', -- 픽업 장소 이름
    '나이키' -- 브랜드
FROM
    addr_cd
WHERE
        ur_id = 'david234'
LIMIT 1 offset 0;

DROP TRIGGER IF EXISTS insert_sale_history;
-- AFTER INSERT trigger for sale table

CREATE TRIGGER insert_sale_history
    AFTER INSERT ON sale
    FOR EACH ROW
BEGIN
    INSERT INTO sale_history (sal_no, addr_cd, addr_name, seller_id, sale_i_cd, tx_s_cd, trade_s_cd_1, trade_s_cd_2, stat_s_cd, price, pickup_addr_cd, pickup_addr_name, detail_addr, buy_id, buy_nick, r_date, m_date, ur_state, ad_state, first_date, first_id, last_date, last_id)
    VALUES (NEW.no, NEW.addr_cd, NEW.addr_name, NEW.seller_id, NEW.sal_i_cd, NEW.tx_s_cd, NEW.trade_s_cd_1, NEW.trade_s_cd_2, NEW.sal_s_cd, NEW.price, NEW.pickup_addr_cd, NEW.pickup_addr_name, NEW.detail_addr, NEW.buyer_id, NEW.buyer_nick, NEW.r_date, NEW.m_date, NEW.ur_state, NEW.ad_state, NEW.first_date, NEW.first_id, NEW.last_date, NEW.last_id);
END;


select * , (select concat(i.file_rt, '/', i.u_name, i.o_name, i.e_name) str
from img i, sale s, sale_img si
where si.sal_no = s.no and si.img_no = i.no and s.no = 126 and i.imgtype = 's' and i.state = 'Y') filert
from sale


SELECT *,
       (
           SELECT GROUP_CONCAT(CONCAT(i.file_rt, '/', i.u_name, i.o_name, i.e_name))
           FROM img i, sale_img si
           WHERE si.sal_no = s.no
             AND si.img_no = i.no
             AND i.imgtype = 's'
             AND i.state = 'Y'
       ) AS filert
FROM sale s;

INSERT INTO event(evt_cd, active_s_cd, title, contents, s_date, e_date, img_no, prize, ad_id)
values('N', 'P', '3월 신규 유저 환영 이벤트', '신규 유저 중 30분을 추첨하여 스타벅스 기프티콘을 드립니다.', '2024/03/01', '2024/03/31', 301,'스타벅스 기프티콘','admin001');

SELECT e.*,
       CONCAT(i.file_rt, '/', i.u_name, i.o_name, i.e_name) AS filert
FROM event e LEFT JOIN img i ON e.img_no = i.no
WHERE i.state = 'Y';


SELECT e.*,
       CONCAT(i.file_rt, '/', i.u_name, i.o_name, i.e_name) AS filert
FROM user_info e LEFT JOIN img i ON e.img_no = i.no
WHERE i.state = 'Y' and e.ur_id = 'user123';

SELECT CONCAT(i.file_rt, '/', i.u_name, i.o_name, i.e_name)
FROM img i, event e
WHERE e.img_no = i.no
  AND i.state = 'Y';