use teamproject;

DROP TRIGGER IF EXISTS insert_sale_history;
DROP TRIGGER IF EXISTS update_sale_history;

-- AFTER INSERT trigger for sale table
DELIMITER //
CREATE TRIGGER insert_sale_history
    AFTER INSERT ON sale
    FOR EACH ROW
BEGIN
    INSERT INTO sale_history (sal_no, addr_cd, addr_name, seller_id, sale_i_cd, tx_s_cd, trade_s_cd_1, trade_s_cd_2, stat_s_cd, price, pickup_addr_cd, pickup_addr_name, detail_addr, buy_id, buy_nick, r_date, m_date, ur_state, ad_state, first_r_date, first_idno, last_r_date, last_idno)
    VALUES (NEW.sn, NEW.addr_cd, NEW.addr_name, NEW.seller_id, NEW.sal_i_cd, NEW.tx_s_cd, NEW.trade_s_cd_1, NEW.trade_s_cd_2, NEW.sal_s_cd, NEW.price, NEW.pickup_addr_cd, NEW.pickup_addr_name, NEW.detail_addr, NEW.buyer_id, NEW.buyer_nick, NEW.r_date, NEW.m_date, NEW.ur_state, NEW.ad_state, NEW.first_r_date, NEW.first_idno, NEW.last_r_date, NEW.last_idno);
END//
DELIMITER ;

DELIMITER //
-- AFTER UPDATE trigger for sale table
CREATE TRIGGER update_sale_history
    AFTER UPDATE ON sale
    FOR EACH ROW
BEGIN
    INSERT INTO sale_history (sal_no, addr_cd, addr_name, seller_id, sale_i_cd, tx_s_cd, trade_s_cd_1, trade_s_cd_2, stat_s_cd, price, pickup_addr_cd, pickup_addr_name, detail_addr, buy_id, buy_nick, r_date, m_date, ur_state, ad_state, first_r_date, first_idno, last_r_date, last_idno)
    VALUES (NEW.sn, NEW.addr_cd, NEW.addr_name, NEW.seller_id, NEW.sal_i_cd, NEW.tx_s_cd, NEW.trade_s_cd_1, NEW.trade_s_cd_2, NEW.sal_s_cd, NEW.price, NEW.pickup_addr_cd, NEW.pickup_addr_name, NEW.detail_addr, NEW.buyer_id, NEW.buyer_nick, NEW.r_date, NEW.m_date, NEW.ur_state, NEW.ad_state, NEW.first_r_date, NEW.first_idno, NEW.last_r_date, NEW.last_idno);
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
    INSERT INTO biding_history (sal_no, addr_cd, addr_name, bid_cd, buyer_id, price, reason, bid_date, grant_state, grant_date, first_r_date, first_idno, last_r_date, last_idno)
    VALUES (NEW.sn, NEW.addr_cd, NEW.addr_name, NEW.bid_cd, NEW.buyer_id, NEW.price, NEW.reason, NEW.bid_date, NEW.grant_state, NEW.grant_date, NEW.first_r_date, NEW.first_idno, NEW.last_r_date, NEW.last_idno );
END//
DELIMITER ;

-- AFTER UPDATE trigger for sale table
DELIMITER //
CREATE TRIGGER update_biding_history
    AFTER INSERT ON biding
    FOR EACH ROW
BEGIN
    INSERT INTO biding_history (bid_no, sal_no, addr_cd, addr_name, bid_cd, buyer_id, price, reason, bid_date, grant_state, grant_date, first_r_date, first_idno, last_r_date, last_idno)
    VALUES (NEW.sn, NEW.sal_no, NEW.addr_cd, NEW.addr_name, NEW.bid_cd, NEW.buyer_id, NEW.price, NEW.reason, NEW.bid_date, NEW.grant_state, NEW.grant_date, NEW.first_r_date, NEW.first_idno, NEW.last_r_date, NEW.last_idno );
END//
DELIMITER ;

-- AFTER DELETE trigger for sale table
DELIMITER //
CREATE TRIGGER delete_biding_history
    AFTER DELETE ON biding
    FOR EACH ROW
BEGIN
    INSERT INTO biding_history (sal_no, addr_cd, addr_name, bid_cd, buyer_id, price, reason, bid_date, grant_state, grant_date, cx_state, cx_date, first_r_date, first_idno, last_r_date, last_idno)
    VALUES (OLD.sn, OLD.addr_cd, OLD.addr_name, OLD.bid_cd, OLD.buyer_id, OLD.price, OLD.reason, OLD.bid_date, OLD.grant_state, OLD.grant_date, 'Y', now(), OLD.first_r_date, OLD.first_idno, OLD.last_r_date, OLD.last_idno );
END//
DELIMITER ;

select * from biding;
select * from biding_history;