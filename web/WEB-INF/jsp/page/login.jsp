<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-05
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%
  /**
   * login시 입력한 ID와 PW를 한줄의 String으로 만들어서 AjaxAction 클래스로 보냅니다.
   * */
  String errorMessage = (String) request.getAttribute("error");
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }

  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }
</style>
<%--<body class="text-center">--%>
<body>
<%@include file="../common/header.jsp" %>
<!-- Custom styles for th\
   is template -->
<link href="css/signin.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<main class="form-signin">
  <form>
    <img class="mb-4" src="icons/bootstrap-fill.svg" alt="" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="id">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <div class="mb-3">
      <a href="signupPage.do">아직 회원이 아니세요?</a>
    </div>
    <button type="button" class="w-100 btn btn-lg btn-primary" onclick="button()">로그인</button>
<%--    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>--%>
    <p class="mt-5 mb-3 text-muted">&copy; 2021 TEAM4.SE@KGU</p>
  </form>
</main>


<script src="js/bootstrap.bundle.min.js"></script>

<%--footer 적용시 레이아웃 깨지는 문제가 있어서 주석처리. 원인은 모르겠음--%>
<%--<%@include file="../common/footer.jsp" %>--%>
</body>
<script>
  $(document).ready(function(){ //이 파일이 시작되면 자동으로 실행됩니다.
    errorAlert();
  })

  function errorAlert(){
    var errorMessage = "<%=errorMessage%>";
    if(errorMessage!='null')
      alert(errorMessage);
  }


  function button(){
    var id = $('#floatingInput').val();
    var pw = $('#floatingPassword').val();
    var data = id+"-/-/-"+pw; //데이터를 1줄로 합침.
    $.ajax({
      url: "ajax.do",
      type: "post",
      data: {
        req: "login", //AjaxAction 클래스에다가 req값을 전달해줍니다.
        data: data //AjaxAction 클래스에다가 data값을 전달해줍니다.
      },
      success: function (login) { //login은 ajaxAction 클래스가 return해준 값을 담는 변수 이름입니다.
        if(login=="성공"){
          alert("로그인 성공");
          window.location.href="main.do"
        }
        else{
          alert("로그인 실패");
          location.reload();
        }
      }
    })

  }
</script>
</html>
