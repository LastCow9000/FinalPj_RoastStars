/* Table 드랍 */

drop table menu_kind;
DROP TABLE my_pick;
DROP TABLE evaluated_property;
drop table menu_espresso;

/* 한번만 실행하고 		
DROP TABLE order_detail;
DROP TABLE order_info;
  			 지워도 됨*/

DROP TABLE beans_pick;
DROP TABLE property;
DROP TABLE review;
DROP TABLE operating_time;
drop table authorities;
DROP TABLE menu;
DROP TABLE cafe;
DROP TABLE rs_user;


DROP SEQUENCE cafe_seq;
DROP SEQUENCE review_seq;
DROP SEQUENCE beans_pick_seq;

/* 한번만 실행하고 		
DROP SEQUENCE order_detail_seq;
DROP SEQUENCE order_info_seq;
 			 지워도 됨*/

DROP SEQUENCE my_pick_seq;

/* Table 생성 */

-- 1. rs_user 
CREATE TABLE rs_user(
   id            VARCHAR2(50)  PRIMARY KEY, -- 가입할 때 활성화회원 중복확인
   password      VARCHAR2(100)  NOT NULL,
   name          VARCHAR2(50)  NOT NULL,
   nickname      VARCHAR2(50)  NOT NULL, -- 가입할 때 활성화회원 중복확인
   tel           VARCHAR2(50), -- 선택입력사항
   address       VARCHAR2(200) NOT NULL,
   business_name VARCHAR2(50),  -- 선택입력사항
   business_pic  VARCHAR2(500), -- 선택입력사항
   business_no   VARCHAR2(100), -- 선택입력사항 
   enabled    NUMBER        DEFAULT 1 NOT NULL 
);

-- 2. authorities 
create table authorities(
   username  varchar2(50) not null,
   authority varchar2(50) not null,
   constraint fk_authorities foreign key(username) references rs_user(id) on delete cascade,
   constraint pk_authorities primary key(username, authority)
);

-- 3. cafe 
CREATE TABLE cafe(
   cafe_no    NUMBER        PRIMARY KEY,
   cafe_name  VARCHAR2(50)  NOT NULL,
   cafe_loc   VARCHAR2(200)  NOT NULL,
   cafe_pic   VARCHAR2(500) DEFAULT 'no_image.jpg',
   cafe_info  CLOB          NOT NULL,
   cafe_tel   VARCHAR2(50)  NOT NULL,
   id         VARCHAR2(50)  NOT NULL,
   constraint fk_cafe foreign key(id) references rs_user(id) on delete cascade
);
CREATE SEQUENCE cafe_seq;

-- 4. operating_time
CREATE TABLE operating_time(
   cafe_no      NUMBER        PRIMARY KEY,
   weekday_time VARCHAR2(50),
   weekend_time VARCHAR2(50),
   holiday_time VARCHAR2(50),
   constraint fk_operating_time foreign key(cafe_no) references cafe(cafe_no) on delete cascade
);

-- 5. review
CREATE TABLE review(
   cafe_no        NUMBER        NOT NULL,
   id             VARCHAR2(50)  NOT NULL,
   review_no      NUMBER        NOT NULL UNIQUE,
   review_content CLOB          NOT NULL,
   review_regdate DATE          NOT NULL,
   constraint fk_review_cafe_no foreign key(cafe_no) references cafe(cafe_no) on delete cascade,
   constraint fk_review_id foreign key(id) references rs_user(id) on delete cascade,
   constraint pk_review primary key(cafe_no, id)
);

CREATE SEQUENCE review_seq;

-- 6. property
CREATE TABLE property(
   cafe_no   NUMBER  PRIMARY KEY,
   service   NUMBER  NOT NULL,
   taste     NUMBER  NOT NULL,
   price     NUMBER  NOT NULL,
   mood      NUMBER  NOT NULL,
   diversity NUMBER  NOT NULL,
   constraint fk_property foreign key(cafe_no) references cafe(cafe_no) on delete cascade
);

-- 7. beans_pick
CREATE TABLE beans_pick(
   beans_no          NUMBER        PRIMARY KEY,
   beans_title       VARCHAR2(50)  NOT NULL,
   beans_content     clob          NOT NULL,
   beans_pic         VARCHAR2(500) DEFAULT 'no_image.jpg' NOT NULL,
   beans_regdate     date          not null,
   id                VARCHAR2(50)  NOT NULL,
   constraint fk_beans_pick foreign key(id) references rs_user(id) on delete cascade
);

