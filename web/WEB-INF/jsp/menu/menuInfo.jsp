<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-27
  Time: 오전 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String menu = (String) request.getAttribute("menu");
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.83.1">
  <title>Little4 Restaurant</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">

  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">



  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

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

    #menu, #notice, #content{
      font-family: 'Noto Serif KR', serif;
    }
  </style>


</head>
<body>
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>
<div class="b-example-divider"></div>

<div class="container my-5">
  <div class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg" id="menuInfo"></div>
</div>

<div class="b-example-divider"></div>

<%@include file="../common/footer.jsp" %>

<script src="js/bootstrap.bundle.min.js"></script>


</body>
<script>
  $(document).ready(function(){
    makeMenuInfo();
  })
  function makeMenuInfo() {
    var data = <%=menu%>;
    var list = $('#menuInfo');
    var text = '<div class="col-lg-5 p-3 p-lg-5 pt-lg-3">'
            +'<h1 id="menu" class="display-4 fw-bold lh-1">'+data.name+'</h1>'
            +'<p id="notice" class="lead">'+data.notice+'</p>'
            +'<div id="content" class="d-grid gap-2 d-md-flex justify-content-md-start mb-4 mb-lg-3">'
            +'<button type="button" class="btn btn-dark btn-lg px-4 me-md-2 fw-bold">'+data.price+'원</button>'
            +'<button type="button" class="btn btn-outline-secondary btn-lg px-4">조리시간 '+data.cookingTime+'분</button>'
            +'</div></div>'
            +'<div class="col-lg-4 offset-lg-1 p-0 position-relative overflow-hidden shadow-lg">'
            +'<div class="position-lg-absolute top-0 left-0 overflow-hidden">'
            +'<img class="d-block rounded-lg-3" src="img/menu/'+data.imageURL+'" alt="" width="720">'
            +'</div></div>';
    list.append(text);
  }

</script>
</html>