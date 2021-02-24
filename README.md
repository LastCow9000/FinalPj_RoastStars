🍳 더 자세한 내용은 ↑ pdf 파일 참조.





# ☕RoastStars

- 판교에서 교육을 받으며 이용한 수 많은 카페들로 시작한 아이디어.

- 판교에 있는 수 많은 카페들 중에서 어디가 맛있고, 어디가 분위기가 좋으며, 어디가 가격이 쌀까?
- **자신의 생활반경**에 있는 **입맛**에 맞는 `카페`를 찾아볼 수 있도록 해보자!





### 📆개발기간

---

약 1개월 (20.11.15 ~ 20.12.22)

<details>
<summary>개발 일정(접기/펼치기)</summary>
<div markdown="1">

- 초기 개발 일정 계획
![초기 개발 일정 계획](https://user-images.githubusercontent.com/68089565/108833785-aa152980-7610-11eb-9b8f-607865fdd9a3.png)

- 최종 개발 일정
![최종 개발 일정](https://user-images.githubusercontent.com/68089565/108833790-abdeed00-7610-11eb-8b4f-4150839d3b0d.png)

</div>
</details>





### 📚기술스택

----

- `java` v1.8 
-  `oracle db`, `mybatis`
-  `apache tomcat` v8.5
- `Spring mvc` v3, `Spring Security` v3, `maven`
- `html`, `css`, `bootstrap4`
-  `js(es5)`, `jquery`
- `eclipse`, `junit`
- `trello` , `github`





### 👨‍👩‍👦‍👦구성원 및 구현 기능

---

`고병철` : 메인 개발자

- 회원가입, 회원정보수정, 회원탈퇴, 카페 등록/수정/삭제, 음식 메뉴 추가

`송영섭` : 메인 개발자 겸 PL

- 임시 비밀번호 발급, 지역검색, 선호 리스트순으로 정렬, 지도에서 위치 표시, 카페 간략 정보, 관리자 페이지의 사장 권한 부여, 마이픽 추가/삭제

`신성호` : 메인 개발자 겸 PM

- 전체적인 웹UI 구현, 레이아웃 구현, 관리자 페이지, 빈즈픽 조회/등록/삭제/수정

`정예울` : 메인 개발자

- 로그인 및 로그아웃(Securtiy 적용), 카페 상세정보, 리뷰(선호도 및 한줄평) 조회/작성/수정/삭제



🎃 모든 기능을 각자 자신이 100% 구현하지 않고 **서로 도와가며** 구현했다.





### 📐개발 프로세스 및 설계

---

- 애자일 방식을 채택하여 필요 시 마다 설계, 구현, 테스팅을 반복하였다.
- 크게 1차, 2차 구현으로 나누었다.

<details>
<summary>💷설계 img(접기/펼치기)</summary>
<div markdown="1">

<details>
<summary>💶Usecase Diagram</summary>
<div markdown="1">

- 토의
> ![유즈케이스_1차](https://user-images.githubusercontent.com/68089565/108833872-c1ecad80-7610-11eb-9e11-c23ca772c3c7.jpg)

- 초기 UseCase Diagram
> 비회원
> ![1차_UserCaseDiagram_포폴용_비회원](https://user-images.githubusercontent.com/68089565/108833886-c4e79e00-7610-11eb-86a2-5d128085213d.jpg)

> 고객
> ![1차_UserCaseDiagram_포폴용_고객](https://user-images.githubusercontent.com/68089565/108833882-c3b67100-7610-11eb-9946-9bf60ea5eaee.jpg)

> 사장
> ![1차_UserCaseDiagram_포폴용_사장](https://user-images.githubusercontent.com/68089565/108833867-c1541700-7610-11eb-9dd6-2a993313ee6f.jpg)

> 관리자
> ![1차_UserCaseDiagram_포폴용_관리자](https://user-images.githubusercontent.com/68089565/108833884-c44f0780-7610-11eb-8f76-7ce4a28cfb1a.jpg)

- 최종 UseCase Diagram
> 비회원
> ![최종_UsecaseDiagram_비회원](https://user-images.githubusercontent.com/68089565/108833879-c31dda80-7610-11eb-8d65-79b594548d20.jpg)

> 고객
> ![최종_UsecaseDiagram_고객](https://user-images.githubusercontent.com/68089565/108833874-c2854400-7610-11eb-83b1-ef94ab095696.jpg)

> 사장
> ![최종_UsecaseDiagram_사장](https://user-images.githubusercontent.com/68089565/108833880-c3b67100-7610-11eb-9853-639f2a78ab0c.jpg)

> 관리자
> ![최종_UsecaseDiagram_관리자](https://user-images.githubusercontent.com/68089565/108833877-c31dda80-7610-11eb-88d1-031e9f3eec78.jpg)

</div>
</details>

<details>
<summary>💶ERD</summary>
<div markdown="1">

- 토의
> ![ERD_1차](https://user-images.githubusercontent.com/68089565/108834278-5820d380-7611-11eb-9b61-b8b6f0aa516d.jpg)

- 초기 논리 ERD
> ![1차_논리ERD](https://user-images.githubusercontent.com/68089565/108834290-5b1bc400-7611-11eb-809c-55583ea759af.jpeg)

- 초기 물리 ERD
> ![1차_물리ERD](https://user-images.githubusercontent.com/68089565/108834291-5bb45a80-7611-11eb-97d6-509a8f7646bf.jpeg)

- 최종 논리 ERD
> ![최종_논리ERD](https://user-images.githubusercontent.com/68089565/108834285-5a832d80-7611-11eb-9296-2d356dda3e40.jpeg)

- 최종 물리
> ![최종_물리ERD](https://user-images.githubusercontent.com/68089565/108834286-5a832d80-7611-11eb-9c57-b07142fde5cf.jpeg)

</div>
</details>

<details>
<summary>💶Class Diagram</summary>
<div markdown="1">

- 토의
> ![CD1](https://user-images.githubusercontent.com/68089565/108834449-8a323580-7611-11eb-9e12-31cec132157f.jpg)
> ![CD2](https://user-images.githubusercontent.com/68089565/108834454-8bfbf900-7611-11eb-9d01-5df6434f6c0a.jpg)

- 초기 Class Diagram
> ![1차 ClassDiagram](https://user-images.githubusercontent.com/68089565/108834509-9d450580-7611-11eb-85fc-a73695455f32.jpg)

- 최종 Class Diagram
> ![ClassDiagram](https://user-images.githubusercontent.com/68089565/108834515-9e763280-7611-11eb-9f6c-14f25e5e991e.jpg)

</div>
</details>

<details>
<summary>💶File List</summary>
<div markdown="1">

- 토의
> ![FileList](https://user-images.githubusercontent.com/68089565/108834545-a8983100-7611-11eb-8422-ea52c4a0dbef.jpg)

- 최종 File List
> ![최종 파일리스트1](https://user-images.githubusercontent.com/68089565/108834548-a9c95e00-7611-11eb-99a2-67753242793f.png)
> ![최종 파일리스트2](https://user-images.githubusercontent.com/68089565/108834551-aa61f480-7611-11eb-9aa0-6cf344f054e3.png)

</div>
</details>

<details>
<summary>💶레이아웃 및 UI 설계</summary>
<div markdown="1">

- UI 설계
> ![UI 설계](https://user-images.githubusercontent.com/68089565/108837430-96b88d00-7615-11eb-90a7-62a331517d78.jpeg)

- 초기 레이아웃
> ![초기화면1](https://user-images.githubusercontent.com/68089565/108838244-b9977100-7616-11eb-8777-9c4eddd44e69.png)
> ![초기화면2](https://user-images.githubusercontent.com/68089565/108838331-d6cc3f80-7616-11eb-896f-4e80f9940e82.png)
> ![초기화면3](https://user-images.githubusercontent.com/68089565/108838397-ee0b2d00-7616-11eb-8d3f-8aaeb840ccb5.png)
> ![초기화면4](https://user-images.githubusercontent.com/68089565/108838435-f8c5c200-7616-11eb-8f40-710fa09620a2.png)

- 최종 화면
> ![최종1](https://user-images.githubusercontent.com/68089565/108838493-0bd89200-7617-11eb-8320-04ebfa60c442.png)
> ![최종2](https://user-images.githubusercontent.com/68089565/108838588-30cd0500-7617-11eb-9040-399325088a0d.png)
> ![최종3](https://user-images.githubusercontent.com/68089565/108838629-417d7b00-7617-11eb-96bc-664ea6a88997.png)
> ![최종4](https://user-images.githubusercontent.com/68089565/108838669-4cd0a680-7617-11eb-9046-54b19682201d.png)

</div>
</details>


</div>
</details>





### 📊프로젝트 내용 및 주요 기능

---

<details>
<summary> 회원가입</summary>
<div markdown="1">

- 회원가입
> ![1 회원가입](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/1.%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.gif?raw=true)

- 사장/ 일반유저를 선택해서 가입해야 한다.(관리자에 의해 승인을 받아야 한다)
> ![2  사장회원가입](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/2.%20%EC%82%AC%EC%9E%A5%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.gif?raw=true)

</div>
</details>

<details>
<summary>임시 비밀번호 발급 및 비밀번호 변경</summary>
<div markdown="1">

- 임시 비밀번호 발급(아이디와 이름이 **일치**할 시 발급 가능하다) - 난수발생과 아스키코드를 이용
> ![3  임시 비번 발급](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/3.%20%EC%9E%84%EC%8B%9C%20%EB%B9%84%EB%B2%88%20%EB%B0%9C%EA%B8%89.gif?raw=true)

- 비밀번호 변경
> ![3.5 비번변경](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/3.5%20%EB%B9%84%EB%B2%88%EB%B3%80%EA%B2%BD.gif?raw=true)

</div>
</details>

<details>
<summary>지역 검색 및 선호도에 따른 정렬, 카페 간략정보 </summary>
<div markdown="1">

- 지역 검색 후 선호 항목(1, 2, 3순위)으로 지역 검색된 리스트가 **정렬**된다.(Ajax)
- 지도는 `카카오맵api`를 이용하였다.
> ![4 지역검색 및 카페 간략정보, 선호도 정렬, 지도](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/4.%20%EC%A7%80%EC%97%AD%EA%B2%80%EC%83%89%20%EB%B0%8F%20%EC%B9%B4%ED%8E%98%20%EA%B0%84%EB%9E%B5%EC%A0%95%EB%B3%B4,%20%EC%84%A0%ED%98%B8%EB%8F%84%20%EC%A0%95%EB%A0%AC,%20%EC%A7%80%EB%8F%84.gif?raw=true)

</div>
</details>

<details>
<summary>카페 상세정보 및 메뉴 확인</summary>
<div markdown="1">

- 카페 간략정보, 마이픽 등의 경로를 통해 선택된 카페에 대한 상세정보와 메뉴를 볼 수 있다.
> ![5 카페 상세보기, 메뉴보기](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/5.%20%EC%B9%B4%ED%8E%98%20%EC%83%81%EC%84%B8%EB%B3%B4%EA%B8%B0,%20%EB%A9%94%EB%89%B4%EB%B3%B4%EA%B8%B0.gif?raw=true)

</div>
</details>

<details>
<summary>리뷰 작성 및 삭제</summary>
<div markdown="1">

- 리뷰 작성 시, 특성값에 포인트로 평가하여, 카페 특성에 점수가 추가된다.(이 점수로 **선호도 정렬**)
- 본인이 작성한 리뷰만 삭제할 수 있다. 삭제하면 추가되었던 카페의 특성값이 다시 사라진다.
> ![6 리뷰작성 및 삭제](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/6.%20%EB%A6%AC%EB%B7%B0%EC%9E%91%EC%84%B1%20%EB%B0%8F%20%EC%82%AD%EC%A0%9C.gif?raw=true)


</div>
</details>

<details>
<summary>관리자 페이지(권한 부여)</summary>
<div markdown="1">

- 관리자 전용 기능으로서 사장으로 회원 가입한 고객들의 정보를 확인하고 사장(매니저)**권한을 부여**할 수 있다.
> ![7 사장권한부여](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/7.%20%EC%82%AC%EC%9E%A5%EA%B6%8C%ED%95%9C%EB%B6%80%EC%97%AC.gif?raw=true)

</div>
</details>

<details>
<summary>마이픽(즐겨찾기)</summary>
<div markdown="1">

- 카페 간략정보 or  상세정보에서 추가할 수 있다. **Ajax**로 구현하여  ☆을 클릭 시 실시간으로 추가, 제거된다.
> ![8 마이픽](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/8.%20%EB%A7%88%EC%9D%B4%ED%94%BD.gif?raw=true)

</div>
</details>

<details>
<summary>빈즈픽(Editor's Pick)</summary>
<div markdown="1">

- 많은 카페들 중에서 홍보나 이벤트를 위해 에디터(관리자)가 직접 고른 카페의 정보를 전달하는 게시판
- 모든 유저(비회원 포함)가 볼 수 있으나, 수정/삭제는 **관리자만** 가능하다.
> ![9 빈즈픽](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/9.%20%EB%B9%88%EC%A6%88%ED%94%BD.gif?raw=true)

</div>
</details>

<details>
<summary>카페 등록</summary>
<div markdown="1">

- 카페명은 10자 이내, 카페 설명은 200자 이내, 운영시간은 문자입력이 불가하고 36:70같이 시간은 24시 를 넘길 수 없으며 분은 60분을 넘을 수 없게 조건을 걸었다.
- 공휴일에도 운영을 하는 회원은 ‘운영함’에 체크를 하면 공휴일 등록폼이 **동적**으로 생성된다.
- 카페기본정보와 운영시간은 다른 테이블이므로 **트랜잭션**처리를 하였다.

> ![10 카페 등록](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/10.%20%EC%B9%B4%ED%8E%98%20%EB%93%B1%EB%A1%9D.gif?raw=true)

</div>
</details>

<details>
<summary>메뉴 추가 및 확인</summary>
<div markdown="1">

- 가격은 최소 **100원 단위**로 설정했다.
> ![11 메뉴 추가 및 확인](https://github.com/LastCow9000/FinalPj_RoastStars/blob/main/img%20for%20readme/11%EB%A9%94%EB%89%B4%20%EC%B6%94%EA%B0%80%20%EB%B0%8F%20%ED%99%95%EC%9D%B8.gif?raw=true)

</div>
</details>


### 🛠트러블 슈팅

---

<details>
<summary>표 펼치기/접기</summary>
<div markdown="1">

| 이슈 내용                                                    | 해결 방안                                                    |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| 테이블 생성 도중, user라는 이름의 테이블을 생성할 수 없음을 발견했다. (에러명 : ORA-00903: invalid table name) | Oracle SQL 키워드명이어서 테이블명으로 사용할 수 없다. \|\| 이슈해결 방법: 테이블 명을 user -> rs_user로 변경했다. |
| MyBatis(mapper)에서 CafeVO와 UserVO를 JOIN하여 출력하는 과정에서, UserVO의 인스턴스 변수 중 'isEnabled' 내용이 제대로 반환되지 않음 | mapper.xml에서 <resultMap>내 <property>의 column명을 SQL 컬럼명이 아닌, VO의 인스턴스명으로 주었다. \|\| 이슈해결 방법: <result property>에서 column을 SQL 컬럼명으로 수정했다. 하지만 근본적으로 인스턴스 변수 명에 is로 시작하는 것은 좋지 않다는 것을 판단했다. 그래서 UserVO의 inEnabled 컬럼을 enabled로, rs_user 테이블의 is_enabled 컬럼을 enabled로 변경하였다. |
| 카페 정보 상세보기 페이지 구현 중, main.jsp에서 cafeDetail.jsp로 바로 이동하도록 링크("cafe-detail.do?cafeNo=9")를 걸어 경로설정을 해주었다. 그러나 링크를 클릭하면 "login-form.do" 명령어가 수행되어, loginForm.jsp로 이동하였다. | CafeController에서 cafe-detail.do 요청 시, 처리하는 메서드인 viewCafeDetail에 @Sercured("ROLE_MEMBER") 조건을 걸어주었기 때문이다. 이 조건으로 인해, 로그인이 되지 않은 상태로 cafe-detail.do 사용 시, 로그인 폼으로 자동으로 이동하였다. \|\| 해결 방법 : 누구나 접근 가능하도록 @Secure조건을 빼줬다. |
| 로그인 시도 중, 패스워드 불일치 에러가 발생했다.             | 회원가입 시, 회원가입 form에서 <input>비밀번호 와 비밀번호 확인 단계에서 name을 같은 값인 " password"로 주었다. 그 결과 비밀번호에 입력되는 값이 비밀번호와 비밀번호확인에 입력된 value값이 이중으로 들어가게 되었고 문제가 발생했다. \|\| 해결방법 : 회원가입 폼에서 패스워드 확인에 할당되어있는 name="password"를 제거하여, password에 한번만 값이 할당되도록 해주었다. |
| 페이지 이동 중 sql - invalid number 문제가 발생함. 그러나 sql 문제가 아니였음. jstl 틀린 것을 <!-- --> 주석으로 처리하여 발생함 | <%-- --%>이걸로 주석 처리해야함                              |
| 리뷰 리스트를 불러오기 위해, review 테이블과 cafe 테이블을 조인한 후, rnum를 부여하고, 이를 인라인 뷰로 이용해 다시 rs_user 테이블과 조인하는 과정에서 "ORA-00918: column ambiguously defined" 에러가 지속적으로 발생하였다. | 서브쿼리(인라인뷰)의 SELECT 문에서 review 테이블의 review_content 컬럼을 두 번 호출했기 때문이었다. 때문에 전체 쿼리문 실행 시, 인라인 뷰에 있는 두 개의 review_content 컬럼 중 어느 컬럼을 선택해야 할지 몰라 에러가 발생하였다 \|\| 이슈해결 방법: 서브쿼리(인라인뷰)의 SELECT문에서 review_content를 한 번만 기재하여 문제를 해결했다. |
| Error setting null for parameter #1 with JdbcType OTHER.이라는 오류메세지가 떴다. 카페등록은 되었지만 운영시간을 포함한 카페등록이 안됨 ->insert시 첫번째 컬럼에 null이 삽입되었다는 뜻 | registerCafe메소드에서 cafeNo를 registerCafeOperatingTimeForm메소드로 보내주었다. 그 다음 registerCafeOperatingTime메소드로 cafeNo를 보내주어야 하는데 받기만하고 registerCafeOperatingTimeForm.jsp에서 보내주는 코드를 작성하지 않았다. 솔직히 controller에서 자동으로 보내주기도 하는 줄 알았다. |
| Git Pull받고 Merge하는 과정에서 코드를 잘못 수정             | Merge하는 과정에서 잘못수정하여서 commit전으로 Rollback하려 했다. Reset -> Hard 기능으로 롤백을 하였다. 전날했던 코드가 다 삭제되어 다시 진행하였다. |
| SQL에서 Update로 멤버에서 매니저로 변경하려 했지만, 권한의 특성상 Insert를 사용해야 됨 사용 후에 권한을 올려주었던 아이디가 다시 검색이 됨 | 권한은 삭제가 아닌 추가임                       select count(*) from AUTHORITIES where username='sajang'//사용하여 카운트로 구별 |
| 리뷰 등록할 때, property table에 해당 cafe_no의 값이 update되어 영향을 주었다. 반대로 리뷰를 삭제할 때, property table에 영향을 주었던 값을 되돌려놔야한다. | 리뷰 작성 시, 입력된 각 특성에 대한 평가값에 대한 정보가 DB에 저장되어있지 않아서 삭제 시 그 전 특성 업데이트 값을 찾을 수 없다. \|\| 해결방법: 리뷰 작성 시, 리뷰 넘버에 맞는 특성값이 저장되는 테이블을 별도로 만들었다. 이를 통해 리뷰 작성할때 테이블에 입력되고, 삭제할 때 이 값을 찾아 카페에서 다시 update해서 삭제할 수 있었다. |
| header영역에 드롭다운으로 @Secured("ROLE_MANANGER")일 때, '카페 관리'를 이동하도록 했다. 그런데 드롭다운 클릭 후, 한번 이동하게 되면, 이동한 화면에서 다시 드롭다운 클릭이 먹지 않는다. (다시 홈으로 이동 후 이동해야 드롭다운 버튼이 활성화가 된다.) - 이 떄, F12를 눌러보니 aria-expanded= false 라는 내가 쓰지 않는 코드가 적혀있었다. | where username='sajang'//사용하여 카운트로 구별구글링을 통해 자바스크립트 영역에 jQuery로 선택자를 지정하여(드롭다운 버튼), 드롭다운 버튼 클릭 시 활성화되도록 하는 함수를 추가해주었다. |
| 이미지를 이용하여 등록 시 upload에는 저장이 안되고 저장이 톰켓에 저장이 됨 (만약 다른 컴도 된다면 개인 설정 문제 같음.) | copy되는 부분에서 file.getBytes()대신 uploadFile로 대체함 (파일을 업로드하기 위해, 컨트롤러를 거쳐 서버에 파일이 업로드 되고, 다시 워크스페이스에 이를 카피하는데, 이 과정에서 문제가 생겼다. 그래서 실제 업로드 된 was에 있는 이미지에 있는 이미지를 복제해서 워크스페이스에 붙여놓기로 해결했다.) |

</div>
</details>





### ⚖프로젝트 회고 및 평가

---

1. **Best Practice**

   - `선호 항목 선택 시마다 정렬되는 기능`

   >  1, 2, 3순위 선호항목을 다 체크한 후 일괄적으로 정렬하는 것이 아닌 한 순위의 항목을 체크할 때 마다 정렬하는 기능을 구현했다.
   >
   >  처음에는 1, 2, 3순위 항목을 체크한 후 정렬버튼을 누르면 일괄적으로 정렬되는 기능을 구현했었다. 하지만 실시간으로 한 순위를 선택할 때 마다 정렬이 된다면 사용자 경험측면에서 더욱 좋다고 생각이 들었다. 체크시마다 정렬되는 기능을 구현하며 ajax와  jquery에 더욱 능숙해질 수 있었고 셀렉트-옵션폼에서 값을 선택 시 다음 순위 옵션폼에서 전 순위 옵션폼에서 선택한 값을 제외하는 기능과 동적으로 세 개의 옵션폼을 생성하는 기능을 구현하며 알고리즘을 어떻게 짜야될까 고민해보는 시간을 가질 수 있었다.

   

   - `Ajax 활용`

   > 전체적으로는 무조건 jsp를 만들어서 동기적 방식만 사용하기보다는 Ajax를 적재적소에 활용하여 더 나은 웹을 만들 수 있었다. 또한 여러 비즈니스 로직들을 트랜잭션 처리하여 데이터 무결성을 강화하고 오류를 줄일 수 있었다.

   

   - `비밀번호 암호화 (인코딩)`

   >회원가입을 할 때, 비밀번호를 bcrypt알고리즘으로 암호화하여 DB에 저장하도록 구현하였다. 입력한 비밀번호를 UserServiceImpl에서 받아올 때 BCryptPasswordEncoder를 사용하여 암호화된 비밀번호를 저장하게 하였다.
   >
   >메뉴등록을 할 때, 기존에 있는 메뉴리스트를 불러와 보여주는데 비 동기방식을 사용하여 메뉴를 추가하면 바로 리스트에 보이게끔 구현하였다.
   >
   > 마지막으로 트랜잭션을 적용하였다. 카페등록 및 수정을 할 때, cafeVO와 cafeOperVO가 동시에 등록되는데 트랜잭션 처리를 하여 둘 중 하나라도 잘못 등록되면 에러가 나서 등록이 안되게 구현하였다. 그리고 회원가입 시에 어떤 회원이든 처음에는 ROLE_MEMBER권한을 주었는데 회원가입과 권한 부여 기능 둘 중에 하나라도 에러가 나면 작동되지 않게 해주었다.

   

   - `리뷰 등록 및 삭제 기능`

   > 리뷰 등록 시 매긴 카페의 평가를 리뷰 삭제 시 다시 rollback하는 기능을 구현했다.
   >
   >  처음 ERD를 생성할 때는 생각하지 못한 아이디어였다. 구현을 하다보니, 리뷰 등록 시에 매겨진 카페에 대한 평가값이 리뷰를 삭제하면 rollback되어야 한다는 생각이 들었다. 하지만 리뷰 등록 시, 리뷰 넘버와 리뷰 컨텐츠는 리뷰 테이블에, 평가 점수는 평가 테이블에 별도로 저장되어, 리뷰 삭제 시, 해당 리뷰 넘버에 대한 평가값을 알 수 없다는 문제점을 발견했다. 이를 해결하기 위해, 리뷰 등록 시, 리뷰 넘버에 해당하는 카페에 대한 평가 점수를 저장하는 테이블을 생성했다. 이를 통해, 리뷰 삭제 시, 리뷰 넘버에 맞는 평가 점수를 테이블에서 검색하여, 특성 테이블에서 해당 카페 넘버에 맞는 값을 다시 rollback할 수 있었다.

   

   - `페이징 기능`

   > Paging bean을 여러 기능에 맞게 적용할 수 있게 끔하여 응집도를 향상했다.
   >
   >  영속성 계층인 Paging bean에서 한 페이지 당 나오는 콘텐츠 수, 페이지 그룹에 속하는 페이지 수를 instance variable 초기화 단계에서 별도로 설정하지 않고, 추후 비즈니스 계층 및 프레젠테이션 계층 단계에서 setter를 통해 설정하도록 하였다. 이를 통해, 제일 먼저 페이징 빈을 적용한 코드를 이용하여, 각 기능에 알맞고, 쉽게 적용할 수 있었다. 

   

   - `게시판 기능`

   > - 이미지와 게시판의 글을 동시에 제어를 할 수 있게 하였다. 이미지의 파일 형식에 관련하여 ERD를 테스트 할 때마다 바꾸었으며 Path로 제어를 할 수 있었다. 
   >
   > - 팀원들이 구현한 요소를 가지고 게시판 용으로 코드를 수정 편집하여 권한이나 코드의 충돌을 최소화 하여 적용하였다.

   

2. **LESSONS LEARNED**

   > - 코드를 작성할 당시, 구현에만 집중한 나머지 redirect방식으로 view를 보내야하는데 forward 방식으로 보낸 메서드가 있었다. 기능이 작동하는 것도 중요하지만, 안정성 및 보안성 또한 중요하다고 생각한다. 이러한 문제가 앞으로 발생하지 않기 위해서는, 꼼꼼히 코드를 작성하며 코드 작성 후 재검토 시간 및 팀원 간의 코드 리뷰가 도움이 될 것이라 생각한다.

   > - ERD를 나름 잘 작성하였다고 생각하였지만 구현을 진행하며 설계상의 오류를 적지 않게 발견하였고 이를 수정하는데 많은 시간을 소모하였다. 

   > - 구현 계획을 짰을 때 1차 구현에 너무 많은 기능을 넣어두어서 데드라인이 다가옴에 따라 힘들었다. 구현 시간을 최대한 정확하게 예측, 산출하는 연습을 많이 하여 데드라인을 잘 지킬 수 있도록 노력해야겠다.

   > - 코드를 작성하면서 기능을 구현해내는 것에 급급해 주석을 꼼꼼히 작성하지 못하였다. 그 결과, 팀원들이 내 코드를 이해하는데 있어서 어려움이 있었고 마찰로 이어질 뻔했다. 주석은 코드에 직접적인 영향을 끼치지 않아 사소하게 여기는 습관이 있었는데 추후 코드를 수정하거나 나중에 다시 공부 할 일이 생겼을 때 꼭 필요하고 다른 사람에게 내 코드를 이해시킬 때 꼭 필요하다. 시간이 걸리더라도 코드를 재검토하면서 주석도 작성을 한다면 앞으로 코딩실력에 큰 도움이 될 것이다.

   > - 리뷰 등록/삭제 시, rollback 처리를 위해 평가 테이블을 만들었으나, 정규화가 되지 않은 테이블을 생성했다. 리뷰 테이블과 특성 테이블 사이에 평가 테이블이 이어져야 하는데, 리뷰 테이블의 Primary key가 아닌 일반 컬럼을 평가 테이블의 Foreign key이자 Primary key로 설정했다. 원인은 리뷰 테이블에서 일반 속성이 다른 속성들을 완전 종속하는 오류였다. 이를 해결하기 위해서는 기존 primary key(카페넘버, 유저아이디)에 리뷰 넘버를 추가해야 한다. 앞으로 이런 문제가 발생하지 않기 위해서는 table 생성 시, ERD 설계부터 진행해보는 것이 오류를 줄일 수 있는 방법인 것을 배울 수 있었다.

   > - 코드 작성시 ERD구조가 잘 정리가 된 곳은 구현하기 쉬웠지만 애매한 테이블에서는 기능 구현이 힘들었으며 또한 ERD의 데이터 타입에 따른 오류를 경험하였다. 추후에는 ERD의 관계도 중요하지만 데이터 타입에도 어느정도 구현을 고려하여 진행해야 되는 것을 알게 되었다.






### 🎞번외 : 기록들

----

- 작업의 기억이 남아있는 곳 : [Trello](https://trello.com/b/fMGKsYuT/roast-stars-project)





