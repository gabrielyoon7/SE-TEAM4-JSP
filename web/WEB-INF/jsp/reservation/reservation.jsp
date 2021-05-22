<%--
  Created by IntelliJ IDEA.
  User: ssh10
  Date: 2021-05-13
  Time: 오후 8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
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
    </style>
    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">
</head>
<html>
<body class="d-flex h-100 text-center text-white bg-dark">
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>
<div  class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <main class="px-3">
        <h1>Reservation</h1>
        <p class="lead">예약하실 날짜를 선택해 주세요.</p>
        <div class="col-md-12">
<%--            <label for="reservationDate">예약 일정 조회</label>--%>
            <input type="date" class="form-control" id="reservationDate" name="new_date" value='' placeholder="Date of Birth" required>
        </div>
        <p class="lead">
            <button class="btn btn-lg btn-secondary fw-bold border-white bg-black" onclick="goToSelectTime()">이 날짜로 예약하기</button>
        </p>
    </main>
</div>
<script src="js/bootstrap.bundle.min.js"></script>

<%--<%@include file="../common/footer.jsp" %>--%>
</body>
<script>
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
</script>
</html>
