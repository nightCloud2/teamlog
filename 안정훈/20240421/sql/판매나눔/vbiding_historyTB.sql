create table biding_history
(
	sn           bigint                              not null auto_increment,
    sal_no       bigint                              not null,
    bid_no       bigint                              not null,
	addr_cd      varchar(8)                          not null,
    addr_name    varchar(100)                        not null,
    bid_cd       char                                not null,
    buyer_id     varchar(25)                         not null,
    price        int                                 not null,
    reason       text                                null,
    bid_date     timestamp                           not null comment '가격을 제시한 일자',
    grand_state  char      default 'N'               not null comment 'Y: 승인/N: 미승인',
    grant_date   timestamp                           not null comment '가격 제시를 승인한 일자',
    cx_state     char      default 'N'               null comment '신청을 취소한 상태',
    cx_date      timestamp                           null comment '신청을 취소한 일자',
    first_r_date timestamp default CURRENT_TIMESTAMP null,
    first_idno   varchar(10)                         not null,
    last_r_date  timestamp default CURRENT_TIMESTAMP not null,
    last_idno    varchar(10)                         not null,
    primary key (sn, sal_no, bid_no),
    constraint FK_biding_TO_biding_history_1
        foreign key (addr_cd) references biding (addr_cd),
    constraint FK_biding_TO_biding_history_2
        foreign key (sal_no) references biding (sal_no),
    constraint FK_biding_TO_biding_history_3
        foreign key (bid_no) references biding (sn)
);

