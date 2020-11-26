
/* SPRING SECURITY 를 적용할 경우 
 * 회원 가입시 비즈니스 계층(서비스)에서  회원가입과 권한을 함께 insert하도록 처리한다 (트랜잭션 처리 필요!)
 */
drop table security_member;
create table security_member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	name varchar2(100) not null,
	address varchar2(100) not null,
	enabled number default 1 not null 
)

select * from security_member;
delete from security_member;
commit



-- 아이디는 id , 패스워드는 password , 
-- 탈퇴여부(0은 탈퇴, 1은 가입상태)는 enabled 로 이름주면 된다 

-- 비밀번호 암호화해서 등록해야 하므로 어플리케이션의 회원가입을 이용한다 


-- insert into security_member(id,password,name,address,enabled) 
-- values('java','1234','아이유','판교',1);

--select id,password,name,address,enabled from security_member
--where id='java' and enabled=1;

/*
 * SPRING SECURITY는 권한이 일치하는 대상에 대해 인가하기 때문에 
   관리자 권한 즉, ROLE_ADMIN을 보유하고 있더라도 
   사용자 권한인 ROLE_MEMBER 보유하고 있지 않을 경우 접근을 못하게 된다 
   따라서 한 유저는 여러개의 권한(1:n)을 보유할 수 있어야 하므로 별도의 권한 테이블을 생성한다 
 */
drop table authorities;
delete from authorities;
create table authorities(
	username varchar2(100) not null,
	authority varchar(30) not null,
	constraint fk_authorities foreign key(username) references security_member(id),
	constraint member_authorities primary key(username,authority)
)
delete from authorities;
-- -- 어플리케이션에서 회원가입을 하면 ROLE_MEMBER가 등록된다 

-----------------------------------------------------------

--  관리자 권한까지 추가해본다 
insert into authorities(username,authority) values('admin','ROLE_ADMIN');
commit

select * from authorities;
---------------------------------------------------------------------------










/* Table 생성 */

-- 1. rs_user 
DROP TABLE rs_user;
CREATE TABLE rs_user(
	id            VARCHAR2(50)  PRIMARY KEY, -- 가입할 때 활성화회원 중복확인
	password      VARCHAR2(50)  NOT NULL,
	name          VARCHAR2(50)  NOT NULL,
	nickname      VARCHAR2(50)  NOT NULL, -- 가입할 때 활성화회원 중복확인
	tel           VARCHAR2(50), -- 선택입력사항
	address       VARCHAR2(100) NOT NULL,
	business_name VARCHAR2(50),  -- 선택입력사항
	business_pic  VARCHAR2(100), -- 선택입력사항
	business_no   VARCHAR2(100), -- 선택입력사항 
	is_enabled    NUMBER        DEFAULT 1 NOT NULL 
);

