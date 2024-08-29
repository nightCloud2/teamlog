create index sale_addr_cd_sn_index
    on sale (addr_cd asc, sn desc);

create index hoisting_history_addr_cd_sal_no_sn_index
    on hoisting_history (addr_cd, sal_no, sn);

create index addr
    on sale_history (addr_cd, sal_no, sn);

create index biding_addr_cd_sal_no_sn_index
    on biding (addr_cd, sal_no, sn);

create index biding_history_addr_cd_sal_no_bid_no_sn_index
    on biding_history (addr_cd, sal_no, bid_no, sn);