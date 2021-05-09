<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-05
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
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
    <button type="button" class="w-100 btn btn-lg btn-primary" onclick="button()">로그인</button>
<%--    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>--%>
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
  </form>
</main>


<script src="js/bootstrap.bundle.min.js"></script>

<%--footer 적용시 레이아웃 깨지는 문제가 있어서 주석처리--%>
<%--<%@include file="../common/footer.jsp" %>--%>
</body>
<script>
  function button(){
    var id = $('#floatingInput').val();
    var pw = $('#floatingPassword').val();
    var data = id+"-/-/-"+pw;
    $.ajax({
      url: "login.do",
      type: "post",
      data: {
        data: data
      },
      success: function (login) {
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
