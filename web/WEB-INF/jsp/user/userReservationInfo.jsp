<%--
  Created by IntelliJ IDEA.
  User: 허수빈
  Date: 2021-05-28
  Time: 오후 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String ReservationRequest = (String) request.getAttribute("ReservationRequest");
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
        id="reservationRequestTable"
        data-toggle="table"
        data-height="460"
        data-search="true"
        data-show-search-button="true"
<%--        data-url="https://examples.wenzhixin.net.cn/examples/bootstrap_table/data"--%>
        data-pagination="true"
        data-side-pagination="server">
    <thead>
    <tr>
        <th data-field="action">설정</th>
        <th data-field="oid">예약번호</th>
        <th data-field="date">날짜</th>
        <th data-field="time">시간</th>
        <th data-field="covers">예약인원</th>
        <th data-field="message">메시지</th>
    </tr>
    </thead>
</table>
</div>
</div>
<%@include file="../common/footer.jsp" %>
</body>
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        callSetupTableView1();
    })

    function callSetupTableView1(){
        $('#reservationRequestTable').bootstrapTable('load',data1());
        // $('#table').bootstrapTable('append',data());
        $('#reservationRequestTable').bootstrapTable('refresh');
    }

    function data1(){
        var orderList = <%=ReservationRequest%>
        var rows = [];
        for(var i=0;i<orderList.length;i++){
            var order=orderList[i];
            rows.push({
                oid: order.oid,
                covers: order.covers,
                date: order.date,
                time: order.time,
                message: order.message,
                action : '<button class="btn btn-dark" onclick="modifyReservationRequest('+i+')">예약 정보 수정</button>'
            });
        }
        // alert(rows);
        return rows;
    }

</script>
</html>
