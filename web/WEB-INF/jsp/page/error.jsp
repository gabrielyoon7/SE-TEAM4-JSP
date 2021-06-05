<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-14
  Time: 오후 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ERROR</title>
  <!-- Custom styles for this template -->
  <link href="sticky-footer-navbar.css" rel="stylesheet">
</head>
<body>
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>
<!-- Begin page content -->
<main class="flex-shrink-0">
  <div class="container">
    <h1 class="mt-5">Something is Wrong!</h1>
    <p class="lead">이 페이지로 이동 된 이유는  <code class="small">오류가 발생했기 때문</code> 입니다.</p>
    <p> <code class="small">개발자가 의도한 오류 방지 페이지 </code>이므로 해당 기능 작성자에게 문의 바랍니다.</p>
    <p>문제가 발생하는 가장 큰 원인은 <code class="small">로그인 여부로 해당 페이지의 접근을 막아둔 경우 </code>입니다.</p>
    <p>메인으로 <a href="main.do">돌아가기</a> </p>
  </div>
</main>
</body>
</html>
