create table sale_history
(
	sn               bigint                        not null auto_increment,
    sal_no           bigint                              not null,
    addr_cd          varchar(8)                          not null comment 'AUTOx',
    addr_name		 varchar(100)						 not null,
    seller_id        varchar(25)                         not null,
    addr_nm          varchar(20)                         not null,
    sale_i_cd        varchar(10)                         not null,
    tx_s_cd          varchar(10)                         not null,
    trade_s_cd_1     varchar(10)                         not null,
    trade_s_cd_2     varchar(10)                         not null,
    stat_s_cd        varchar(10)                         not null,
    price            int                                 not null,
    pickup_addr_cd   varchar(8)                          not null,
    pickup_addr_name varchar(20)                         not null,
    detail_addr      text                                not null,
    tag              varchar(500)                        not null,
    buy_id           varchar(25)                         not null,
    buy_nick         varchar(20)                         not null,
    r_date           timestamp                           not null,
    m_date           timestamp                           not null,
    ur_state         char                                not null,
    ad_state         char                                not null,
    first_r_date     timestamp default CURRENT_TIMESTAMP null,
    first_idno       varchar(10)                         not null,
    last_r_date      timestamp default CURRENT_TIMESTAMP null,
    last_idno        varchar(10)                         not null,
    primary key (sn, sal_no),
    constraint FK_sale_TO_sale_history_1
        foreign key (addr_cd) references sale (addr_cd),
    constraint FK_sale_TO_sale_history_2
        foreign key (sal_no) references sale (sn)
);