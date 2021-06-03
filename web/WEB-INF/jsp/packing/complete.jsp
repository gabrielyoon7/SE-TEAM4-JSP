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
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Little4 Restaurant PACKING</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <!-- Favicons -->

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

        .container{
            margin-top: 60px;
        }

        #main{
            border-color: black;
            border-radius: 20px;
            border-width: thick;
        }


    </style>


    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">

</head>
<body class="bg-light vsc-initialized">

<%@include file="../common/header.jsp" %>

<div class="container">
    <main>
        <div id="main" class="alert alert-light" role="alert">
            <h4 id="user" style="font-family: 'Noto Serif KR', serif; font-weight: bolder" class="alert-heading"></h4>
            <hr>
            <p id="orderContent" style="font-family: 'Noto Serif KR', serif; font-weight: bolder" class="mb-0"></p>
        </div>
        <br>
        <br>
        <div class="pay_button text-center">
            <button class="w-25 btn-dark btn-lg" style="font-family: 'Noto Serif KR', serif;" onclick="goMain()" type="submit">메인으로 돌아가기</button>
        </div>
    </main>
    <br>
</div>

<%@include file="../common/footer.jsp" %>

<script src="js/form-validation.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

</body>
<script>
    $(document).ready(function (){
        makeOrder();
        makeUser();
    })

    var orderInfo=<%=orderInfo%>;
    var user=<%=user%>;
    function makeOrder(){
        var orderList=$('#orderContent');
        var text='';
        var menu=orderInfo[0].orderedList.split('/');

        for(var i=0; i<menu.length; i++)
            text+=menu[i]+`<br>`;

        orderList.append(text);
    }
    function makeUser(){
        var userId=$('#user');
        var text =user.id+'님의 주문이 완료되었습니다!';

        userId.append(text);
    }
    function goMain() {
        location.href = 'main.do';
    }

</script>

</html>
