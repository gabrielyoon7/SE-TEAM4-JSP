<%--
  Created by IntelliJ IDEA.
  User: dnwnd
  Date: 2021-05-19
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String TableList = (String) request.getAttribute("TableList");
    String NewOrderList = (String) request.getAttribute("NewOrderList");
%>
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
<%--            <button type="button" class="btn btn-primary btn-lg" onclick="goToWalkIn()">Walk-In</button>--%>
            <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >Walk-In</button>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Walk-In</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            input문 집어넣기
                            날짜는 오늘로 고정, 시간은 현재로 default(수정가능), Covers, 테이블 번호

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary">추가하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <table class="table">
            <thead id="TableHead"></thead>
            <tbody id="TableData"></tbody>
        </table>
        <div class="pay_button text-center">
            <button class="w-25 btn-primary btn-lg" type="submit">테이블 갱신</button>
        </div>
    </div>
    <div>
        <p>갱신리스트</p>
        <table class="table">
            <thead>
            <tr>
                <th>oid</th> <!--이름을 넣는거는 어떨까요? >>>> 넣었습니다-->
                <th>인원수</th>
                <th>날짜</th>
                <th>시간</th>
                <th>이름</th>
                <th>아이디</th>
                <th>요청사항</th>
                <th>버튼</th>
            </tr>
            </thead>
            <tbody id="DataList"></tbody>
        </table>
    </div>
</main>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function(){
        MakeTableHead();
        MakeTableData();
        MakeNewOrderTable();
    })
    var openingTime = 10;
    var closingTime = 22;
    function MakeTableHead(){
        var list = $('#TableHead');
        var text = '<tr><th scope="col">No.</th>';
        for(var i=openingTime;i<closingTime;i++){
            text+='<th scope="col">'+i+':00</th>';
        }
        text+='</tr>';
        list.append(text);
    }
    function MakeTableData(){
        var tableList = <%=TableList%>
        var list = $('#TableData');
        var text = '';
        for(var i=0;i<tableList.length;i++){
            var table=tableList[i];
            text+='<tr>'
                +'<td>'+table.number+'</td>';
            for(var j=openingTime;j<closingTime;j++){
                text+='<td>-</td>'
            }
            text+='</tr>';
        }
        list.append(text);
    }
    function MakeNewOrderTable(){
        var orderList = <%=NewOrderList%>
        var list = $('#DataList');
        var text = '';
        for(var i=0;i<orderList.length;i++){
            var order=orderList[i];
            text+='<tr>'
                + '<th>'+order.oid+'</th>'
                + '<th>'+order.covers+'</th>'
                + '<th>'+order.date+'</th>'
                + '<th>'+order.time+'</th>'
                + '<th>'+order.customer_name+'</th>'
                + '<th>'+order.customer_id+'</th>'
                + '<th>'+order.message+'</th>'
                + '<th><button onclick="addReservation('+i+')">예약 배정</button></th>'
                +'</tr>';
        }
        list.append(text);
    }
    function addReservation(i){

    }
    // function goToWalkIn(){
    //
    //     var date=$('#reservationDate').val();
    //
    //
    //     if(date!=''){
    //         alert('');
    //     }
    //     else {
    //         // alert(date);
    //         alert("날짜를 선택해주세요!");
    //     }
    //
    // }

</script>
</html>
