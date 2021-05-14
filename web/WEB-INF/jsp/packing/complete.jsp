<%--
  Created by IntelliJ IDEA.
  User: dnwnd
  Date: 2021-05-13
  Time: 오후 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String orderInfo = (String) request.getAttribute("orderInfo");
%>
<!doctype html>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Checkout example · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">



    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">


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


    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
</head>
<body class="bg-light vsc-initialized">

<%@include file="../common/header.jsp" %>

<div class="container">
    <main>
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">주문이 완료되었습니다!</h4>
            <hr>
            <p class="mb-0">ㅁㅁ</p>
        </div>
        <div class="pay_button text-center">
            <button class="w-25 btn-primary btn-lg" onclick="goMain()" type="submit">메인으로 돌아가기</button>
        </div>
    </main>
    <br>
    <%@include file="../common/footer.jsp" %>
</div>
<script src="form-validation.js"></script>
</body>
<script>
    function goMain(){
        location.href = 'main.do';
    }
</script>
</html>