-- 일반 고객 가입 시 SQL문
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('java', '1', '정예울', '파프리카', '010-3595-9818', '경기도 부천시 조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring', '1', '정예울', '파프리카', '010-3595-9818', '경기도 부천시 조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('java1', '1', '정예울1', '파프리카1', '110-3595-9818', '경기도 부천시1');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('java2', '1', '정예울2', '파프리카2', '210-3595-9818', '경기도 부천시2 조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('java3', '1', '정예울3', '파프리카3', '310-3595-9818', '경기도 부천시3 조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('java4', '1', '정예울4', '파프리카4', '410-3595-9818', '경기도 부천시4 조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('java5', '1', '정예울5', '파프리카5', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');

-- 사장 가입 시 SQL문
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang', '1', '스퉐붝스', '커피왕', '010-2475-2081', '용인','스타벅스','이미지없음','000');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang1', '1', '스퉐붝스1', '커피왕1', '110-2475-2081', '용인1','스타벅스1','이미지없음','001');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang2', '1', '스퉐붝스2', '커피왕2', '210-2475-2081', '용인2','스타벅스2','이미지없음','002');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang3', '1', '스퉐붝스3', '커피왕3', '310-2475-2081', '용인3','스타벅스3','이미지없음','003');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang4', '1', '스퉐붝스4', '커피왕4', '410-2475-2081', '용인4','스타벅스4','이미지없음','004');



-- 탈퇴 시 SQL문
-- update rs_user SET is_enabled=0, nickname='알수없음' WHERE id=?

SELECT *
FROM   rs_user

-- 관리자 INSERT
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('admin', 'admin', '관리자', '관리자', '010-9000-0805', '수원 장안구')


-- 2. authorities 
drop table authorities;
create table authorities(
	username  varchar2(50) not null,
	authority varchar2(50) not null,
	constraint fk_authorities foreign key(username) references rs_user(id) on delete cascade,
	constraint pk_authorities primary key(username, authority)
)

-- 관리자 권한 부여 (admin)
INSERT INTO authorities VALUES('admin', 'admin');

-- 사장 권한 부여 (manager)
INSERT INTO authorities VALUES('sajang', 'manager');
INSERT INTO authorities VALUES('sajang1', 'manager');
INSERT INTO authorities VALUES('sajang2', 'manager');
INSERT INTO authorities VALUES('sajang3', 'manager');
INSERT INTO authorities VALUES('sajang4', 'manager');


-- 고객 권한 부여 (member)
INSERT INTO authorities VALUES('java', 'member');
INSERT INTO authorities VALUES('java1', 'member');
INSERT INTO authorities VALUES('java2', 'member');
INSERT INTO authorities VALUES('java3', 'member');
INSERT INTO authorities VALUES('java4', 'member');
INSERT INTO authorities VALUES('java5', 'member');

SELECT *
FROM   authorities

-- rs_user와 authority 테이블 조인
SELECT  *
FROM    rs_user r, authorities a
WHERE   r.id = a.username


-- 3. cafe 
DROP TABLE cafe;
CREATE TABLE cafe(
	cafe_no    NUMBER        PRIMARY KEY,
	cafe_name  VARCHAR2(50)  NOT NULL,
	cafe_loc   VARCHAR2(50)  NOT NULL,
	cafe_pic   VARCHAR2(100) DEFAULT '이미지 없음',
	cafe_info  CLOB          NOT NULL,
	cafe_tel   VARCHAR2(50)  NOT NULL,
	id         VARCHAR2(50)  NOT NULL,
	constraint fk_cafe foreign key(id) references rs_user(id) on delete cascade
);

DROP SEQUENCE cafe_seq;
CREATE SEQUENCE cafe_seq;

-- 카페 insert(등록)
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스', '부천', '맛있습니다!!!!!!', '333', 'sajang');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '이디야', '용인', '맛없음', '031', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천', '맛있습니다!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스2', '부천', '맛있습니다!!!', '333', 'sajang2');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스3', '부천', '맛있습니다!!!!', '333', 'sajang3');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스4', '부천', '맛있습니다!!!!!', '333', 'sajang4');


-- 사장 탈퇴 시
--update rs_user SET is_enabled=0, nickname='알수없음' WHERE id=2
--delete from cafe where id=2

SELECT *
FROM   cafe

-- 4. operating_time
DROP TABLE operating_time;
CREATE TABLE operating_time(
	cafe_no      NUMBER        PRIMARY KEY,
	weekday_time VARCHAR2(50),
	weekend_time VARCHAR2(50),
	holiday_time VARCHAR2(50),
	constraint fk_operating_time foreign key(cafe_no) references cafe(cafe_no) on delete cascade
)

