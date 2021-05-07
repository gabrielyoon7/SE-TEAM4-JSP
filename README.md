Restaurant Booking System of TEAM4
=============
>경기대학교 AI컴퓨터공학부
> >권기현 교수님 2021-1 소프트웨어공학 4조
* * *
## History
- 2021.05.07
  - [윤주현] 로그인 기능 추가, User 테이블 추가, 임시 헤더 작성
- 2021.05.06
  - [윤주현] Readme 업데이트
  - [김우중] DB 업데이트
- 2021.05.05
  - Spring 에서 JSP로 변경
  - [윤주현] Java ee와 Tomcat으로 JSP 프로젝트 구축 및 기본 구조 입력
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
- 인텔리제이 설치 방법 : https://leirbag.tistory.com/50
- 톰캣 설치 방법 : https://leirbag.tistory.com/52 의 1번 항 참고
- mariaDB 설치 방법 : https://leirbag.tistory.com/46
  - db 적용 방법 : https://leirbag.tistory.com/47
  - 컴파일러에서 db 오류 발생 시 : https://leirbag.tistory.com/48
- 클론 및 프로젝트 설치 방법 : https://leirbag.tistory.com/56
* * *
## Tools
- IntelliJ 2021.1
- Tomcat 9.0.45
- JSP
- MariaDB 버전 까먹음
- Java EE
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