CREATE SEQUENCE beans_pick_seq;

-- 8. menu
CREATE TABLE menu(
   menu_name      varchar2(100) not null,
   menu_price      NUMBER         not null,
   cafe_no         NUMBER        NOT NULL,
   constraint fk_menu_cafe foreign key(cafe_no) references cafe(cafe_no) on delete cascade,
   constraint pk_menu_cafe primary key(cafe_no, menu_name)
);

-- 9. evaluated_property 테이블 생성
CREATE TABLE evaluated_property(
	review_no   number   PRIMARY KEY,
	service     number   DEFAULT 0 NOT NULL,
	taste       number   DEFAULT 0 NOT NULL,
	price       number   DEFAULT 0 NOT NULL,
	mood        number   DEFAULT 0 NOT NULL,
	diversity   number   DEFAULT 0 NOT NULL,
   constraint fk_evaluated_property foreign key(review_no) references review(review_no) on delete cascade
);

-- 10. My Pick 테이블 생성
CREATE TABLE my_pick(
	pick_no number primary key,
	id varchar2(100),
	cafe_no number,
	constraint fk_id foreign key(id) references rs_user(id) on delete cascade,
	constraint fk_cafe_no foreign key(cafe_no) references cafe(cafe_no) on delete cascade
);
CREATE SEQUENCE my_pick_seq;

-- 11 메뉴 종류를 담고 있는 테이블 생성
CREATE TABLE menu_kind(
   menu_name     varchar2(100)  NOT NULL,
   cafe_no       NUMBER         NOT NULL,
   espresso      NUMBER         DEFAULT 1 NOT NULL, -- 1:에스프레소 / 0:논 에스프레소
   constraint fk_menu_kind foreign key(cafe_no, menu_name) references menu(cafe_no, menu_name) on delete cascade,
   constraint pk_menu_kind primary key(cafe_no, menu_name)
);

----------------------------------------------------------------------------------------------------------------------------
/* 1. id: admin으로 가입  
 * 2. id: user1으로 가입
 * 3. id: sajang1로 가입 사장체크하고 가입하기
 * 4. 이 밑으로 걍 실행
 * */
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO authorities VALUES('admin', 'ROLE_ADMIN');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('test', '1234', '정예울2', '파프리카2', '21035959818', '경기도 부천시2');
INSERT INTO authorities VALUES('test', 'ROLE_MANAGER');

/* 더미 데이터 */
-- 일반 고객 가입 시 SQL문  --rs_user
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('user2', '1234', '정예울2', '파프리카2', '21035959818', '경기도 부천시2');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('user3', '1234', '정예울3', '파프리카3', '31035959818', '경기도 부천시3');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('user4', '1234', '정예울4', '파프리카4', '41035959818', '경기도 부천시4');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('user5', '1234', '정예울5', '파프리카5', '51035959818', '경기도 부천시5');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('user6', '1234', '정예울6', '파프리카6', '61035959818', '경기도 부천시6');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('user7', '1234', '정예울7', '파프리카7', '71035959818', '경기도 부천시7');

-- 사장 가입 시 SQL문
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang2', '1234', '스퉐붝스2', '고병철2', '21024752081', '용인2','스타벅스2','no_image.jpg','002');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang3', '1234', '스퉐붝스3', '고병철3', '31024752081', '용인3','스타벅스3','no_image.jpg','003');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang4', '1234', '스퉐붝스4', '고병철4', '41024752081', '용인4','스타벅스4','no_image.jpg','004');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang5', '1234', '스퉐붝스5', '고병철5', '51024752081', '용인5','스타벅스5','no_image.jpg','005');

INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang6', '1234', '스퉐붝스6', '고병철6', '61024752081', '용인6','스타벅1','no_image.jpg','001');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang7', '1234', '스퉐붝스7', '고병철7', '71024752081', '용인7','스타벅스2','no_image.jpg','002');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang8', '1234', '스퉐붝스8', '고병철8', '81024752081', '용인8','스타벅스3','no_image.jpg','003');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang9', '1234', '스퉐붝스9', '고병철9', '91024752081', '용인9','스타벅스4','no_image.jpg','004');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang10', '1234', '스퉐붝스10', '고병철10', '10024752081', '용인10','스타벅스5','no_image.jpg','005');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang11', '1234', '스퉐붝스11', '고병철11', '11024752081', '용인11','스타벅1','no_image.jpg','001');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang12', '1234', '스퉐붝스12', '고병철12', '12024752081', '용인12','스타벅스2','no_image.jpg','002');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang13', '1234', '스퉐붝스13', '고병철13', '13024752081', '용인13','스타벅스3','no_image.jpg','003');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang14', '1234', '스퉐붝스14', '고병철14', '14024752081', '용인14','스타벅스4','no_image.jpg','004');
INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
VALUES('sajang15', '1234', '스퉐붝스15', '고병철15', '15024752081', '용인15','스타벅스5','no_image.jpg','005');
-- 관리자 권한 부여 (admin) --authorities
--회원가입 admin으로 한 후에 권한 줘야함


-- 사장 권한 부여 (manager)
INSERT INTO authorities VALUES('sajang1', 'ROLE_MANAGER');
INSERT INTO authorities VALUES('sajang5', 'ROLE_MANAGER');
INSERT INTO authorities VALUES('sajang2', 'ROLE_MANAGER');
INSERT INTO authorities VALUES('sajang3', 'ROLE_MANAGER');
INSERT INTO authorities VALUES('sajang4', 'ROLE_MANAGER');

-- 고객 권한 부여 (member)
INSERT INTO authorities VALUES('user6', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('user2', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('user3', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('user4', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('user5', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('user7', 'ROLE_MEMBER');

-- 카페 insert(등록)
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id) VALUES (cafe_seq.nextval, '스타벅스1', '부천1', '맛있습니다!!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스2', '부천2', '맛없음', '031', 'sajang2');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스3', '부천3', '맛있습니다!', '333', 'sajang3');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스4', '부천4', '맛있습니다!!!', '333', 'sajang4');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스5', '부천5', '맛있습니다!!!!', '333', 'sajang5');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스6', '부천6', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스7', '부천7', '맛있습니다!!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스8', '부천8', '맛없음', '031', 'sajang2');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스9', '부천9', '맛있습니다!', '333', 'sajang3');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스10', '부천10', '맛있습니다!!!', '333', 'sajang4');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스11', '부천11', '맛있습니다!!!!', '333', 'sajang5');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스12', '부천12', '맛있습니다!!!!!', '333', 'sajang1');

INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스1', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스12', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스12', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스12', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스12', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스12', '부천12', '맛있습니다!!!!!', '333', 'sajang1');
INSERT INTO cafe(cafe_no, cafe_name, cafe_loc, cafe_info, cafe_tel, id)
VALUES (cafe_seq.nextval, '스타벅스12', '부천12', '맛있습니다!!!!!', '333', 'sajang1');

