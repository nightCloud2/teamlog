alter table img
    add group_id int not null after no;

alter table img
    drop column tb_name;

alter table img
    drop column tb_no;

alter table img
    modify img_full_rt text not null after e_name;

//위와 같이 변경한 이유 교차테이블 생성하여 쓸모없는거 삭제

create table img_group
(
    group_id int,
    img_no  BIGINT not null,
    constraint img_group_pk
        primary key (group_id, img_no),
    constraint g_img_communo
        foreign key (img_no) references img (no)
);

// group_id 추가 컬럼
alter table community_board
    add img_full_rt text not null;

alter table community_board
    add group_no int null;

//필요테이블 외래키 맺기
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

//필요테이블 외래키 삭제