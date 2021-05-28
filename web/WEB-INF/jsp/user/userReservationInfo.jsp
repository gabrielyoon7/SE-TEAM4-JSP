<%--
  Created by IntelliJ IDEA.
  User: 허수빈
  Date: 2021-05-28
  Time: 오후 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String ReservationList = (String) request.getAttribute("ReservationList");
%>
<html>
<head>
    <link href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <title>Title</title>

    <style>
        #container{

        }

    </style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div id="container" class="py-5 row text-center" style="font-family: 'Noto Serif KR', serif;">
<div class="col-lg-7 mx-auto">
<table
        id="table"
        data-toggle="table"
        data-height="460"
        data-search="true"
        data-show-search-button="true"
        data-url="https://examples.wenzhixin.net.cn/examples/bootstrap_table/data"
        data-pagination="true"
        data-side-pagination="server">
    <thead>
    <tr>
        <th data-field="id">ID</th>
        <th data-field="name">Item Name</th>
        <th data-field="price">Item Price</th>
    </tr>
    </thead>
</table>
</div>
</div>
<%@include file="../common/footer.jsp" %>
</body>
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
</html>
