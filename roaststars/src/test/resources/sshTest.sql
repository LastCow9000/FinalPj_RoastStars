---테스트
--등록

		insert into beans_pick(beans_no, beans_title, beans_content, beans_pic, beans_regdate,id)
		values (beans_pick_seq.nextval,'eansTitle','ansContent','null', sysdate, 'admin'));


insert into BEANS_PICK(beans_no,beans_title,beans_content,beans_regdate)
values (beans_pick_seq.nextval, #{beans_title},#{beans_content},sysdate);

insert into beans_pick(beans_no, beans_title, beans_content, beans_pic, beans_regdate, id)
		values (beans_pick_seq.nextval,'eansTitle','ansContent',default, sysdate, 'admin');

insert into BEANS_PICK(beans_no, beans_title,beans_content,beans_regdate,id, beans_pic)
values (beans_pick_seq.nextval,'title','content',sysdate,'admin','null');

INSERT INTO rs_user(id, password, name, nickname, tel, address,business_name,business_pic,business_no)
		VALUES(#{id},#{password},#{name},#{nickname},#{tel},#{address},
		#{businessName, jdbcType=VARCHAR},#{businessPic, jdbcType=VARCHAR},#{businessNo, jdbcType=VARCHAR})



--삭제
delete from BEANS_PICK where beans_no=47;
delete from BEANS_PICK where beans_no=#{beansNo}
--수정
update BEANS_PICK 
set beans_title=#{beans_title}, beans_content=#{beans_content}, beans_pic=#{beansPic, jdbcType=VARCHAR}, beans_regdate=sysdate, id=#{userVO.id}
where beans_no=#{beans_no}

update BEANS_PICK 
set beans_title='Test_TItle', beans_content='Test_TItle', beans_pic='Test_TItle', beans_regdate=sysdate, id='admin'
where beans_no=62;




update BEANS_PICK 
set beans_title='수우121223123정', beans_content='수우a우정'
where beans_no=48;

insert into tablename(col1,col2) values(val1,val2)

commit

SELECT * FROM BEANS_PICK



select beans_no, beans_title, beans_pic
from BEANS_PICK
where rnum between 1 and 2
order by beans_no desc



SELECT b.no,b.title,b.time_posted,b.hits,b.id,m.name
FROM(SELECT row_number() over(order by no desc) as rnum,no,title,hits,
	 to_char(time_posted,'YYYY.MM.DD') as time_posted,id
	 FROM spring_board_inst) b,spring_member m 
where b.id=m.id and rnum between 1 and 5 
order by no desc;

SELECT beans_no, beans_title, beans_content, beans_pic, beans_regdate,id
FROM (SELECT ROWNUM RNUM, beans_no, beans_title, beans_content, beans_pic, beans_regdate,id
FROM (SELECT beans_no, beans_title, beans_content, beans_pic, beans_regdate,id FROM BEANS_PICK ORDER BY beans_no DESC) BEANS_PICK) 
WHERE RNUM BETWEEN 1 AND 4;

SELECT *  FROM (SELECT ROWNUM RNUM, BEANS_PICK.*  
FROM (SELECT * FROM BEANS_PICK ORDER BY beans_no DESC) BEANS_PICK) 
WHERE RNUM BETWEEN #{startRowNumber} and #{endRowNumber};

SELECT beans_no, beans_title, beans_content, beans_pic, beans_regdate,id
FROM (SELECT ROWNUM RNUM, beans_no, beans_title, beans_content, beans_pic, beans_regdate,id
FROM (SELECT beans_no, beans_title, beans_content, beans_pic, beans_regdate,id FROM BEANS_PICK ORDER BY beans_no DESC) BEANS_PICK) 
WHERE RNUM BETWEEN #{startRowNumber} and #{endRowNumber};

select BEANS_PICK