-- 카페 운영시간 insert
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(1, '08:00~22:01', '10:00~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(2, '09:00~24:00', '10:02~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(3, '08:00~22:02', '10:03~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(4, '08:00~22:03', '10:04~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(5, '08:00~22:04', '10:05~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(6, '08:00~22:05', '10:06~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(7, '08:00~22:06', '10:00~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(8, '09:00~24:07', '10:02~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(9, '08:00~22:08', '10:03~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(10, '08:00~22:09', '10:04~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(11, '08:00~22:00', '10:05~20:00','공휴일휴무');
INSERT INTO operating_time(cafe_no, weekday_time,weekend_time,holiday_time)
VALUES(12, '08:00~22:00', '10:06~20:00','공휴일휴무');


--리뷰
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (1, 'user1', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (1, 'user2', review_seq.nextval, '역시맛없네요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (1, 'user3', review_seq.nextval, '맛있어요1', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (1, 'user4', review_seq.nextval, '맛있어요2', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (1, 'user5', review_seq.nextval, '맛있어요3', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (1, 'user6', review_seq.nextval, '맛있어요4', sysdate);

--특성 --
INSERT INTO property VALUES (1, 1, 0, -2, 1, 0);
INSERT INTO property VALUES (2, 1, 1, -2, 1, -2);
INSERT INTO property VALUES (3, 0, 1, -2, 1, -2);
INSERT INTO property VALUES (4, 1, 0, -2, 1, -2);
INSERT INTO property VALUES (5, 1, 1, 0, 1, -2);
INSERT INTO property VALUES (6, 1, 1, -2, 0, -2);

--빈즈픽
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페','개쩔어',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페1','개쩔어1',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페2','개쩔어2',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페3','개쩔어3',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페4','개쩔어',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페5','개쩔어1',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페6','개쩔어2',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페7','개쩔어3',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페8','개쩔어',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페9','개쩔어1',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페10','개쩔어2',sysdate,'admin');
insert into beans_pick(beans_no,beans_title,beans_content,beans_regdate,id)
values (beans_pick_seq.nextval,'크리스마스분위기나는 카페11','개쩔어3',sysdate,'admin');
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

insert into menu values('그린티라떼(ICE)',3000,1);
insert into menu values('그린티라떼(HOT)',3000,1);
insert into menu values('밀크티(ICE)',3000,1);
insert into menu values('밀크티(HOT)',3000,1);
-- evaluated_property 
insert into EVALUATED_PROPERTY values(1,2,2,2,3,3);
insert into EVALUATED_PROPERTY values(2,2,-2,2,3,3);
insert into EVALUATED_PROPERTY values(3,2,2,-2,-3,3);
insert into EVALUATED_PROPERTY values(4,2,-2,2,3,-3);
insert into EVALUATED_PROPERTY values(5,2,2,-2,3,-3);

insert into EVALUATED_PROPERTY values(6,2,2,2,3,3);


-- my pick
insert into my_pick values(my_pick_seq.nextval, 'user1', 2);
insert into my_pick values(my_pick_seq.nextval, 'user1', '3');
insert into my_pick values(my_pick_seq.nextval, 'user1', '4');
insert into my_pick values(my_pick_seq.nextval, 'user1', '5');
insert into my_pick values(my_pick_seq.nextval, 'user1', '6');
insert into my_pick values(my_pick_seq.nextval, 'user1', '7');
insert into my_pick values(my_pick_seq.nextval, 'user1', '8');
insert into my_pick values(my_pick_seq.nextval, 'user1', '9');
insert into my_pick values(my_pick_seq.nextval, 'user1', '10');
insert into my_pick values(my_pick_seq.nextval, 'user1', '11');
insert into my_pick values(my_pick_seq.nextval, 'user1', '12');
insert into my_pick values(my_pick_seq.nextval, 'user1', '13');
insert into my_pick values(my_pick_seq.nextval, 'user1', '14');
insert into my_pick values(my_pick_seq.nextval, 'user1', '15');
insert into my_pick values(my_pick_seq.nextval, 'user1', '16');
insert into my_pick values(my_pick_seq.nextval, 'user1', '17');
insert into my_pick values(my_pick_seq.nextval, 'user1', '18');
insert into my_pick values(my_pick_seq.nextval, 'user1', '19');
insert into my_pick values(my_pick_seq.nextval, 'user1', '20');
insert into my_pick values(my_pick_seq.nextval, 'user1', '21');
insert into my_pick values(my_pick_seq.nextval, 'user1', '22');
insert into my_pick values(my_pick_seq.nextval, 'user1', '23');
insert into my_pick values(my_pick_seq.nextval, 'user1', '24');
insert into my_pick values(my_pick_seq.nextval, 'user1', '25');
insert into my_pick values(my_pick_seq.nextval, 'user1', '26');
insert into my_pick values(my_pick_seq.nextval, 'user1', '27');

insert into my_pick values(my_pick_seq.nextval, 'user2', '1');
insert into my_pick values(my_pick_seq.nextval, 'user2', '3');
insert into my_pick values(my_pick_seq.nextval, 'user2', '5');
-- MENU_KIND
insert into menu_kind(menu_name, cafe_no, espresso) values('그린티라떼(ICE)',1, 0);
insert into menu_kind(menu_name, cafe_no, espresso) values('그린티라떼(HOT)',1,0);
insert into menu_kind(menu_name, cafe_no, espresso) values('밀크티(ICE)',1,0);
insert into menu_kind(menu_name, cafe_no, espresso) values('밀크티(HOT)',1,0);
insert into menu_kind values('아메리카노(ICE)',1,1);
insert into menu_kind values('아메리카노(HOT)',1,1);
insert into menu_kind values('카페라떼(ICE)',1,1);
insert into menu_kind values('카페라떼(HOT)',1,1);
insert into menu_kind values('바닐라라떼(ICE)',1,1);