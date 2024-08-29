create table biding
(
	sn           bigint                              not null auto_increment,
    sal_no       bigint                              not null,
    addr_cd      varchar(8)                          not null,
    addr_name    varchar(100)                        not null,
    bid_cd       char                                not null,
    buyer_id     varchar(25)                         not null,
    price        int                                 null,
    reason       text                                null,
    bid_date     timestamp default CURRENT_TIMESTAMP null comment '제시/신청한 일자',
    grant_state  char      default 'N'               null comment 'Y: 승인/N: 미승인',
    grant_date   timestamp                           null comment '제시/신청을 승인한 일자',
    bid_cnt      int       default 0                 null comment '제시/신청 횟수',
    first_r_date timestamp default CURRENT_TIMESTAMP null,
    first_idno   varchar(10)                         not null,
    last_r_date  timestamp default CURRENT_TIMESTAMP not null,
    last_idno    varchar(10)                         not null,
    primary key (sn, sal_no),
    constraint FK_sale_TO_biding_1
        foreign key (addr_cd) references sale (addr_cd),
    constraint FK_sale_TO_biding_2
        foreign key (sal_no) references sale (sn),
    constraint FK_user_TO_biding_1
        foreign key (buyer_id) references user (id)
);

-- create index idx_no
--     on biding (no);

