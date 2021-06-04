Little4 Restaurant
=============
Restaurant Booking System of TEAM4

[홈페이지에서 확인하기](https://gabrielyoon7.github.io/2021_SE_Team4)

(웹 서버가 종료되어 있는 경우에는 연결되지 않습니다.)
>경기대학교 AI컴퓨터공학부
> >권기현 교수님 2021-1 소프트웨어공학 4조
* * *
## Team4 Developers
- 송성호(201713866)
  >github@ssh10032
- 윤주현(201713919)
  >github@gabrielyoon7
- 김우중(201912039)
  > github@Kimwoojung11
- 최예슬(201912149)
  > github@yeseul9231
- 허수빈(201912161)
  > github@heo5620
* * *
## History
- 2021.06.05
  - [송성호] 예약 완료 삭제 기능 수정
  - [윤주현] customerManager에서 도착 기록을 확인할 수 없는 문제 해결
- 2021.06.04
  - [김우중] 포인트 기능 추가
  - [윤주현] 주간별 통계 확인 기능 추가, 중복 회원가입 제한, 관련 버그 수정
- 2021.06.03
  - [허수빈] 디자인 개선, 가이드라인 추가
  - [송성호] Table DAO, DTO 추가 Table 삭제, 추가 함수 구현
  - [윤주현] 도착 기능 추가, 체온 입력 추가, 테이블 관련 기능 연결 및 코로나19 문진표 조회 추가 (매장관리)
- 2021.06.02
  - [김우중] 대기리스트 Modal로 변환, 워크인, 예약 수정 및 삭제 기능 추가
  - [송성호] CovidLogDTO, DAO 추가 Modal 창 체온 입력란 추가
  - [윤주현] 통계에 DB 연동 (일별 매출), 테이블 오류 개선, 서버 연동 시 발생하는 날짜 오류 해결
- 2021.06.01
  - [김우중] 대기리스트 테이블 추가 및 테이블 기능 구현
  - [최예슬] 메뉴바 수정, 통계 페이지 초안 작성
  - [허수빈] 디자인 개선, 통계 페이지 레이아웃 제작
  - [윤주현] 스케쥴 테이블의 내용물 클릭 시 반응하는 modal로 변경
- 2021.05.31
  - [김우중] 대기리스트 DB 추가 기능
- 2021.05.30
  - [윤주현] userReservationInfo에 각종 정보 연결
- 2021.05.29
  - [허수빈] 디자인 개선 및 userReservationInfo 레이아웃 개선
  - [윤주현] userManager 페이지에 DB 연결 및 reservationRequest 버그 전면 수정
- 2021.05.28
  - [최예슬] 음료 DB 추가, 주문 시 페이지 분류 개선
  - [허수빈] 손님용 헤더 수정, 예약 조회 페이지 레이아웃 추가
  - [김우중] WalkIn 데이터 출력 및 WalkIn, Reservation 중복 방지 기능 추가
  - [윤주현] 부트스트랩 테이블 버그 전면 수정, Reservation 테이블 자동 배정 기능 추가
- 2021.05.27
  - [허수빈] 경고문 알림 개선
  - [김우중] CustomerManager 페이지 Table 출력
  - [윤주현] 메뉴 View 버튼 활성화 (메뉴 정보 단독페이지 출력 가능토록 구현), 메뉴 타입별 출력 기능 추가, 날짜별 스케쥴 출력 기능 추가
- 2021.05.26
  - [송성호] ReservationDAO addReservation 메소드 date 전달 수정
  - [윤주현] bootstrapTable 버그수정 및 기능 활성화
- 2021.05.25
  - [허수빈] 각종 디자인 전면 개편
  - [김우중] customerManager페이지 walkIn버튼 구현
- 2021.05.23
  - [최예슬] WalkIn 페이지에 modal 연결, Packing 페이지에 이미지 연동
  - [윤주현] Modal 버그 수정 및 레이아웃 , reservation request관련 기능 비로그인자 접속 제한
- 2021.05.22
  - [김우중] customerManager에 요청 리스트 받는 레이아웃 완성 및 연결 성공
  - [윤주현] customerManager에 스케쥴 표가 자동으로 그려지도록 레이아웃 개선, ReservationRequest관련 오류 수정
  - [송성호]jsp에서 Ajaxaction으로 예약 요청 데이터 보내는 function(completeReservationRequest) 구현, AjaxAction에서 case문 reservationRequest case 추가
- 2021.05.21
  - [윤주현] Reservation에 정보 넘기기 및 로그인 정보 띄우는 기능 추가
  - [송성호] ReservationRequest DB 테이블 수정(table_id, arrivalTime 삭제, message 추가, reservationinfo 레이아웃 수정
  - [최예슬] reservationinfo 수정
- 2021.05.20
  - [전 체] 프로젝트 명을 Little4 Restaurant로 변경
  - [송성호] ReservationDTO 추가, ReservationDAO 고객 예약 데이터 DB로 보내주는 메소드(addReservationRequest) 추가, DB 고객 예약 요청(ReservationRequest) TABLE 추가
- 2021.05.19
  - [김우중] Table관리 페이지 제작
- 2021.05.16
  - [허수빈] 메뉴 DB 및 이미지 전면 개편
  - [윤주현] 예약페이지 일자 넘기는 기능 추가, 클릭 기능 일부 구현 (개선 필요)
  - [김우중] 결제완료 페이지 및 픽업 관리 페이지 제작 (DB연동 포함)
- 2021.05.15
  - [최예슬] 일정 조회 페이지 레이아웃 추가
  - [윤주현] 메뉴화면에 이미지 연동
- 2021.05.14
  - [김우중] 결제 완료 페이지 제작
  - [허수빈] Packing에서 Basket 페이지로 넘어가는 footer 제작, 주문/결제페이지 제작, 하단 고정바, 상단 글 수정
  - [최예슬] Reservation 페이지 레이아웃 및 예약완료 화면 추가
  - [윤주현] Packing에서 장바구니 기능 추가(DB넘겨서 결제 화면에서 합계 출력까지 구현), 장바구니에서 결제완료 화면까지 DB를 넘기는 과정 제작, 오류 방지를 위한 error 페이지 및 로직 추가
- 2021.05.13
  - [송성호] Reservation 페이지 연동
  - [김우중] Packing, Basket 페이지 연동
- 2021.05.12
  - [최예슬] Brand 페이지 제작
  - [전 체] Menu 페이지 제작 및 DB 연동 / 일부 DB구조 개선 / 블랙리스트 관리 기능 추가
- 2021.05.11
  - [윤주현] 서버용 PC에 ubuntu20.04 LTS, Tomcat9.0, mariaDB, openJDK14로 환경 구축 후, 서버 업로드 완료. (발표 및 평가 기간에 사용 예정)
- 2021.05.10
  - [윤주현] 회원가입 기능 추가 / 관리자 페이지 및 기능 추가
- 2021.05.08
  - [최예슬] 헤더 디자인 개선/ 푸터 추가/ 이미지 슬라이더 추가
  - [윤주현] 로그아웃 기능 추가/ 부트스트랩 도입
- 2021.05.07
  - [윤주현] 로그인 기능 추가/ User 테이블 추가, 임시 헤더 작성
- 2021.05.06
  - [송성호] 회의결과에 따른 DB 구조 업데이트
- 2021.05.05
  - [전 체] Spring 에서 JSP로 변경
  - [윤주현] Java ee와 Tomcat으로 JSP 프로젝트 구축 및 기본 구조 입력, README 초안 작성
* * *
## Rules of Project development
- Github 사용 시 Pull 먼저 하기
- 주석과 Commit 메시지 꼼꼼히 적기
- 변수명은 최대한 자세하게 적기
- 변수를 최대한 글자처리 하기
- 모르거나 막히면 토의 하기
- 맡은 분야 외에도 관심 갖고 동참 하기
- 일단 수정해보기 (잘 안되면 Rollback 기능으로 되돌리면 됨)
- ~~또 뭐가 있을까요?~~
* * *
## Project Structure
> 프로젝트 구조 해석 영상
> > https://drive.google.com/file/d/1lWJpXaAh7shmv10t9AoQUbhHaI2ocUy0/view?usp=sharing
* .idea
  > IntelliJ 관련 설정
  > >컴퓨터마다 환경이 달라서 자동으로 수정되는 경우가 많습니다. 되도록이면 github로 push 하지 마세요.
* lib
  > 자바 프로젝트에서 사용 하는 외부 라이브러리(*.jar)를 모아 놓은 폴더입니다. 특정 클래스를 사용하려면 해당 라이브러리가 필요하며, 추가되는 경우 컴파일러에 등록해줘야 합니다.
* out
  >  컴파일 시 생성되는 IntelliJ만의 실행 폴더입니다. 서버를 run 할 때 마다 초기화 됩니다. 다른 컴퓨터에서 오류 발생 가능성이 있습니다. 컴파일을 할 때 모든 파일을 out폴더로 보내버려서 이 폴더로 작동하게 됩니다.
  > > **절대로 Github에 전송하지 마세요.** 오류 발생 가능성이 있습니다.
* ### src
  >  Web Server를 담당합니다. Java로 작성합니다.
  * com.se.team4
    * application
      > 이 패키지는 교수님께서 주신 booksys 프로그램을 최대한 비슷한 구조로 적용이 가능하게 고안했습니다.
      * domain
        > Controller 부분 입니다. 일반적으로 JSP로부터 Controller를 요청받고, 여기에서 DAO를 호출합니다.
        > > Controller를 요청하는 부분은 WEB-INF에서 다시 언급됩니다.
        ```java
        //domain 코드 예시
        public class TestAction implements Action {
            @Override
            public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
                Gson gson = new Gson();
                request.setAttribute("getSomething", gson.toJson(TestDAO.getInstance().getSomething(1)));
                return "RequestDispatcher:test.jsp";
            }
        }
        ```
        
        * main
          > 메인 홈페이지에 관련된 Controller 입니다.
      * persistency
        > Model 부분 입니다. MariaDB와 통신하기 위한 클래스들이 들어있습니다.
         * DAO
           > 쿼리문을 직접 작성하는 클래스들 입니다.
           > >교수님이 주신 파일처럼 Database 클래스로 쿼리를 보낼 지는 고민해봐야 할 것 같습니다.
           ```java
           //DAO클래스 예시
           public class TestDAO {
               public static TestDAO it;
               public static TestDAO getInstance() { //인스턴스 생성
                   if (it == null)
                        it = new TestDAO();
                   return it;
               }
           //테스트 메소드
           public ArrayList<TestDTO> getSomething(int num) {
               ArrayList<TestDTO> result = null;
               List<Map<String, Object>> list = null;
               Connection conn = Config.getInstance().sqlLogin();
               try {
               QueryRunner queryRunner = new QueryRunner();
               list = queryRunner.query(conn, "SELECT * FROM customer WHERE oid=?", new MapListHandler(), num);
               } catch (SQLException e) {
               e.printStackTrace();
               } finally {
               DbUtils.closeQuietly(conn);
               }
               Gson gson = new Gson();
               result = gson.fromJson(gson.toJson(list), new TypeToken<List<TestDTO>>() {
               }.getType());
               return result;
               }
           }
           ```
         * DTO
           > mariaDB로 부터 받은 DB를 자바 클래스에 태우기 위한 클래스입니다.
           > > DB 테이블 하나 당 DTO 한 개가 존재한다고 생각하시면 편합니다.
           ```java
           public class TestDTO {
               private String oid;
               private String name;
               private String phoneNumber;
               public String getOid() {return oid;}
               public void setOid(String oid) {this.oid = oid;}
               public String getName() {return name;}
               public void setName(String name) {this.name = name;}
               public String getPhoneNumber() {return phoneNumber; }
               public void setPhoneNumber(String phoneNumber) {this.phoneNumber = phoneNumber;}
           }
           ```
    * common
      > 이 프로젝트의 뼈대를 잡고 있는 클래스들입니다. 절대로 수정하지 말아주세요.
      > >수정 시 반드시 수정 사유를 공유할 것
      * controller
      * filter
      * index
      * sql
    
* ### web
  > View를 담당합니다. JSP로 작성합니다.
  * css
    > JSP에서 사용 할 css를 모아놓은 폴더입니다. (부트스트랩 5.0 넣어둠)
  * js
    > JSP에서 사용 할 js를 모아놓은 폴더입니다.(부트스트랩 5.0, JQuery 넣어둠)
  * WEB-INF
    * jsp
      > JSP에서 *.do 형식으로 된 domain클래스를 요청합니다.
      > > *.do 형식의 경로는 booksys.properties에서 찾을 수 있습니다.
      
      > 앞선 domain클래스에서 정의된 DB를 받아와서 JS로 가공한 후, HTML에 삽입합니다.
      ```html
      //앞선 설정으로 setAttribute 된 자바 변수를 JSP에서 받는 예시 (JQuery와 JSP문법을 사용하여 데이터를 가공한 후, id에 넘겨서 삽입함.)
      <script> 
      $(document).ready(function(){
          makeinfo1();
      })
      function makeinfo1(){
          var data = <%=getSomething%>;
          var list = $('#testDataPrinter');
          var text = '';
          text+= '<div>'+'oid : '+data[0].oid+'/ name : '+data[0].name+'/ phoneNumber : '+data[0].phoneNumber+'</div>';
          list.append(text);
      }
      </script>
      ```
       * common
         > 공통적으로 사용할 JSP를 모아놨습니다. ex) 헤더, 푸터
       * page
         > 각종 기본 page를 모아놓습니다.
    * lib
      > ~~프로젝트 만들다 보니깐 생겼는데 뭔지 모르겠습니다.~~
* * *
## How To Deploy
- 인텔리제이 설치 방법
  > https://leirbag.tistory.com/50
- 톰캣 설치 방법
  > https://leirbag.tistory.com/52 의 1번 항 참고
- mariaDB 설치 방법
  > https://leirbag.tistory.com/46
  - db 적용 방법
    > https://leirbag.tistory.com/47
  - 컴파일러에서 db 오류 발생 시
    > https://leirbag.tistory.com/48
- 클론 및 프로젝트 설치 방법
  > https://leirbag.tistory.com/56
* * *
## Tools
- IntelliJ 2021.1
- Tomcat 9.0.45
- JSP
- MariaDB (버전 까먹음)
- DBUtils  
- Java EE
- Bootstrap
- JQuery
- Ajax
* * *
## References
- IntelliJ로 JSP 프로젝트 생성
  > https://velog.io/@ruddms936/IntelliJ%EB%A1%9C-JSP-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%83%9D%EC%84%B1
- *.do의 역사
  > https://withthisclue.tistory.com/entry/JSP-%EC%9B%B9%ED%8E%98%EC%9D%B4%EC%A7%80%EC%97%90%EC%84%9C-%EA%B6%81%EA%B8%88%ED%96%88%EB%8D%98-do-%ED%8C%8C%EC%9D%BC%EC%9D%98-%EC%9D%98%EB%AF%B8
- Action 클래스
  > https://m.blog.naver.com/PostView.nhn?blogId=eroicaplus&logNo=90029919122&proxyReferer=http:%2F%2F210.217.72.119%2F
- Servlet
  > https://themach.tistory.com/68
- Servlet 과 JSP의 비교
  > https://m.blog.naver.com/acornedu/221128616501
* * *
