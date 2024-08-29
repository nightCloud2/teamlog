use teamproject;

DROP TRIGGER IF EXISTS insert_sale_history;
DROP TRIGGER IF EXISTS update_sale_history;

-- AFTER INSERT trigger for sale table
DELIMITER //
CREATE TRIGGER insert_sale_history
    AFTER INSERT ON sale
    FOR EACH ROW
BEGIN
    INSERT INTO sale_history (sal_no, addr_cd, addr_name, seller_id, sale_i_cd, tx_s_cd, trade_s_cd_1, trade_s_cd_2, stat_s_cd, price, pickup_addr_cd, pickup_addr_name, detail_addr, buy_id, buy_nick, r_date, m_date, ur_state, ad_state, first_date, first_id, last_date, last_id)
    VALUES (NEW.no, NEW.addr_cd, NEW.addr_name, NEW.seller_id, NEW.sal_i_cd, NEW.tx_s_cd, NEW.trade_s_cd_1, NEW.trade_s_cd_2, NEW.sal_s_cd, NEW.price, NEW.pickup_addr_cd, NEW.pickup_addr_name, NEW.detail_addr, NEW.buyer_id, NEW.buyer_nick, NEW.r_date, NEW.m_date, NEW.ur_state, NEW.ad_state, NEW.first_date, NEW.first_id, NEW.last_date, NEW.last_id);
END//
DELIMITER ;

DELIMITER //
-- AFTER UPDATE trigger for sale table
CREATE TRIGGER update_sale_history
    AFTER UPDATE ON sale
    FOR EACH ROW
BEGIN
    INSERT INTO sale_history (sal_no, addr_cd, addr_name, seller_id, sale_i_cd, tx_s_cd, trade_s_cd_1, trade_s_cd_2, stat_s_cd, price, pickup_addr_cd, pickup_addr_name, detail_addr, buy_id, buy_nick, r_date, m_date, ur_state, ad_state, first_date, first_id, last_date, last_id)
    VALUES (NEW.no, NEW.addr_cd, NEW.addr_name, NEW.seller_id, NEW.sal_i_cd, NEW.tx_s_cd, NEW.trade_s_cd_1, NEW.trade_s_cd_2, NEW.sal_s_cd, NEW.price, NEW.pickup_addr_cd, NEW.pickup_addr_name, NEW.detail_addr, NEW.buyer_id, NEW.buyer_nick, NEW.r_date, NEW.m_date, NEW.ur_state, NEW.ad_state, NEW.first_date, NEW.first_id, NEW.last_date, NEW.last_id);
END//
DELIMITER ;

-- 가격제시/나눔신청
DROP TRIGGER IF EXISTS insert_biding_history;
DROP TRIGGER IF EXISTS delete_biding_history;


-- AFTER INSERT trigger for sale table
DELIMITER //
CREATE TRIGGER insert_biding_history
    AFTER INSERT ON biding
    FOR EACH ROW
BEGIN
    INSERT INTO biding_history (sal_no, addr_cd, addr_name, bid_cd, buyer_id, price, reason, bid_date, grant_state, grant_date, first_date, first_id, last_date, last_id)
    VALUES (NEW.no, NEW.addr_cd, NEW.addr_name, NEW.bid_cd, NEW.buyer_id, NEW.price, NEW.reason, NEW.bid_date, NEW.grant_state, NEW.grant_date, NEW.first_date, NEW.first_id, NEW.last_date, NEW.last_id );
END//
DELIMITER ;

-- AFTER UPDATE trigger for sale table
DELIMITER //
CREATE TRIGGER update_biding_history
    AFTER INSERT ON biding
    FOR EACH ROW
BEGIN
    INSERT INTO biding_history (bid_no, sal_no, addr_cd, addr_name, bid_cd, buyer_id, price, reason, bid_date, grant_state, grant_date, first_date, first_id, last_date, last_id)
    VALUES (NEW.no, NEW.sal_no, NEW.addr_cd, NEW.addr_name, NEW.bid_cd, NEW.buyer_id, NEW.price, NEW.reason, NEW.bid_date, NEW.grant_state, NEW.grant_date, NEW.first_date, NEW.first_id, NEW.last_date, NEW.last_id );
END//
DELIMITER ;

-- AFTER DELETE trigger for sale table
DELIMITER //
CREATE TRIGGER delete_biding_history
    AFTER DELETE ON biding
    FOR EACH ROW
BEGIN
    INSERT INTO biding_history (sal_no, addr_cd, addr_name, bid_cd, buyer_id, price, reason, bid_date, grant_state, grant_date, cx_state, cx_date, first_date, first_id, last_date, last_id)
    VALUES (OLD.no, OLD.addr_cd, OLD.addr_name, OLD.bid_cd, OLD.buyer_id, OLD.price, OLD.reason, OLD.bid_date, OLD.grant_state, OLD.grant_date, 'Y', now(), OLD.first_date, OLD.first_id, OLD.last_date, OLD.last_id );
END//
DELIMITER ;

select * from biding;
select * from biding_history;



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

INSERT INTO teamproject.biding (no, sal_no, addr_cd, addr_name, bid_cd, buyer_id, price, reason, bid_date, grant_state, grant_date, bid_cnt, first_date, first_id, last_date, last_id) VALUES (3, 1, '11060720', '서울특별시 동대문구 휘경1동', 'F', 'user123', null, '받고싶어요 제발제발', '2024-04-23 12:03:46', 'N', null, 0, '2024-04-23 12:03:46', 'admin', null, 'admin');

