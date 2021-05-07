<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-05
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String loginFail = (String) session.getAttribute("loginFail");
%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <%--  <script src="webp/jquery-3.2.1.min.js"></script>--%>
  <style>
    *{
      margin: 0px;
      padding: 0px;
      text-decoration: none;
      font-family:sans-serif;

    }

    body {
      background-image: #34495e;
    }

    .loginForm {
      position:absolute;
      width:300px;
      height:400px;
      padding: 30px, 20px;
      background-color:#FFFFFF;
      text-align:center;
      top:50%;
      left:50%;
      transform: translate(-50%,-50%);
      border-radius: 15px;
    }

    .loginForm h2{
      text-align: center;
      margin: 30px;
    }

    .idForm{
      border-bottom: 2px solid #adadad;
      margin: 30px;
      padding: 10px 10px;
    }

    .passForm{
      border-bottom: 2px solid #adadad;
      margin: 30px;
      padding: 10px 10px;
    }

    .id {
      width: 100%;
      border:none;
      outline:none;
      color: #636e72;
      font-size:16px;
      height:25px;
      background: none;
    }

    .pw {
      width: 100%;
      border:none;
      outline:none;
      color: #636e72;
      font-size:16px;
      height:25px;
      background: none;
    }

    .btn {
      position:relative;
      left:40%;
      transform: translateX(-50%);
      margin-bottom: 40px;
      width:80%;
      height:40px;
      background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
      background-position: left;
      background-size: 200%;
      color:white;
      font-weight: bold;
      border:none;
      cursor:pointer;
      transition: 0.4s;
      display:inline;
    }

    .btn:hover {
      background-position: right;
    }

    .bottomText {
      text-align: center;
    }
  </style>
</head>
<%@include file="../common/header.jsp" %>
<body width="100%" height="100%">
<form action="login.do" method="post" id="loginForm" class="loginForm">
  <h2>Login</h2>
  <div class="idForm">
    <input type="text" id="id" class="id" placeholder="ID">
  </div>
  <div class="passForm">
    <input type="password" id="pw" class="pw" placeholder="Password">
  </div>
  <button type="button" class="btn" onclick="button()">로그인</button>
  <script>
    function button(){
      var id = $('#id').val();
      var pw = $('#pw').val();
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
</form>
</body>
</html>



