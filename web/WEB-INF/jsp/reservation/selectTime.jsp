<%--
  Created by IntelliJ IDEA.
  User: 최예슬
  Date: 2021-05-14
  Time: 오전 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String date = (String) request.getAttribute("date");
    String getSchedule = (String) request.getAttribute("getSchedule");
%>
<html lang="en">
<head>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">--%>
<%--    <meta name="generator" content="Hugo 0.83.1">--%>
<%--    <title>Top navbar example · Bootstrap v5.0</title>--%>

<%--    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">--%>


<%--    <!-- Bootstrap core CSS -->--%>
<%--    <link href="css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">--%>

<%--    <!-- Favicons -->--%>
<%--    <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">--%>
<%--    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">--%>
<%--    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">--%>
<%--    <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">--%>
<%--    <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">--%>
<%--    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">--%>
<%--    <meta name="theme-color" content="#7952b3">--%>


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

        .bottom_bar {
            background: lightgrey;
            position: fixed;
            left: 0;
            right: 0;
            bottom: 0;
            height: 50px;
            text-align: center;
        }

        .bottom_bar > button {
        }
        .clicked{
            background-color: #2a6496;
            color: white;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="css/navbar-top.css" rel="stylesheet">
    <link href="css/heroes.css" rel="stylesheet">
</head>
<%@include file="../common/header.jsp" %>
<body>

<main class="container">
    <div class="bg-light p-5 rounded">
        <h1>Navbar example</h1>
        <p class="lead">This example is a quick exercise to illustrate how the top-aligned navbar works. As you scroll,
            this navbar remains in its original position and moves with the rest of the page.</p>
        <a class="btn btn-lg btn-primary" href="#" role="button">View navbar docs »</a>
    </div>
    <div class="col-md-12">
        <input type="date" class="form-control" id="reservationDate" name="new_date" value=<%=date%> placeholder="Date of Birth" required>
        <button type="button" onclick="goToSelectTime()">조회 하기</button>
    </div>

</main>
<div class="album py-5 bg-light">
    <div class="container">
        <div class="row row-cols-3 row-cols-sm-4 row-cols-md-6 g-3" id="card"> </div>
    </div>
</div>
</div>
<script src="js/bootstrap.bundle.min.js"></script>
<%--<script src="js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"--%>
<%--        crossorigin="anonymous"></script>--%>
<div class="bottom_bar">
    <button class="w-25 btn-primary btn-lg" onclick="orderClicked()">예약 하기</button>
</div>


</body>
<script>
    $(document).ready(function(){
        makeSchedule();
    })

    function makeSchedule(){
        var list = $('#card');
        var text='';
        for (var i=10;i<22;i++){
            text+='<div class="col">'
                +'<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">'
                // +'<button type="button" class="btn btn-outline-secondary btn-lg px-4" id="'+i+'oClock" onclick="ScheduleClicked('+i+')">'+i+':00</button>'
                +'<button type="button" id="time'+i+'" onclick="ScheduleClicked('+i+')">'+i+':00</button>'
                +'</div></div>';
        }
        list.append(text);
    }


    function goToSelectTime(){
        var date=$('#reservationDate').val();
        if(date!=''){
            location.href='selectTime.do?date='+date;
        }
        else {
            // alert(date);
            alert("날짜를 선택해주세요!");
        }
    }
    function orderClicked() {
        location.href = 'reservationInfo.do';
    }
    let selectedTime = new Array();

    function ScheduleClicked(i){
        var id="#time"+i;
        if($(id).hasClass("clicked")){
            const index = selectedTime.indexOf(i);
            selectedTime.splice(index, 1);
            $(id).removeClass("clicked");
        }
        else {
            $(id).addClass("clicked")
            selectedTime.push(i);
        }
        console.log(selectedTime);
    }
</script>
</html>