-- 카페 운영시간 insert
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(1, '08:00~22:00', '10:00~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(2, '09:00~24:00', '10:02~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(3, '08:00~22:00', '10:03~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(4, '08:00~22:00', '10:04~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(5, '08:00~22:00', '10:05~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(6, '08:00~22:00', '10:06~20:00','공휴일휴무');

select *
from operating_time

SELECT *
FROM   operating_time o, cafe c
WHERE  o.cafe_no = c.cafe_no


-- 6. review
DROP TABLE review;
CREATE TABLE review(
	cafe_no        NUMBER        NOT NULL,
	id             VARCHAR2(50)  NOT NULL,
	review_no      NUMBER        NOT NULL,
	review_content CLOB          NOT NULL,
	review_regdate DATE          NOT NULL,
	constraint fk_review_cafe_no foreign key(cafe_no) references cafe(cafe_no) on delete cascade,
	constraint fk_review_id foreign key(id) references rs_user(id) on delete cascade,
	constraint pk_review primary key(cafe_no, id)
)

DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq;

INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (1, 'java', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (2, 'spring', review_seq.nextval, '역시맛없네요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (3, 'java1', review_seq.nextval, '맛있어요1', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (4, 'java2', review_seq.nextval, '맛있어요2', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (5, 'java3', review_seq.nextval, '맛있어요3', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (6, 'java4', review_seq.nextval, '맛있어요4', sysdate);
-- cafe table과 review table 조인
SELECT *
FROM   cafe f, review r
WHERE  f.cafe_no = r.cafe_no

-- 7. property
DROP TABLE property;
CREATE TABLE property(
	cafe_no   NUMBER  PRIMARY KEY,
	service   NUMBER  NOT NULL,
	taste     NUMBER  NOT NULL,
	price     NUMBER  NOT NULL,
	mood      NUMBER  NOT NULL,
	diversity NUMBER  NOT NULL,
	constraint fk_property foreign key(cafe_no) references cafe(cafe_no) on delete cascade
)

INSERT INTO property VALUES (1, 1, 0, -2, 1, 0);
INSERT INTO property VALUES (2, 1, 1, -2, 1, -2);
INSERT INTO property VALUES (3, 0, 1, -2, 1, -2);
INSERT INTO property VALUES (4, 1, 0, -2, 1, -2);
INSERT INTO property VALUES (5, 1, 1, 0, 1, -2);
INSERT INTO property VALUES (6, 1, 1, -2, 0, -2);

--cafe table과 property table 조인
SELECT *
FROM   property p, cafe f
WHERE  p.cafe_no = f.cafe_no


-- 8. beans_pick
DROP TABLE beans_pick;
CREATE TABLE beans_pick(
   beans_no          NUMBER        PRIMARY KEY,
   beans_title       VARCHAR2(50)  NOT NULL,
   beans_content     clob          NOT NULL,
   beans_regdate     date          not null,
   id                VARCHAR2(50)  NOT NULL,
   constraint fk_beans_pick foreign key(id) references rs_user(id) on delete cascade
);

insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페','개쩔어',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페1','개쩔어1',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페2','개쩔어2',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페3','개쩔어3',sysdate,'admin');


DROP SEQUENCE beans_pick_seq;
CREATE SEQUENCE beans_pick_seq;


-- 9. menu
DROP TABLE menu;
CREATE TABLE menu(
   menu_name      varchar2(100) not null,
   menu_price       NUMBER         not null,
   cafe_no         NUMBER        NOT NULL,
   constraint fk_menu_cafe foreign key(cafe_no) references cafe(cafe_no) on delete cascade,
   constraint pk_menu_cafe primary key(cafe_no, menu_name)
);
DROP SEQUENCE menu_seq;
CREATE SEQUENCE menu_seq;
select*from menu;
--메뉴 insert
insert into menu values('아메리카노(ICE)',3000,1);
insert into menu values('아메리카노(HOT)',2500,1);
insert into menu values('카페라떼(ICE)',3500,1);
insert into menu values('카페라떼(HOT)',3000,1);
insert into menu values('바닐라라떼(ICE)',4000,1);

insert into menu values('이디야카노(ICE)',4000,2);
insert into menu values('이디야카노(HOT)',3500,2);
insert into menu values('이디야라떼(ICE)',4500,2);
insert into menu values('이디야라떼(HOT)',4000,2);
insert into menu values('이닐라라떼(ICE)',5000,2);

insert into menu values('이디야카노1(ICE)',4100,3);
insert into menu values('이디야카노1(HOT)',3100,3);
insert into menu values('이디야라떼1(ICE)',4100,3);
insert into menu values('이디야라떼1(HOT)',4100,3);
insert into menu values('이닐라라떼1(ICE)',5100,3);

insert into menu values('이디야카노2(ICE)',4200,4);
insert into menu values('이디야카노2(HOT)',3200,4);
insert into menu values('이디야라떼2(ICE)',4200,4);
insert into menu values('이디야라떼2(HOT)',4200,4);
insert into menu values('이닐라라떼2(ICE)',5200,4);

insert into menu values('이디야카노3(ICE)',4300,5);
insert into menu values('이디야카노3(HOT)',3300,5);
insert into menu values('이디야라떼3(ICE)',4300,5);
insert into menu values('이디야라떼3(HOT)',4300,5);
insert into menu values('이닐라라떼3(ICE)',5300,5);

insert into menu values('이디야카노4(ICE)',4400,6);
insert into menu values('이디야카노4(HOT)',3400,6);
insert into menu values('이디야라떼4(ICE)',4400,6);
insert into menu values('이디야라떼4(HOT)',4400,6);
insert into menu values('이닐라라떼4(ICE)',5400,6);

-- 10. order_info
DROP TABLE order_info;
CREATE TABLE order_info(
   order_no         NUMBER        primary key,
   order_date       date          not null,
   id               VARCHAR2(50)  NOT NULL,
   constraint fk_order_info foreign key(id) references rs_user(id) on delete cascade
);
--order_info Insert
insert into order_info(order_no,order_date,id) values(order_info_seq.nextval,sysdate,'java');
insert into order_info values(order_info_seq.nextval,sysdate,'spring');
insert into order_info(order_no,order_date,id) values(order_info_seq.nextval,sysdate,'java1');
insert into order_info(order_no,order_date,id) values(order_info_seq.nextval,sysdate,'java2');
insert into order_info(order_no,order_date,id) values(order_info_seq.nextval,sysdate,'java3');
insert into order_info(order_no,order_date,id) values(order_info_seq.nextval,sysdate,'java4');
insert into order_info(order_no,order_date,id) values(order_info_seq.nextval,sysdate,'java5');

DROP SEQUENCE order_info_seq;
CREATE SEQUENCE order_info_seq;

select *
from   order_info



-- 11. order_detail
DROP TABLE order_detail;
CREATE TABLE order_detail(
   order_detail_no NUMBER         primary key,
   menu_count      number         not null,
   menu_name       varchar2(50)   NOT NULL,
   cafe_no         number         not null,
   order_no        number         not null,
   constraint fk_order_detail_order_no foreign key(order_no) references order_info(order_no) on delete cascade,
   constraint fk_order_detail_menu_name foreign key(cafe_no, menu_name) references menu(cafe_no, menu_name) on delete cascade
); --병철씨.. 복합프라이머리키를 참조하기 위해서는 위와같이 진행하시면 됩니다.
-- constraint 제약조건명 foreign key(복프키1, 복프키2) references 테이블명(복프키1, 복프키2) on delete cascade

--order_detail insert
insert into order_detail values(order_detail_seq.nextval,2,'아메리카노(ICE)',1,1);
insert into order_detail values(order_detail_seq.nextval,1,'아메리카노(HOT)',1,1);
insert into order_detail values(order_detail_seq.nextval,2,'카페라떼(HOT)',1,1);
insert into order_detail values(order_detail_seq.nextval,2,'바닐라라떼(ICE)',1,1);

insert into order_detail values(order_detail_seq.nextval,2,'이디야카노(ICE)',2,2);
insert into order_detail values(order_detail_seq.nextval,1,'이디야카노1(HOT)',3,2);
insert into order_detail values(order_detail_seq.nextval,2,'이디야라떼(HOT)',2,2);
insert into order_detail values(order_detail_seq.nextval,2,'이닐라라떼2(ICE)',4,2);

insert into order_detail values(order_detail_seq.nextval,2,'이디야카노3(ICE)',5,3);
insert into order_detail values(order_detail_seq.nextval,1,'이디야카노(HOT)',2,3);
insert into order_detail values(order_detail_seq.nextval,2,'이디야라떼4(HOT)',6,3);
insert into order_detail values(order_detail_seq.nextval,2,'이닐라라떼(ICE)',2,3);

insert into order_detail values(order_detail_seq.nextval,2,'이디야카노(ICE)',2,4);
insert into order_detail values(order_detail_seq.nextval,1,'이디야카노(HOT)',2,4);
insert into order_detail values(order_detail_seq.nextval,2,'이디야라떼1(HOT)',3,4);
insert into order_detail values(order_detail_seq.nextval,2,'이닐라라떼(ICE)',2,4);

insert into order_detail values(order_detail_seq.nextval,2,'이디야카노(ICE)',2,5);
insert into order_detail values(order_detail_seq.nextval,1,'이디야카노1(HOT)',3,5);
insert into order_detail values(order_detail_seq.nextval,2,'이디야라떼(HOT)',2,5);
insert into order_detail values(order_detail_seq.nextval,2,'이닐라라떼3(ICE)',5,5);


select *from order_detail

DROP SEQUENCE order_detail_seq;
CREATE SEQUENCE order_detail_seq;


select * from rs_user rs, cafe c, menu m
where rs.id=c.id and c.cafe_no = m.cafe_no and rs.id='sajang';

--id가 'java'인 고객이 주문상세목록
select * from rs_user rs, menu m,order_info oi,order_detail od
where rs.id=oi.id and oi.order_no = od.order_no and m.menu_name=od.menu_name and rs.id='java';
--order_no가 1인 주문의 총액 구하기
select sum(p.menu_price*p.menu_count) as 총액 from(
select * from rs_user rs, menu m,order_info oi,order_detail od
where rs.id=oi.id and oi.order_no = od.order_no and m.menu_name=od.menu_name and oi.order_no=1) p

--삭제 테스트
delete from rs_user where id='java';
delete from cafe where cafe_no=2;

