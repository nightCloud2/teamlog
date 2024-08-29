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
  `first_date` timestamp NULL DEFAULT NULL,
  `first_id` varchar(10) DEFAULT NULL,
  `last_date` timestamp NULL DEFAULT NULL,
  `last_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이미지저장소'

    
CREATE TABLE `img_group` (
  `group_no` int NOT NULL,
  `img_no` bigint NOT NULL,
  PRIMARY KEY (`group_no`,`img_no`),
  KEY `img_group_img_no_fk` (`img_no`),
  CONSTRAINT `img_group_img_no_fk` FOREIGN KEY (`img_no`) REFERENCES `img` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create trigger update_img_groupimgfk
    after insert
    on img_group
    for each row
BEGIN
    UPDATE img
    SET group_no = NEW.group_no
    WHERE img.group_no IS NULL  -- 이미 NULL인 경우에만 업데이트하고
      AND img.no = NEW.img_no;  -- 해당하는 img_group 번호에 맞는 경우에만 업데이트합니다.
END;

# 이 아래로는 각자 테이블에 맞게 셋팅
alter table event
    add img_full_rt text null after contents;

alter table user_info
    add img_full_rt text null after contents;

alter table sale
    add img_full_rt text null after contents;

alter table community_board
    add img_full_rt text null after contents;


alter table event
    add group_no int null after img_full_rt;

alter table user_info
    add group_no int null after img_full_rt;

alter table sale
    add group_no int null after img_full_rt;

alter table community_board
    add group_no int null after img_full_rt;


alter table event
    add constraint event_groupno_fk
        foreign key (group_no) references img_group (group_no);

alter table user_info
    add constraint user_info_groupno_fk
        foreign key (group_no) references img_group (group_no);

alter table sale
    add constraint sale_groupno_fk
        foreign key (group_no) references img_group (group_no);

alter table community_board
    add constraint community_board_groupno_fk
        foreign key (group_no) references img_group (group_no);