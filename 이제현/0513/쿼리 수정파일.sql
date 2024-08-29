CREATE TABLE `chat_room` (
                             `cr_no` bigint NOT NULL AUTO_INCREMENT,
                             `sale_no` bigint NOT NULL,
                             `seller_id` varchar(25) DEFAULT '',
                             `seller_nk` varchar(20) DEFAULT '',
                             `seller_state` char(1) DEFAULT 'Y',
                             `buyer_id` varchar(25) DEFAULT '',
                             `buyer_nk` varchar(20) DEFAULT '',
                             `buyer_state` char(1) DEFAULT 'Y',
                             `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             `first_date` timestamp NULL DEFAULT NULL,
                             `first_id` varchar(10) DEFAULT NULL,
                             `last_date` timestamp NULL DEFAULT NULL,
                             `last_id` varchar(10) DEFAULT NULL,
                             PRIMARY KEY (`cr_no`),
                             KEY `chat_room_ibfk_1` (`sale_no`),
                             CONSTRAINT `chat_room_ibfk_1` FOREIGN KEY (`sale_no`) REFERENCES `sale` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='채팅방'

CREATE TABLE `chat_msg` (
                            `msg_no` bigint NOT NULL AUTO_INCREMENT,
                            `cr_no` bigint NOT NULL,
                            `acid` varchar(25) DEFAULT NULL,
                            `nick` varchar(20) DEFAULT '',
                            `message` text NOT NULL,
                            `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                            `del_state` char(1) DEFAULT 'N',
                            `read_state` char(1) DEFAULT 'N',
                            `first_date` timestamp NULL DEFAULT NULL,
                            `first_id` varchar(10) DEFAULT NULL,
                            `last_date` timestamp NULL DEFAULT NULL,
                            `last_id` varchar(10) DEFAULT NULL,
                            PRIMARY KEY (`msg_no`),
                            KEY `fk_cr_no` (`cr_no`),
                            CONSTRAINT `fk_cr_no` FOREIGN KEY (`cr_no`) REFERENCES `chat_room` (`cr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='채팅메세지'

# 채팅방 생성
insert into chat_room (sale_no, seller_id, seller_nk, buyer_id, buyer_nk)
values (520, 'user1', '둘리', 'user2', '또치');

insert into chat_room (sale_no, seller_id, seller_nk, buyer_id, buyer_nk)
values (520, 'user1', '둘리', 'user3', '마이크');

insert into chat_room (sale_no, seller_id, seller_nk, buyer_id, buyer_nk)
values (520, 'user1', '둘리', 'user4', '또치');

insert into chat_room (sale_no, seller_id, seller_nk, buyer_id, buyer_nk)
values (520, 'user1', '둘리', 'user5', '고길동');

insert into chat_room (sale_no, seller_id, seller_nk, buyer_id, buyer_nk)
values (521, 'user5', '고길동', 'user1', '둘리');

insert into chat_room (sale_no, seller_id, seller_nk, buyer_id, buyer_nk)
values (521, 'user5', '고길동', 'user4', '또치');

# 채팅방목록 조회
select *
from chat_room
where seller_id = 'user1' or buyer_id = 'user1' and seller_state = 'Y' and buyer_state = 'Y';

# 채팅방 있는지 조회
select *
from chat_room
where buyer_id = 'user1' and seller_state = 'Y' and buyer_state = 'Y';

# 채팅 로그 더미
# 판매자
insert into chat_msg (cr_no, sale_no, acid, nick, content)
values (1, 520, 'user1', '둘리', '아니 퇴사좀');
# 구매자
insert into chat_msg (cr_no, sale_no, acid, nick, content)
values (1, 520, 'user2', '또치', '응 너 못나가');

# 채팅 로그 조회
select *
from chat_msg
where cr_no = 1 and sale_no = 520;

truncate chat_msg;

select * from chat_room;
select * from chat_msg;

select *
from chat_room
where (seller_id = 'user1' or buyer_id = 'user1') and seller_state = 'Y' and buyer_state = 'Y';

select *
from chat_room
where sale_no = 523 and buyer_id = 'user123';