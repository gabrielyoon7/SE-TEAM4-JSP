<%--
  Created by IntelliJ IDEA.
  User: 최예슬
  Date: 2021-06-01
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String orderInfo = (String) request.getAttribute("orderInfo");
%>

<!DOCTYPE html> <html lang="en">
<!-- <html lang="en" style="height: 100%"> -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>차트</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<%@include file="../common/header.jsp" %>
<br>
<br>
<h1 style="font-size: 25px; font-family: 'Noto Serif KR', serif; text-align: center; font-size: 45px;">Statistics</h1>
<br>
<div style="width: 100%; height: 100%">
<canvas id="myChart" style="height: 50vh; width: 50vw; margin: 0 auto"></canvas>
</div>

<!-- 부트스트랩 -->
<!-- 차트 -->
<script> var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        //챠트 종류를 선택
        type: 'line',
        //챠트를 그릴 데이타
        data: { labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: '월별 매출',
                backgroundColor: 'transparent',
                borderColor: 'black',
                data: [0, 10, 5, 2, 20, 30, 45]
        }]
        },
        options: {
            responsive:false
        }
    });
</script>
<br>
<br>
<div style="width: 100%; height: 100%">
<canvas id="myChart2" style="height: 50vh; width: 50vw; margin: 0 auto;"></canvas>
</div>

<!-- 부트스트랩 -->
<!-- 차트 -->
<script> var ctx = document.getElementById('myChart2').getContext('2d');
var chart = new Chart(ctx, {
    //챠트 종류를 선택
    type: 'line',
    //챠트를 그릴 데이타
    data: { labels: ['1', '2', '3', '4', '5', '6', '7'],
        datasets: [{
            label: '일별 매출',
            backgroundColor: 'transparent',
            borderColor: 'black',
            data: [0, 10, 5, 2, 20, 30, 45]
        }]
    },
    options: {
        responsive:false
    }
});
</script>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<%@include file="../common/footer.jsp" %>
</html>

