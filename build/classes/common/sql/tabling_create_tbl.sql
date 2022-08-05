drop table members cascade constraints purge;
drop table stores cascade constraints purge;
drop table reviews purge;
drop table reservations purge;
drop table interested_stores purge;
drop table boards cascade constraints purge;
drop table comments purge;
drop sequence store_id_seq;
drop sequence review_id_seq;
drop sequence reservation_id_seq;
drop sequence board_id_seq;
drop sequence comment_id_seq;

-- members tbl
create table members (member_id varchar2(30) primary key,
                      password varchar2(30) not null,
                      nickname varchar2(30) not null,
                      phone_num varchar2(20),
                      role number(1) not null);

-- stores tbl
create table stores (store_id number primary key,
                     store_name varchar2(100) not null unique,
                     memeber_id varchar2(30) constraint st_mb_id references members(member_id) on delete cascade,
                     store_address varchar2(1000) not null,
                     telephone varchar2(20),
                     sit_capacity number(5) not null,
                     available_time varchar2(50) not null,
                     holiday number,
                     represent_menu varchar2(2000),
                     store_img_url varchar2(1000),
                     food_category varchar2(50) not null,
                     approval_status number default 0);
                     

create sequence store_id_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 99999
    nocycle
    nocache;
    
-- reviews tbl
create table reviews (review_id number primary key,
                      member_id varchar2(30) constraint rv_mb_id_fk references members(member_id) on delete cascade,
                      store_name varchar2(100) constraint rv_st_name_fk references stores(store_name) on delete cascade,
                      content varchar2(2000) not null,
                      create_date varchar2(50) default to_char(sysdate, 'yyyy-mm-dd hh:mm:ss'),
                      taste_score varchar2(30) not null,
                      heart number(5) default 0);

create sequence review_id_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 99999
    nocycle
    nocache;
                  
-- reservations tbl
create table reservations (reservation_id number primary key,
                           member_id varchar2(30) constraint rs_mb_id_fk references members(member_id) on delete cascade,
                           store_name varchar2(100) constraint rs_st_name_fk references stores(store_name) on delete cascade,
                           people_num number(5) not null,
                           reservation_time varchar2(30) not null,
                           deposit varchar2(50) not null);

create sequence reservation_id_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 99999
    nocycle
    nocache;               
    
-- interested_stores tbl
create table interested_stores (member_id varchar2(30) constraint is_mb_id_fk references members(member_id) on delete cascade,
                                store_name varchar2(100) constraint is_st_name_fk references stores(store_name) on delete cascade);

-- boards tbl (수정본)
create table boards (board_id number primary key,
                     member_id varchar2(30) constraint bo_mb_id_fk references members(member_id) on delete cascade,
                     title varchar2(22 char) not null,
                     content varchar2(2000) not null,
                     create_date varchar2(50) default to_char(sysdate, 'yy-mm-dd hh24:mi'),
                     hits number default 0);
    
-- comments tbl
create table comments (comment_id number primary key,
                       member_id varchar2(30) constraint cm_mb_id_fk references members(member_id) on delete cascade,
                       board_id number constraint cm_bo_id_fk references boards(board_id) on delete cascade,
                       content varchar2(2000) not null,
                       create_date varchar2(50) default to_char(sysdate, 'yyyy-mm-dd hh:mm:ss'));
                       
create sequence comment_id_seq
    increment by 1
    start with 1
    minvalue 1
    maxvalue 99999
    nocycle
    nocache;                          