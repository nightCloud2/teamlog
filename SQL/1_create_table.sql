CREATE TABLE `tag` (
                       `no` bigint NOT NULL AUTO_INCREMENT,
                       `contents` varchar(25) DEFAULT NULL,
                       `state` char(1) DEFAULT 'Y',
                       `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       `first_id` varchar(25) NOT NULL,
                       `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       `last_id` varchar(25) NOT NULL,
                       PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `administrative` (
                                  `addr_cd` varchar(8) NOT NULL COMMENT 'AUTOx',
                                  `addr_name` varchar(100) NOT NULL,
                                  `state` char(1) DEFAULT 'Y' COMMENT 'Y:사용/N:미사용',
                                  `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `first_id` varchar(25) NOT NULL,
                                  `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `last_id` varchar(25) NOT NULL,
                                  PRIMARY KEY (`addr_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
                        `id` varchar(25) NOT NULL,
                        `pw` varchar(200) NOT NULL,
                        `name` varchar(30) NOT NULL,
                        `nick` varchar(20) NOT NULL,
                        `birth` varchar(10) NOT NULL,
                        `gender` char(1) NOT NULL COMMENT '성별 | 남자 : M | 여자 : F',
                        `phone_num` varchar(20) NOT NULL,
                        `safe_num` varchar(20) DEFAULT NULL,
                        `foreigner` char(1) DEFAULT 'N' COMMENT '외국인여부 | Y : 외국인 | N : 내국인',
                        `email` varchar(200) NOT NULL,
                        `s_cd` char(1) DEFAULT 'O' COMMENT '회원상태 | O : 활성화 | F : 비활성화(휴먼) | L : 탈퇴',
                        `addr_det` varchar(100) NOT NULL,
                        `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `first_id` varchar(25) NOT NULL,
                        `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `last_id` varchar(25) NOT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `administer` (
                              `id` varchar(25) NOT NULL,
                              `pw` varchar(200) NOT NULL,
                              `name` varchar(30) NOT NULL,
                              `phone_num` varchar(20) NOT NULL,
                              `email` varchar(200) NOT NULL,
                              `role` varchar(10) NOT NULL,
                              `dept` varchar(10) NOT NULL,
                              `w_cd` char(1) DEFAULT 'W' COMMENT '근무상태 | W : 근무중 | L : 퇴사 | A : 연차',
                              `ent_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                              `res_date` timestamp NULL DEFAULT NULL,
                              `addr_name` varchar(100) NOT NULL,
                              `addr_det` varchar(100) NOT NULL,
                              `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              `first_id` varchar(25) NOT NULL,
                              `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              `last_id` varchar(25) NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `addr_cd` (
                           `no` bigint NOT NULL AUTO_INCREMENT,
                           `ur_id` varchar(25) NOT NULL,
                           `addr_cd` varchar(8) NOT NULL COMMENT 'AUTOx',
                           `addr_name` varchar(100) NOT NULL,
                           `state` char(1) DEFAULT 'N',
                           `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           `first_id` varchar(25) NOT NULL,
                           `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           `last_id` varchar(25) NOT NULL,
                           PRIMARY KEY (`no`,`ur_id`,`addr_cd`),
                           KEY `addr_cd` (`addr_cd`),
                           KEY `ur_id` (`ur_id`),
                           CONSTRAINT `addr_cd_ibfk_1` FOREIGN KEY (`addr_cd`) REFERENCES `administrative` (`addr_cd`),
                           CONSTRAINT `addr_cd_ibfk_2` FOREIGN KEY (`ur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `admin_login_history` (
                                       `no` bigint NOT NULL AUTO_INCREMENT,
                                       `ad_id` varchar(25) NOT NULL,
                                       `login_date` timestamp NOT NULL,
                                       `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       `first_id` varchar(25) NOT NULL,
                                       `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       `last_id` varchar(25) NOT NULL,
                                       PRIMARY KEY (`no`),
                                       KEY `ad_id` (`ad_id`),
                                       CONSTRAINT `admin_login_history_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `administer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `admin_modify_history` (
                                        `no` bigint NOT NULL  AUTO_INCREMENT,
                                        `ad_id` varchar(25) NOT NULL,
                                        `pw` varchar(200) DEFAULT NULL,
                                        `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                        `m_s_cd` varchar(10) DEFAULT NULL COMMENT '정보수정사유 |  PWC : 비밀번호수정 |  PHC : 전화번호수정 | ADC : 주소명변경 | DPC : 부서이동 | CMC : 권한변경 ',
                                        `phone_num` varchar(20) DEFAULT NULL,
                                        `addr_name` varchar(100) DEFAULT NULL,
                                        `addr_det` varchar(100) DEFAULT NULL,
                                        `dept` varchar(255) DEFAULT NULL,
                                        `role` varchar(255) DEFAULT NULL,
                                        `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                        `first_id` varchar(25) NOT NULL,
                                        `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                        `last_id` varchar(25) NOT NULL,
                                        PRIMARY KEY (`no`),
                                        KEY `ad_id` (`ad_id`),
                                        CONSTRAINT `admin_modify_history_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `administer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale_category` (
                                 `sal_cd` varchar(9) NOT NULL COMMENT 'AUTO x',
                                 `name` varchar(20) NOT NULL,
                                 `state` char(1) DEFAULT 'Y' COMMENT 'Y:사용/N:미사용',
                                 `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `first_id` varchar(25) NOT NULL,
                                 `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `last_id` varchar(25) NOT NULL,
                                 PRIMARY KEY (`sal_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale` (
                        `no` bigint NOT NULL AUTO_INCREMENT,
                        `addr_cd` varchar(8) NOT NULL,
                        `addr_name` varchar(100) NOT NULL COMMENT '판매자가 판매하는 지역의 행정구역명',
                        `seller_id` varchar(25) NOT NULL,
                        `seller_nick` varchar(20) NOT NULL,
                        `sal_i_cd` varchar(9) NOT NULL COMMENT '판매 카테고리',
                        `sal_name` varchar(20) NOT NULL COMMENT '판매 카테고리명',
                        `group_no` int DEFAULT NULL,
                        `img_full_rt` text,
                        `pro_s_cd` varchar(10) DEFAULT 'S' COMMENT 'S:새상품/A:사용감없음/B:사용감적음/C:사용감많음/D:고장파손',
                        `tx_s_cd` varchar(10) DEFAULT 'S' COMMENT 'Transaction method',
                        `trade_s_cd_1` varchar(10) DEFAULT 'F' COMMENT 'O:온라인/F:직거래/D:택배거래',
                        `trade_s_cd_2` varchar(10) DEFAULT NULL COMMENT 'O:온라인/F:직거래/D:택배거래',
                        `sal_s_cd` varchar(10) DEFAULT 'S' COMMENT 'S:판매중/R:예약중/C:거래완료',
                        `title` varchar(100) NOT NULL,
                        `contents` text NOT NULL,
                        `price` int DEFAULT '0',
                        `bid_cd` varchar(10) NOT NULL,
                        `pickup_addr_cd` varchar(8) DEFAULT NULL,
                        `pickup_addr_name` varchar(100) DEFAULT NULL,
                        `detail_addr` text COMMENT '거래 진행할 상세 장소를 기재',
                        `brand` varchar(20) DEFAULT '',
                        `reg_price` int DEFAULT NULL,
                        `buyer_id` varchar(25) DEFAULT NULL,
                        `buyer_nick` varchar(20) DEFAULT NULL,
                        `like_cnt` int DEFAULT '0' COMMENT '사람들이 좋아요 누른 숫자',
                        `view_cnt` int DEFAULT '0',
                        `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '판매글 등록일',
                        `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '판매글 수정일',
                        `hoist_cnt` int DEFAULT '0' COMMENT '작성자가 글을 끌어올린 횟 수',
                        `h_date` timestamp NULL DEFAULT NULL COMMENT '판매글 끌어올리기일',
                        `bid_cnt` int DEFAULT '0',
                        `ur_state` char(1) DEFAULT 'Y' COMMENT 'Y: 사용/N: 삭제',
                        `ad_state` char(1) DEFAULT 'N' COMMENT 'Y: 게시글 유지/N: 게시글 삭제',
                        `rv_state` char(1) DEFAULT 'Y',
                        `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `first_id` varchar(25) NOT NULL,
                        `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `last_id` varchar(25) NOT NULL,
                        PRIMARY KEY (`no`),
                        KEY `FK_addr_cd_TO_sale_2` (`seller_id`),
                        KEY `FK_administrative_TO_sale_1` (`addr_cd`),
                        KEY `FK_sale_category_TO_sale_1` (`sal_i_cd`),
                        CONSTRAINT `FK_addr_cd_TO_sale_2` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`),
                        CONSTRAINT `FK_administrative_TO_sale_1` FOREIGN KEY (`addr_cd`) REFERENCES `administrative` (`addr_cd`),
                        CONSTRAINT `FK_sale_category_TO_sale_1` FOREIGN KEY (`sal_i_cd`) REFERENCES `sale_category` (`sal_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `biding` (
                          `no` bigint NOT NULL AUTO_INCREMENT,
                          `sal_no` bigint NOT NULL,
                          `addr_cd` varchar(8) NOT NULL,
                          `addr_name` varchar(100) NOT NULL,
                          `bid_cd` varchar(10) NOT NULL,
                          `buyer_id` varchar(25) NOT NULL,
                          `price` int DEFAULT NULL,
                          `reason` text,
                          `bid_state` char(1) DEFAULT 'Y',
                          `bid_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '제시/신청한 일자',
                          `grant_state` char(1) DEFAULT 'N' COMMENT 'Y: 승인/N: 미승인',
                          `grant_date` timestamp NULL DEFAULT NULL COMMENT '제시/신청을 승인한 일자',
                          `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          `first_id` varchar(25) NOT NULL,
                          `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          `last_id` varchar(25) NOT NULL,
                          PRIMARY KEY (`no`,`sal_no`),
                          KEY `FK_sale_TO_biding_1` (`addr_cd`),
                          KEY `FK_sale_TO_biding_2` (`sal_no`),
                          KEY `FK_user_TO_biding_1` (`buyer_id`),
                          CONSTRAINT `FK_sale_TO_biding_1` FOREIGN KEY (`addr_cd`) REFERENCES `sale` (`addr_cd`),
                          CONSTRAINT `FK_sale_TO_biding_2` FOREIGN KEY (`sal_no`) REFERENCES `sale` (`no`),
                          CONSTRAINT `FK_user_TO_biding_1` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `biding_history` (
                                  `no` bigint NOT NULL AUTO_INCREMENT,
                                  `sal_no` bigint NOT NULL,
                                  `bid_no` bigint NOT NULL,
                                  `addr_cd` varchar(8) NOT NULL,
                                  `addr_name` varchar(100) NOT NULL,
                                  `bid_cd` varchar(10) NOT NULL,
                                  `buyer_id` varchar(25) NOT NULL,
                                  `price` int DEFAULT NULL,
                                  `reason` text,
                                  `bid_date` timestamp NOT NULL COMMENT '가격을 제시한 일자',
                                  `grant_state` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y: 승인/N: 미승인',
                                  `grant_date` timestamp NULL DEFAULT NULL COMMENT '가격 제시를 승인한 일자',
                                  `cx_state` char(1) DEFAULT 'N' COMMENT '신청을 취소한 상태',
                                  `cx_date` timestamp NULL DEFAULT NULL COMMENT '신청을 취소한 일자',
                                  `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `first_id` varchar(25) NOT NULL,
                                  `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `last_id` varchar(25) NOT NULL,
                                  PRIMARY KEY (`no`,`sal_no`,`bid_no`),
                                  KEY `FK_biding_TO_biding_history_2` (`sal_no`),
                                  KEY `FK_biding_TO_biding_history_3` (`bid_no`),
                                  KEY `biding_history_addr_cd_sal_no_bid_no_sn_index` (`addr_cd`,`sal_no`,`bid_no`,`no`),
                                  CONSTRAINT `FK_biding_TO_biding_history_1` FOREIGN KEY (`addr_cd`) REFERENCES `biding` (`addr_cd`),
                                  CONSTRAINT `FK_biding_TO_biding_history_2` FOREIGN KEY (`sal_no`) REFERENCES `biding` (`sal_no`),
                                  CONSTRAINT `FK_biding_TO_biding_history_3` FOREIGN KEY (`bid_no`) REFERENCES `biding` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `blacklist` (
                             `no` bigint NOT NULL AUTO_INCREMENT,
                             `ur_id` varchar(25) NOT NULL,
                             `block_ur_id` varchar(25) DEFAULT NULL,
                             `state` char(1) DEFAULT 'N' COMMENT '차단상태 | Y : 차단 | N : 차단해제',
                             `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `first_id` varchar(25) NOT NULL,
                             `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `last_id` varchar(25) NOT NULL,
                             PRIMARY KEY (`no`),
                             KEY `ur_id` (`ur_id`),
                             CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`ur_id`) REFERENCES `administer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `chat_room` (
                             `no` bigint NOT NULL AUTO_INCREMENT,
                             `sale_no` bigint NOT NULL,
                             `seller_id` varchar(25) DEFAULT '',
                             `seller_nk` varchar(20) DEFAULT '',
                             `seller_state` char(1) DEFAULT 'Y',
                             `buyer_id` varchar(25) DEFAULT '',
                             `buyer_nk` varchar(20) DEFAULT '',
                             `buyer_state` char(1) DEFAULT 'Y',
                             `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `first_id` varchar(25) NOT NULL,
                             `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `last_id` varchar(25) NOT NULL,
                             PRIMARY KEY (`no`),
                             KEY `chat_room_ibfk_1` (`sale_no`),
                             CONSTRAINT `chat_room_ibfk_1` FOREIGN KEY (`sale_no`) REFERENCES `sale` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='채팅방';

CREATE TABLE `chat_msg` (
                            `msg_no` bigint NOT NULL AUTO_INCREMENT,
                            `cr_no` bigint NOT NULL,
                            `acid` varchar(25) DEFAULT NULL,
                            `nick` varchar(20) DEFAULT '',
                            `message` text NOT NULL,
                            `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                            `del_state` char(1) DEFAULT 'N',
                            `read_state` char(1) DEFAULT 'N',
                            `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `first_id` varchar(25) NOT NULL,
                            `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `last_id` varchar(25) NOT NULL,
                            PRIMARY KEY (`msg_no`),
                            KEY `fk_cr_no` (`cr_no`),
                            CONSTRAINT `fk_cr_no` FOREIGN KEY (`cr_no`) REFERENCES `chat_room` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='채팅메세지';

CREATE TABLE `commu` (
                         `commu_cd` varchar(10) NOT NULL,
                         `name` varchar(100) NOT NULL,
                         `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         `first_id` varchar(25) NOT NULL,
                         `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         `last_id` varchar(25) NOT NULL,
                         PRIMARY KEY (`commu_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='커뮤니티카테고리';

CREATE TABLE `community_board` (
                                   `no` bigint NOT NULL AUTO_INCREMENT,
                                   `ur_id` varchar(25) NOT NULL,
                                   `addr_cd` varchar(8) NOT NULL,
                                   `addr_no` bigint NOT NULL,
                                   `commu_cd` varchar(10) NOT NULL,
                                   `commu_name` varchar(100) DEFAULT NULL,
                                   `addr_name` varchar(100) NOT NULL,
                                   `title` varchar(100) NOT NULL,
                                   `contents` text NOT NULL,
                                   `nick` varchar(20) NOT NULL,
                                   `img_full_rt` text,
                                   `group_no` int DEFAULT NULL,
                                   `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                   `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                   `like_cnt` int DEFAULT '0',
                                   `view_cnt` int DEFAULT '0',
                                   `ur_state` char(1) DEFAULT 'y',
                                   `comment_count` int DEFAULT '0',
                                   `ad_state` char(1) DEFAULT 'n',
                                   `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `first_id` varchar(25) NOT NULL,
                                   `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `last_id` varchar(25) NOT NULL,
                                   PRIMARY KEY (`no`),
                                   KEY `post_ibfk_1` (`ur_id`),
                                   KEY `post_ibfk_2` (`addr_cd`),
                                   KEY `post_ibfk_3` (`addr_no`),
                                   KEY `commu_cd` (`commu_cd`),
                                   CONSTRAINT `community_board_ibfk_1` FOREIGN KEY (`ur_id`) REFERENCES `addr_cd` (`ur_id`),
                                   CONSTRAINT `community_board_ibfk_2` FOREIGN KEY (`addr_cd`) REFERENCES `addr_cd` (`addr_cd`),
                                   CONSTRAINT `community_board_ibfk_3` FOREIGN KEY (`addr_no`) REFERENCES `addr_cd` (`no`),
                                   CONSTRAINT `community_board_ibfk_4` FOREIGN KEY (`commu_cd`) REFERENCES `commu` (`commu_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comment` (
                           `post_no` bigint NOT NULL,
                           `no` bigint NOT NULL,
                           `psn` bigint DEFAULT NULL,
                           `nick` varchar(20) NOT NULL,
                           `ur_id` varchar(25) NOT NULL,
                           `contents` text NOT NULL,
                           `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                           `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                           `like_cnt` int DEFAULT '0',
                           `ur_state` char(1) DEFAULT 'y',
                           `ad_state` char(1) DEFAULT 'n',
                           `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           `first_id` varchar(25) NOT NULL,
                           `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           `last_id` varchar(25) NOT NULL,
                           PRIMARY KEY (`post_no`,`no`),
                           KEY `post_no` (`post_no`),
                           KEY `ur_id` (`ur_id`),
                           CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_no`) REFERENCES `community_board` (`no`),
                           CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`ur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글';

CREATE TABLE `community_heart` (
                                   `like_no` int NOT NULL AUTO_INCREMENT,
                                   `ur_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                   `post_no` bigint NOT NULL,
                                   `ur_state` char(1) DEFAULT 'y',
                                   `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `first_id` varchar(25) NOT NULL,
                                   `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `last_id` varchar(25) NOT NULL,
                                   PRIMARY KEY (`like_no`),
                                   UNIQUE KEY `idx_heart` (`ur_id`,`post_no`),
                                   KEY `Fk_community_board_to_heart` (`post_no`),
                                   CONSTRAINT `Fk_community_board_to_heart` FOREIGN KEY (`post_no`) REFERENCES `community_board` (`no`) ON DELETE CASCADE ON UPDATE CASCADE,
                                   CONSTRAINT `heart_user_id_fk` FOREIGN KEY (`ur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `community_tag` (
                                 `post_no` bigint NOT NULL,
                                 `tag_no` bigint NOT NULL,
                                 `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `first_id` varchar(25) NOT NULL,
                                 `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `last_id` varchar(25) NOT NULL,
                                 PRIMARY KEY (`post_no`, `tag_no`),
                                 KEY `FK_tag_TO_community_tag_1` (`tag_no`),
                                 CONSTRAINT `FK_post_TO_community_tag_1` FOREIGN KEY (`post_no`) REFERENCES `community_board` (`addr_no`),
                                 CONSTRAINT `FK_tag_TO_community_tag_1` FOREIGN KEY (`tag_no`) REFERENCES `tag` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `event` (
                         `evt_no` bigint NOT NULL AUTO_INCREMENT,
                         `evt_cd` varchar(10) DEFAULT 'B',
                         `title` varchar(100) NOT NULL,
                         `contents` text NOT NULL,
                         `img_full_rt` text,
                         `s_date` date NOT NULL,
                         `e_date` date NOT NULL,
                         `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                         `active_s_cd` char(1) DEFAULT 'A',
                         `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                         `prize` varchar(50) DEFAULT '',
                         `ad_id` varchar(25) NOT NULL,
                         `first_date` timestamp NULL DEFAULT NULL,
                         `first_id` varchar(10) DEFAULT NULL,
                         `last_date` timestamp NULL DEFAULT NULL,
                         `last_id` varchar(10) DEFAULT NULL,
                         `group_no` int DEFAULT NULL,
                         PRIMARY KEY (`evt_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이벤트';

CREATE TABLE `event_record` (
                                `evt_no` bigint NOT NULL,
                                `ur_id` varchar(25) NOT NULL,
                                `complete` char(1) NOT NULL DEFAULT 'N',
                                `r_s_cd` varchar(1) NOT NULL DEFAULT 'N',
                                `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `first_id` varchar(25) NOT NULL,
                                `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `last_id` varchar(25) NOT NULL,
                                PRIMARY KEY (`ur_id`,`evt_no`),
                                KEY `evt_no` (`evt_no`),
                                CONSTRAINT `event_record_ibfk_1` FOREIGN KEY (`evt_no`) REFERENCES `event` (`evt_no`),
                                CONSTRAINT `event_record_ibfk_2` FOREIGN KEY (`ur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이벤트 신청 이력';

CREATE TABLE `hoisting` (
                            `no` bigint NOT NULL AUTO_INCREMENT,
                            `sal_no` bigint NOT NULL,
                            `addr_cd` varchar(8) NOT NULL,
                            `addr_name` varchar(20) NOT NULL,
                            `seller_id` varchar(25) NOT NULL,
                            `sal_i_cd` varchar(25) NOT NULL,
                            `sal_name` varchar(20) NOT NULL,
                            `h_date` timestamp NOT NULL,
                            `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `first_id` varchar(25) NOT NULL,
                            `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `last_id` varchar(25) NOT NULL,
                            PRIMARY KEY (`no`,`sal_no`),
                            KEY `FK_sale_TO_hoisting_1` (`addr_cd`),
                            KEY `FK_sale_TO_hoisting_2` (`sal_no`),
                            CONSTRAINT `FK_sale_TO_hoisting_1` FOREIGN KEY (`addr_cd`) REFERENCES `sale` (`addr_cd`),
                            CONSTRAINT `FK_sale_TO_hoisting_2` FOREIGN KEY (`sal_no`) REFERENCES `sale` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `img` (
                       `no` bigint NOT NULL AUTO_INCREMENT,
                       `group_no` int DEFAULT NULL,
                       `imgtype` varchar(10) NOT NULL,
                       `file_rt` text NOT NULL,
                       `u_name` varchar(255) NOT NULL,
                       `o_name` varchar(255) NOT NULL,
                       `e_name` varchar(255) NOT NULL,
                       `img_full_rt` text NOT NULL,
                       `w_size` int DEFAULT '0',
                       `h_size` int DEFAULT '0',
                       `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                       `state` char(1) DEFAULT 'Y',
                       `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       `first_id` varchar(25) NOT NULL,
                       `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       `last_id` varchar(25) NOT NULL,
                       PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이미지저장소';

CREATE TABLE `img_group` (
                             `group_no` int NOT NULL,
                             `img_no` bigint NOT NULL,
                             `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `first_id` varchar(25) NOT NULL,
                             `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `last_id` varchar(25) NOT NULL,
                             PRIMARY KEY (`group_no`,`img_no`),
                             KEY `img_group_img_no_fk` (`img_no`),
                             CONSTRAINT `img_group_img_no_fk` FOREIGN KEY (`img_no`) REFERENCES `img` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `jjim` (
                        `sal_no` bigint NOT NULL,
                        `buyer_id` varchar(25) NOT NULL,
                        `check_like` int DEFAULT '0',
                        `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `first_id` varchar(25) NOT NULL,
                        `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `last_id` varchar(25) NOT NULL,
                        PRIMARY KEY (`no`,`buyer_id`),
                        KEY `FK_user_TO_jjim_1` (`buyer_id`),
                        CONSTRAINT `FK_sale_TO_jjim_1` FOREIGN KEY (`no`) REFERENCES `sale` (`no`),
                        CONSTRAINT `FK_user_TO_jjim_1` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `mail_classify` (
                                 `u_i_cd` varchar(10) NOT NULL DEFAULT 'A' COMMENT '신규 회원인지 전체 회원인지 구분',
                                 `name` varchar(20) DEFAULT NULL,
                                 `req` varchar(255) DEFAULT NULL COMMENT 'Reqirement',
                                 `state` char(1) DEFAULT 'Y',
                                 `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `first_id` varchar(25) NOT NULL,
                                 `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `last_id` varchar(25) NOT NULL,
                                 PRIMARY KEY (`u_i_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `mail` (
                        `em_no` bigint NOT NULL AUTO_INCREMENT,
                        `em_cd` varchar(10) NOT NULL,
                        `u_i_cd` varchar(10) DEFAULT 'A',
                        `title` varchar(100) NOT NULL,
                        `contents` text NOT NULL,
                        `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `ad_id` varchar(25) NOT NULL,
                        `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `first_id` varchar(25) NOT NULL,
                        `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `last_id` varchar(25) NOT NULL,
                        PRIMARY KEY (`em_no`),
                        KEY `ad_id` (`ad_id`),
                        KEY `u_i_cd` (`u_i_cd`),
                        CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `administer` (`id`),
                        CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`u_i_cd`) REFERENCES `mail_classify` (`u_i_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='메일 쪽지';

CREATE TABLE `mail_recode` (
                               `em_no` bigint NOT NULL,
                               `ur_id` varchar(25) NOT NULL,
                               `em_title` varchar(100) NOT NULL,
                               `em_contents` text NOT NULL,
                               `em_r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                               `r_state` char(1) DEFAULT 'N',
                               `state` char(1) DEFAULT 'Y',
                               `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               `first_id` varchar(25) NOT NULL,
                               `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               `last_id` varchar(25) NOT NULL,
                               PRIMARY KEY (`ur_id`,`em_no`),
                               KEY `em_no` (`em_no`),
                               CONSTRAINT `mail_recode_ibfk_1` FOREIGN KEY (`em_no`) REFERENCES `mail` (`em_no`),
                               CONSTRAINT `mail_recode_ibfk_2` FOREIGN KEY (`ur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='메일 발송 이력';


CREATE TABLE `question_category` (
                                     `que_cd` bigint NOT NULL,
                                     `name` varchar(20) NOT NULL,
                                     `st` char(1) NOT NULL DEFAULT 'Y',
                                     `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                     `first_id` varchar(25) NOT NULL,
                                     `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                     `last_id` varchar(25) NOT NULL,
                                     PRIMARY KEY (`que_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='카테고리 테이블';

CREATE TABLE `qnalist_board` (
                                 `no` bigint NOT NULL AUTO_INCREMENT,
                                 `que_i_cd` bigint NOT NULL,
                                 `title` varchar(255) NOT NULL,
                                 `contents` text NOT NULL,
                                 `ad_id` varchar(25) DEFAULT NULL,
                                 `ad_name` varchar(100) DEFAULT NULL,
                                 `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 `view_cnt` int DEFAULT '0',
                                 `state` char(1) DEFAULT 'Y',
                                 `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `first_id` varchar(25) NOT NULL,
                                 `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `last_id` varchar(25) NOT NULL,
                                 PRIMARY KEY (`no`),
                                 KEY `fk_faq_que_i_cd` (`que_i_cd`),
                                 KEY `fk_faq_ad_id` (`ad_id`),
                                 CONSTRAINT `fk_faq_ad_id` FOREIGN KEY (`ad_id`) REFERENCES `administer` (`id`),
                                 CONSTRAINT `fk_faq_que_i_cd` FOREIGN KEY (`que_i_cd`) REFERENCES `question_category` (`que_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='자주 묻는 질문과 답변 테이블';

CREATE TABLE `qty_conditions` (
                                  `qty_name` varchar(50) DEFAULT NULL,
                                  `qty` int DEFAULT NULL,
                                  `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `first_id` varchar(25) NOT NULL,
                                  `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `last_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `question_board` (
                                  `no` bigint NOT NULL AUTO_INCREMENT,
                                  `ur_id` varchar(25) NOT NULL,
                                  `q_s_cd` varchar(10) NOT NULL,
                                  `que_i_cd` bigint NOT NULL,
                                  `title` varchar(255) NOT NULL,
                                  `contents` text NOT NULL,
                                  `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                  `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                  `ad_id` varchar(25) DEFAULT NULL,
                                  `ad_name` varchar(255) DEFAULT NULL,
                                  `ans_contents` text,
                                  `ans_p_date` timestamp NULL DEFAULT NULL,
                                  `ans_m_date` timestamp NULL DEFAULT NULL,
                                  `ans_sat` int DEFAULT NULL,
                                  `state` char(1) DEFAULT NULL,
                                  `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `first_id` varchar(25) NOT NULL,
                                  `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `last_id` varchar(25) NOT NULL,
                                  PRIMARY KEY (`no`),
                                  KEY `fk_question_board_ur_id` (`ur_id`),
                                  KEY `fk_question_board_que_i_cd` (`que_i_cd`),
                                  KEY `fk_question_board_ad_id` (`ad_id`),
                                  CONSTRAINT `fk_question_board_ad_id` FOREIGN KEY (`ad_id`) REFERENCES `administer` (`id`),
                                  CONSTRAINT `fk_question_board_que_i_cd` FOREIGN KEY (`que_i_cd`) REFERENCES `question_category` (`que_cd`),
                                  CONSTRAINT `fk_question_board_ur_id` FOREIGN KEY (`ur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `report` (
                          `no` bigint NOT NULL,
                          `rpt_s_cd` varchar(10) NOT NULL,
                          `contents` text,
                          `ad_id` varchar(25) NOT NULL,
                          `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                          `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          `first_id` varchar(25) NOT NULL,
                          `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          `last_id` varchar(25) NOT NULL,
                          PRIMARY KEY (`no`),
                          KEY `ad_id` (`ad_id`),
                          CONSTRAINT `report_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `administer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `review_comment` (
                                  `no` bigint NOT NULL AUTO_INCREMENT,
                                  `sal_id` varchar(25) NOT NULL,
                                  `psn` bigint DEFAULT NULL,
                                  `buy_id` varchar(25) NOT NULL,
                                  `buy_nick` varchar(20) NOT NULL,
                                  `contents` text,
                                  `reviewStar` int DEFAULT '0',
                                  `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                  `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                  `ur_state` char(1) DEFAULT 'Y',
                                  `ad_state` char(1) DEFAULT 'N',
                                  `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `first_id` varchar(25) NOT NULL,
                                  `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `last_id` varchar(25) NOT NULL,
                                  PRIMARY KEY (`no`),
                                  KEY `review_comment_ibfk_1` (`sal_id`),
                                  CONSTRAINT `review_comment_ibfk_1` FOREIGN KEY (`sal_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale_history` (
                                `no` bigint NOT NULL AUTO_INCREMENT,
                                `sal_no` bigint NOT NULL,
                                `addr_cd` varchar(8) NOT NULL COMMENT 'AUTOx',
                                `addr_name` varchar(100) NOT NULL,
                                `seller_id` varchar(25) NOT NULL,
                                `seller_nick` varchar(20) NOT NULL,
                                `sal_i_cd` varchar(9) NOT NULL,
                                `sal_name` varchar(20) NOT NULL,
                                `group_no` int NULL,
                                `img_full_rt` text NULL,
                                `title` varchar(100) NOT NULL,
                                `contents` text NOT NULL,
                                `pro_s_cd` varchar(10) NOT NULL COMMENT '제품상태코드',
                                `tx_s_cd` varchar(10) NOT NULL COMMENT '거래방식 코드',
                                `trade_s_cd_1` varchar(10) NOT NULL,
                                `trade_s_cd_2` varchar(10) DEFAULT NULL,
                                `sal_s_cd` varchar(10) NOT NULL COMMENT '판매상태 코드',
                                `biding` char(1) DEFAULT NULL,
                                `price` int NOT NULL,
                                `pickup_addr_cd` varchar(8) DEFAULT NULL,
                                `pickup_addr_name` varchar(100) DEFAULT NULL,
                                `detail_addr` text,
                                `buy_id` varchar(25) DEFAULT NULL,
                                `buy_nick` varchar(25) DEFAULT NULL,
                                `r_date` timestamp NOT NULL,
                                `m_date` timestamp NOT NULL,
                                `ur_state` char(1) NOT NULL,
                                `ad_state` char(1) NOT NULL,
                                `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `first_id` varchar(25) NOT NULL,
                                `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `last_id` varchar(25) NOT NULL,
                                PRIMARY KEY (`no`,`sal_no`),
                                KEY `FK_sale_TO_sale_history_2` (`sal_no`),
                                KEY `sale_history_sale_addr_cd_fk` (`addr_cd`),
                                CONSTRAINT `FK_sale_TO_sale_history_2` FOREIGN KEY (`sal_no`) REFERENCES `sale` (`no`),
                                CONSTRAINT `sale_history_sale_addr_cd_fk` FOREIGN KEY (`addr_cd`) REFERENCES `sale` (`addr_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale_tag` (
                            `sal_no` bigint NOT NULL,
                            `tag_no` bigint NOT NULL,
                            `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `first_id` varchar(25) NOT NULL,
                            `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `last_id` varchar(25) NOT NULL,
                            PRIMARY KEY (`sal_no`,`tag_no`),
                            KEY `FK_tag_TO_sal_tag_1` (`tag_no`),
                            CONSTRAINT `FK_sale_TO_sale_tag_1` FOREIGN KEY (`sal_no`) REFERENCES `sale` (`no`),
                            CONSTRAINT `FK_tag_TO_sal_tag_1` FOREIGN KEY (`tag_no`) REFERENCES `tag` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `spamlist` (
                            `no` bigint NOT NULL AUTO_INCREMENT,
                            `ad_id` varchar(25) NOT NULL,
                            `spam_word` varchar(255) NOT NULL,
                            `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                            `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `first_id` varchar(25) NOT NULL,
                            `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `last_id` varchar(25) NOT NULL,
                            PRIMARY KEY (`no`),
                            KEY `ad_id` (`ad_id`),
                            CONSTRAINT `spamlist_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `administer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `standardcode` (
                                `type_id` varchar(10) NOT NULL,
                                `type_name` varchar(50) NOT NULL,
                                `code` varchar(8) NOT NULL,
                                `code_name` varchar(50) NOT NULL,
                                `sort` int NOT NULL,
                                `state` char(1) DEFAULT 'Y' COMMENT 'Y : 사용/ N : 미사용',
                                `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `first_id` varchar(25) NOT NULL,
                                `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `last_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tb_standard` (
                               `stand_name` varchar(100) NOT NULL,
                               `stand_num` int NOT NULL,
                               `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               `first_id` varchar(25) NOT NULL,
                               `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               `last_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_info` (
                             `ur_id` varchar(25) NOT NULL,
                             `nick` varchar(20) NOT NULL,
                             `contents` text,
                             `view_cnt` int DEFAULT '0',
                             `complete_cnt` int DEFAULT '0',
                             `rv_cmt_cnt` int DEFAULT '0',
                             `rpt_cnt` int DEFAULT '0',
                             `star_avg` double DEFAULT '0',
                             `r_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             `state` char(1) DEFAULT 'Y',
                             `img_full_rt` text,
                             `group_no` int DEFAULT NULL,
                             `first_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                             `first_id` varchar(10) DEFAULT NULL,
                             `last_date` timestamp NULL DEFAULT NULL,
                             `last_id` varchar(10) DEFAULT NULL,
                             PRIMARY KEY (`ur_id`),
                             CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`ur_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_login_history` (
                                      `no` bigint NOT NULL AUTO_INCREMENT,
                                      `ur_id` varchar(25) NOT NULL,
                                      `login_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                      `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                      `first_id` varchar(25) NOT NULL,
                                      `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                      `last_id` varchar(25) NOT NULL,
                                      PRIMARY KEY (`no`),
                                      KEY `ur_id` (`ur_id`),
                                      CONSTRAINT `user_login_history_ibfk_1` FOREIGN KEY (`ur_id`) REFERENCES `administer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_modify_history` (
                                       `no` bigint NOT NULL AUTO_INCREMENT,
                                       `m_s_cd` varchar(10) DEFAULT NULL COMMENT '정보변경사유 | PWC : 비밀번호변경 | PHC : 전화번호변경',
                                       `ur_id` varchar(25) NOT NULL,
                                       `pw` varchar(200) DEFAULT NULL,
                                       `m_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                       `phone_no` varchar(20) DEFAULT NULL,
                                       `first_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       `first_id` varchar(25) NOT NULL,
                                       `last_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       `last_id` varchar(25) NOT NULL,
                                       PRIMARY KEY (`no`),
                                       KEY `ur_id` (`ur_id`),
                                       CONSTRAINT `user_modify_history_ibfk_1` FOREIGN KEY (`ur_id`) REFERENCES `administer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
