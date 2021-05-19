<%--
  Created by IntelliJ IDEA.
  User: dnwnd
  Date: 2021-05-19
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href='css/bootstrap-table.css' rel='stylesheet' type='text/css'>
    <link href='css/boardtable.css' rel='stylesheet' type='text/css'>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-cookie.js"></script>
    <script src="/js/bootstrap-table-export.min.js"></script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<main class="container">
    <div class="py-5 text-center">
        <div class="row-fluid">
            <div class="btn pull=left">
                <input type="date" class="form-control" id="reservationDate" name="new_date" value='' placeholder="Date of Birth" required>
            </div>
            <button type="button" class="btn btn-primary btn-lg">Walk-In</button>
        </div>
    </div>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">No.</th>
                <th scope="col">18:00-19:00</th>
                <th scope="col">19:00-20:00</th>
                <th scope="col">20:00-21:00</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">Table-1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">Table-2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">Table-3</th>
                <td colspan="2">Larry the Bird</td>
                <td>@twitter</td>
            </tr>
            <tr>
                <th scope="row">Table-4</th>
                <td colspan="2">Larry the Bird</td>
                <td>@twitter</td>
            </tr>
            <tr>
                <th scope="row">Table-5</th>
                <td colspan="2">Larry the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>
        <div class="pay_button text-center">
            <button class="w-25 btn-primary btn-lg" type="submit">테이블 갱신</button>
        </div>
    </div>
</main>
</body>
</html>
