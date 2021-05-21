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
<div class="bottom_bar">
    <button class="w-25 btn-primary btn-lg" onclick="reservationRequest()">예약 하기</button>
</div>


</body>
<script>
    $(document).ready(function(){
        makeSchedule();
    })

    var openTime=10;
    var closeTime=22;

    function makeSchedule(){
        var list = $('#card');
        var text='';
        for (var i=openTime;i<closeTime;i++){
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

    let selectedTime = new Array();

    function ScheduleClicked(i){
        var id="#time"+i;
        if($(id).hasClass("clicked")){
            const index = selectedTime.indexOf(i);
            selectedTime.splice(index, 1);
            $(id).removeClass("clicked");
        }
        else {
            selectedTime=[];
            for (var a=openTime;a<closeTime;a++){
                var tempId="#time"+a;
                $(tempId).removeClass("clicked");
            }
            $(id).addClass("clicked");
            selectedTime.push(i);
        }
        console.log(selectedTime);
    }

    function reservationRequest() {
        var date=$('#reservationDate').val();
        if(date!=''&&selectedTime.length!=0){
            location.href = 'reservationInfo.do?date='+date+'&&time='+selectedTime[0];
        }
        else{
            alert("날짜 혹은 일정을 선택해주세요!");
        }
    }

</script>
</html>
