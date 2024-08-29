create table hoisting_history
(
    sn           bigint                              not null auto_increment,
    sal_no       bigint                              not null,
    addr_cd      varchar(8)                          not null,
    addr_name	 varchar(20)						 not null,
    seller_id    varchar(25)                         not null,
    sal_id_cd    varchar(25)                         not null,
    hoisting     timestamp                           not null,
    first_r_date timestamp default CURRENT_TIMESTAMP null,
    first_idno   varchar(10)                         not null,
    last_r_date  timestamp default CURRENT_TIMESTAMP not null,
    last_idno    varchar(10)                         not null,
    primary key (sn, sal_no),
    constraint FK_sale_TO_hoisting_history_1
        foreign key (addr_cd) references sale (addr_cd),
    constraint FK_sale_TO_hoisting_history_2
        foreign key (sal_no) references sale (sn)
);

