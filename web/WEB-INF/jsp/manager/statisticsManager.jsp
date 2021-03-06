<%@ page import="com.se.team4.application.persistency.DAO.Packing.PackingDAO" %><%--
  Created by IntelliJ IDEA.
  User: 최예슬
  Date: 2021-06-01
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String date = (String) request.getAttribute("date");
    String incomeOfDate1 = (String) request.getAttribute("incomeOfDate1");
    String incomeOfDate2 = (String) request.getAttribute("incomeOfDate2");
    String incomeOfDate3 = (String) request.getAttribute("incomeOfDate3");
    String incomeOfDate4 = (String) request.getAttribute("incomeOfDate4");
    String incomeOfDate5 = (String) request.getAttribute("incomeOfDate5");
    String incomeOfDate6 = (String) request.getAttribute("incomeOfDate6");
    String incomeOfDate7 = (String) request.getAttribute("incomeOfDate7");
    String date1 = (String) request.getAttribute("date1");
    String date2 = (String) request.getAttribute("date2");
    String date3 = (String) request.getAttribute("date3");
    String date4 = (String) request.getAttribute("date4");
    String date5 = (String) request.getAttribute("date5");
    String date6 = (String) request.getAttribute("date6");
    String date7 = (String) request.getAttribute("date7");
    String incomeOfWeek1 = (String) request.getAttribute("getOrderListOfWeek1");
    String incomeOfWeek2 = (String) request.getAttribute("getOrderListOfWeek2");
    String incomeOfWeek3 = (String) request.getAttribute("getOrderListOfWeek3");
    String incomeOfWeek4 = (String) request.getAttribute("getOrderListOfWeek4");
    String incomeOfWeek5 = (String) request.getAttribute("getOrderListOfWeek5");
    String incomeOfWeek6 = (String) request.getAttribute("getOrderListOfWeek6");
    String incomeOfWeek7 = (String) request.getAttribute("getOrderListOfWeek7");
    String week1 = (String) request.getAttribute("week1");
    String week2 = (String) request.getAttribute("week2");
    String week3 = (String) request.getAttribute("week3");
    String week4 = (String) request.getAttribute("week4");
    String week5 = (String) request.getAttribute("week5");
    String week6 = (String) request.getAttribute("week6");
    String week7 = (String) request.getAttribute("week7");



%>

<!DOCTYPE html> <html lang="en">
<!-- <html lang="en" style="height: 100%"> -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Little4 Restaurant MANAGER</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<%@include file="../common/header.jsp" %>
<br>
<br>
<h1 style="font-size: 25px; font-family: 'Noto Serif KR', serif; text-align: center; font-size: 45px;">Statistics</h1>
<br>
<div class="row-fluid container">
    <div class="btn pull=left">
        <input type="date" class="form-control" id="statisticsDate" name="new_date" value=<%=date%> required>
    </div>
    <%--            <button type="button" class="btn btn-primary btn-lg" onclick="goToWalkIn()">Walk-In</button>--%>
    <button  id="bt" type="button" class="btn btn-outline-dark btn-lg" onclick="reload()" >날짜 이동하기</button>

</div>
<script>
    function reload(){
        var date=$('#statisticsDate').val();
        if(date!=''){
            location.href = 'statisticsManager.do?date='+date;
        }
        else {
            // alert(date);
            swal({
                title : '날짜를 선택해주세요!',
                icon : 'error',
                button: '확인'
            });
        }
    }
</script>
<div style="width: 100%; height: 100%">
<canvas id="myChart" height="200" width="450" style="margin: 0 auto "></canvas>
</div>

<!-- 부트스트랩 -->
<!-- 차트 -->
<script> var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        //챠트 종류를 선택
        type: 'line',
        //챠트를 그릴 데이타
        data: { labels: ['<%=week1%>', '<%=week2%>', '<%=week3%>', '<%=week4%>', '<%=week5%>', '<%=week6%>', '<%=week7%>'],
            datasets: [{
                label: '주간 매출',
                backgroundColor: 'transparent',
                borderColor: 'black',
                data: [<%=incomeOfWeek1%>, <%=incomeOfWeek2%>, <%=incomeOfWeek3%>, <%=incomeOfWeek4%>, <%=incomeOfWeek5%>, <%=incomeOfWeek6%>, <%=incomeOfWeek7%>]
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
<canvas id="myChart2" height="200" width="450" style="margin: 0 auto "></canvas>
<%--    <canvas id="myChart2" style="height: 50vh; width: 50vw; margin: 0 auto;"></canvas>--%>
</div>

<!-- 부트스트랩 -->
<!-- 차트 -->
<script>

    var ctx = document.getElementById('myChart2').getContext('2d');
    var chart = new Chart(ctx, {
        //챠트 종류를 선택
        type: 'line',
        //챠트를 그릴 데이타
        data: { labels: ['<%=date1%>', '<%=date2%>', '<%=date3%>', '<%=date4%>', '<%=date5%>', '<%=date6%>', '<%=date7%>'],
            datasets: [{
                label: '일별 매출',
                backgroundColor: 'transparent',
                borderColor: 'black',
                data: [<%=incomeOfDate1%>, <%=incomeOfDate2%>, <%=incomeOfDate3%>, <%=incomeOfDate4%>, <%=incomeOfDate5%>, <%=incomeOfDate6%>, <%=incomeOfDate7%>]
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

