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



### 구성원 및 구현 기능

---

`고병철` : 메인 개발자

- 회원가입, 회원정보수정, 회원탈퇴, 카페 등록/수정/삭제, 음식 메뉴 추가

`송영섭` : 메인 개발자 겸 PL

- 임시 비밀번호 발급, 지역검색, 선호 리스트순으로 정렬, 지도에서 위치 표시, 카페 간략 정보, 관리자 페이지의 사장 권한 부여, 마이픽 추가/삭제

`신성호` : 메인 개발자 겸 PM

- 전체적인 웹UI 구현, 레이아웃 구현, 관리자 페이지, 빈즈픽 조회/등록/삭제/수정

`정예울` : 메인 개발자

- 로그인 및 로그아웃(Securtiy 적용), 카페 상세정보, 리뷰(선호도 및 한줄평) 조회/작성/수정/삭제



🎇 모든 기능을 각자 자신이 100% 구현하지 않고 **서로 도와가며** 구현했다.



### 개발 프로세스 및 설계

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

</div>
</details>



### 프로젝트내용

---



### 번외 : 기록들

----

[Trello](https://trello.com/b/fMGKsYuT/roast-stars-project)





