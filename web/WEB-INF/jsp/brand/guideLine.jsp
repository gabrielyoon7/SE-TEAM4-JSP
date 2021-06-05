<%--
  Created by IntelliJ IDEA.
  User: 허수빈
  Date: 2021-06-03
  Time: 오후 1:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>~Little4 Restaurant Guide Line~</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<%@include file="../common/header.jsp" %>
<style type="text/css">
    a {color : white; text-decoration:none;}
    a:hover {color : white; text-decoration: none;}
</style>
<div id="first" class="px-4 py-5 my-5 text-center">
    <h1 id="title" class="display-5 fw-bold" style="font-family: 'Noto Serif KR', serif;">Little4 Restaurant Guide-Line</h1>
    <p class="lead mb-4" style="font-size: 40px; font-family: 'Amatic SC', cursive;">by Team4</p>
    <div style="font-family: 'Noto Serif KR', serif; font-weight: bold" >
        <h1 class="fw-bold" style="font-family: 'Noto Serif KR', serif; font-size: 30px"> > 바로가기</h1>

        <button class="btn btn-dark"><a href="#menu">메뉴 보기</a></button>
        <button class="btn btn-dark"><a href="#reservation">예약 방법</a></button>
        <button class="btn btn-dark"><a href="#order">주문 방법</a></button>
    </div>
</div>

<hr style="margin: 0 40px">

<div class="px-4 py-5 text-center" >
    <a name="menu"><h1 class="fw-bold" style="font-family: 'Noto Serif KR', serif; font-size: 30px"> > 메뉴를 보고 싶다면?</h1>
    </a>
    <div>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">1. 상단의 메뉴들 중 'menu'를 선택한다.</p>
        <br>
        <img src="img/guideLine/selectmenu.png" width="50%">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">2. 종류별 버튼을 눌러 보고 싶은 메뉴를 확인한다.</p>
        <img src="img/guideLine/menu_1.PNG" width="50%">
    </div>
</div>

<hr style="margin: 0 40px">

<div class="px-4 py-5 text-center" >
    <a name="reservation"><h1 class="fw-bold" style="font-family: 'Noto Serif KR', serif; font-size: 30px"> > 예약을 하고 싶다면?</h1>
    </a>
    <div>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">1. 로그인 한다.</p>
        <img src="img/guideLine/reservation_1.png" width="100px" height="60px">
        <br>
        <p></p>
        <img src="img/guideLine/reservation_2.png" width="350px" height="400px">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">2. 상단의 메뉴들 중 'reservation'를 선택한다.</p>
        <br>
        <img src="img/guideLine/selectreservation.png" width="50%">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">3. 예약하고 싶은 날짜를 고르고, '이 날짜로 예약하기'를 누른다.</p>
        <img src="img/guideLine/reservation_3.png" width="50%">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">4. 예약하고 싶은 시간대를 고르고, '예약하기'를 누른다.</p>
        <img src="img/guideLine/reservation_4.png" width="50%">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">5. 인원 수와 전달하고 싶은 메세지를 적은 후, '예약하기'를 누른다.</p>
        <img src="img/guideLine/reservation_5.png" width="50%">
        <br>
        <p></p>
        <br>
        <img src="img/guideLine/reservation_6.png" width="400px" height="250px">
        <br>
    </div>
</div>

<hr style="margin: 0 40px">

<div class="px-4 py-5 text-center" >
    <a name="order"><h1 class="fw-bold" style="font-family: 'Noto Serif KR', serif; font-size: 30px"> > 주문을 하고 싶다면?</h1>
    </a>
    <div>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">1. 로그인 한다.</p>
        <img src="img/guideLine/reservation_1.png" width="100px" height="60px">
        <br>
        <p></p>
        <img src="img/guideLine/reservation_2.png" width="350px" height="400px">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">2. 상단의 메뉴들 중 'packing'를 선택한다.</p>
        <br>
        <img src="img/guideLine/selectpacking.png" width="50%">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">3. 원하는 메뉴를 '장바구니에 추가'하고, '주문하기'를 누른다.</p>
        <img src="img/guideLine/packing_1.png" width="50%">
        <br>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">4. 결제방식을 선택하고, 요청사항이 있다면 적은 후, '결제하기'를 누른다.</p>
        <img src="img/guideLine/packing_2.png" width="50%">
        <br>
        <p></p>
        <br>
        <img src="img/guideLine/packing_3.png" width="400px" height="270px">
        <br>
    </div>
</div>


<script src="js/bootstrap.bundle.min.js"></script>
</body>
<%@include file="../common/footer.jsp" %>
</html>
