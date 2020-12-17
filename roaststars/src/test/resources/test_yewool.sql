select *
from   rs_user r, authorities a
where  r.id = a.username and id='admin'


delete from rs_user where id='admin';

insert into authorities values('admin', 'ROLE_ADMIN')
insert into authorities values('sajang', 'ROLE_MANAGER')
insert into 


select *
from   authorities

select *
from   cafe c
where  cafe_no=71

select *
from   rs_user
where  id='testtest'

---

-- 특성 필터 테스트
select c.cafe_no, c.cafe_name, c.cafe_loc, p.service, p.taste, p.price, p.mood, p.diversity
from   cafe c, property p
where  c.cafe_no = p.cafe_no AND p.cafe_no = 71

select c.cafe_no, c.cafe_name, c.cafe_loc, c.cafe_pic, c.cafe_info, c.cafe_tel, c.id, p.taste, p.service, p.mood, p.diversity, p.price
from   cafe c, property p
where  c.cafe_no = p.cafe_no and c.cafe_loc like '%판교%'
order by taste desc, service desc, null desc

-- 메뉴 추가 및 에스프레소 여부 테스트
CREATE TABLE menu_kind(
   menu_name     varchar2(100)  NOT NULL,
   cafe_no       NUMBER         NOT NULL,
   espresso      NUMBER         DEFAULT 1 NOT NULL, -- 1:에스프레소 / 0:논 에스프레소
   constraint fk_menu_kind foreign key(cafe_no, menu_name) references menu(cafe_no, menu_name) on delete cascade,
   constraint pk_menu_kind primary key(cafe_no, menu_name)
);

insert into menu values('아메리카노(ICE)',3000,71);
insert into menu values('아메리카노(HOT)',3000,71);
insert into menu values('카페라떼(ICE)',4000,71);
insert into menu values('카페라떼(HOT)',4000,71);

insert into menu values('그린티라떼(ICE)',5000,71);
insert into menu values('그린티라떼(HOT)',5000,71);
insert into menu values('밀크티(ICE)',5500,71);
insert into menu values('밀크티(HOT)',5500,71);

insert into menu_kind(menu_name, cafe_no) values('아메리카노(ICE)',71);
insert into menu_kind(menu_name, cafe_no) values('아메리카노(HOT)',71);
insert into menu_kind(menu_name, cafe_no) values('카페라떼(ICE)',71);
insert into menu_kind(menu_name, cafe_no) values('카페라떼(HOT)',71);

insert into menu_kind(menu_name, cafe_no, espresso) values('그린티라떼(ICE)',71, 0);
insert into menu_kind(menu_name, cafe_no, espresso) values('그린티라떼(HOT)',71,0);
insert into menu_kind(menu_name, cafe_no, espresso) values('밀크티(ICE)',71,0);
insert into menu_kind(menu_name, cafe_no, espresso) values('밀크티(HOT)',71,0);

select m.menu_name, m.cafe_no, m.menu_price, k.espresso
from   menu m, menu_kind k
where  m.cafe_no = k.cafe_no AND m.menu_name =k.menu_name AND m.cafe_no = 71

  	  SELECT   m.menu_name, m.menu_price, c.cafe_no,
               c.cafe_name, c.cafe_loc, c.cafe_pic, c.cafe_info, c.cafe_tel,
               k.espresso
      FROM     cafe c, menu m, menu_kind k
      WHERE    m.cafe_no = c.cafe_no AND m.cafe_no = k.cafe_no
      		   AND m.menu_name =k.menu_name AND c.cafe_no=71
      		   
      		   
      		   
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring1', '123', '정예울5', '파프리카1', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring2', '123', '정예울5', '파프리카2', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring3', '123', '정예울5', '파프리카3', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring4', '123', '정예울5', '파프리카4', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring5', '123', '정예울5', '파프리카5', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring6', '123', '정예울5', '파프리카6', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring7', '123', '정예울5', '파프리카7', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring8', '123', '정예울5', '파프리카8', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring9', '123', '정예울5', '파프리카9', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring10', '123', '정예울5', '파프리카10', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring11', '123', '정예울5', '파프리카11', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring12', '123', '정예울5', '파프리카12', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring13', '123', '정예울5', '파프리카13', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring14', '123', '정예울5', '파프리카14', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');
INSERT INTO rs_user(id, password, name, nickname, tel, address)
VALUES('spring15', '123', '정예울5', '파프리카15', '510-3595-9818', '경기도 부천시 5조마루로372번길 60-1 (2층)');

INSERT INTO authorities VALUES('spring1', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring2', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring3', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring4', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring5', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring6', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring7', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring8', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring9', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring10', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring11', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring12', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring13', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring14', 'ROLE_MEMBER');
INSERT INTO authorities VALUES('spring15', 'ROLE_MEMBER');


INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring1', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring2', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring3', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring4', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring5', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring6', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring7', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring8', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring9', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring10', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring11', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring12', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring13', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring14', review_seq.nextval, '맛있어요', sysdate);
INSERT INTO review(cafe_no, id, review_no, review_content, review_regdate)
VALUES (71, 'spring15', review_seq.nextval, '맛있어요', sysdate);

