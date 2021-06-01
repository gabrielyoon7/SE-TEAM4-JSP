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
    String ReservationList = (String) request.getAttribute("ReservationList");
    String WalkInList = (String) request.getAttribute("WalkInList");
    String WaitingList = (String) request.getAttribute("WaitingList");
    String date = (String) request.getAttribute("date");
%>
<html>
<head>
    <title>Title</title>
    <link href='css/bootstrap-table.css' rel='stylesheet' type='text/css'>
    <link href='css/boardtable.css' rel='stylesheet' type='text/css'>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <%--    <script src="/js/bootstrap-table.js"></script>--%>
    <%--    <script src="/js/bootstrap-table-cookie.js"></script>--%>
    <%--    <script src="/js/bootstrap-table-export.min.js"></script>--%>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <style>
        #bt{
            margin-right: 5px;
        }
    </style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<main class="container">
    <div class="py-5 text-center" style="font-family: 'Noto Serif KR', serif;">
        <div class="row-fluid">
            <div class="btn pull=left">
                <input type="date" class="form-control" id="reservationDate" name="new_date" value=<%=date%> required>
            </div>
            <%--            <button type="button" class="btn btn-primary btn-lg" onclick="goToWalkIn()">Walk-In</button>--%>
            <button  id="bt" type="button" class="btn btn-outline-dark btn-lg" onclick="reload()" >날짜 이동하기</button>
<%--            <button type="button" class="btn btn-outline-dark btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >Walk-In 추가하기</button>--%>
            <!-- Modal -->
<%--            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">--%>
<%--                <div class="modal-dialog">--%>
<%--                    <div class="modal-content">--%>
<%--                        <div class="modal-header">--%>
<%--                            <h5 class="modal-title" id="staticBackdropLabel">Walk-In 추가하기</h5>--%>
<%--                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                        </div>--%>
<%--                        <div class="modal-body" id = "walkInData"></div>--%>
<%--                        &lt;%&ndash;                        <div class="modal-footer">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            <button type="button" class="btn btn-primary">추가하기</button>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <!-- Modal -->
            <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel2">수정하기</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id = "DataModify"></div>
                        <%--                        <div class="modal-footer">--%>
                        <%--                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>--%>
                        <%--                            <button type="button" class="btn btn-primary">추가하기</button>--%>
                        <%--                        </div>--%>
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
            <button class="w-25 btn-dark btn-lg" type="submit">테이블 갱신</button>
        </div>
    </div>

    <div>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif; font-size: 25px;" >대기리스트</p>
        <table class="boardtable" id="table1"  style="font-family: 'Noto Serif KR', serif;" data-toggle="table"
               data-pagination="true" data-toolbar="#toolbar"
               data-search="true" data-side-pagination="true" data-click-to-select="true"
               data-page-list="[10]">
            <thead>
            <tr>
                <th data-field="action">설정</th>
                <th data-field="covers" data-sortable="true">인원수</th>
                <th data-field="date" data-sortable="true">날짜</th>
                <th data-field="customer_name" data-sortable="true">이름</th>
            </tr>
            </thead>
            <%--    <tbody id="TableData">--%>
            <%--    </tbody>--%>
        </table>

    </div>

    <div>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif; font-size: 25px;" >갱신리스트</p>
        <%--        <table class="table">--%>
        <%--            <thead>--%>
        <%--            <tr>--%>
        <%--                <th>oid</th> <!--이름을 넣는거는 어떨까요? >>>> 넣었습니다-->--%>
        <%--                <th>인원수</th>--%>
        <%--                <th>날짜</th>--%>
        <%--                <th>시간</th>--%>
        <%--                <th>이름</th>--%>
        <%--                <th>아이디</th>--%>
        <%--                <th>요청사항</th>--%>
        <%--                <th>버튼</th>--%>
        <%--            </tr>--%>
        <%--            </thead>--%>
        <%--            <tbody id="DataList"></tbody>--%>
        <%--        </table>--%>

        <table class="boardtable" id="table"  style="font-family: 'Noto Serif KR', serif;" data-toggle="table"
               data-pagination="true" data-toolbar="#toolbar"
               data-search="true" data-side-pagination="true" data-click-to-select="true"
               data-page-list="[10]">
            <thead>
            <tr>
                <th data-field="action">설정</th>
                <th data-field="oid" data-sortable="true">oid</th>
                <th data-field="covers" data-sortable="true">인원수</th>
                <th data-field="date" data-sortable="true">날짜</th>
                <th data-field="time" data-sortable="true">시간</th>
                <th data-field="customer_name" data-sortable="true">이름</th>
                <th data-field="customer_id" data-sortable="true">아이디</th>
                <th data-field="message" data-sortable="true">요청사항</th>
            </tr>
            </thead>
            <%--    <tbody id="TableData">--%>
            <%--    </tbody>--%>
        </table>

    </div>
</main>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function(){
        // MakeModalData1();
        MakeTableHead();
        MakeTableBody();
        MakeReservationData();
        MakeWalkInData();
        // MakeNewOrderTable();
        callSetupTableView2()
        callSetupTableView();
    })
    var openingTime = 10;
    var closingTime = 22;
    <%--function MakeModalData1(){--%>
    <%--    let today = new Date();--%>
    <%--    var hour = today.getHours()--%>
    <%--    var list = $('#walkInData');--%>
    <%--    //날짜--%>
    <%--    var text = '날짜<input type="date" class="form-control" id="walkInDate1" name="new_date" value="" placeholder="Date" required>';--%>
    <%--    //시간--%>
    <%--    if(hour>=openingTime && hour<closingTime){--%>
    <%--        text += '시간<select id="walkInDate2" class="form-control"><option value="'+hour+'">'+hour+':00(현재)</option>';--%>
    <%--    }--%>
    <%--    else {//영업시간이 아닐 때--%>
    <%--        text += '시간<select id="walkInDate2" class="form-control"><option value="">--시간을 선택하세요--</option>';--%>
    <%--    }--%>
    <%--    for(var i=openingTime;i<closingTime;i++){--%>
    <%--        text+='<option value="'+i+'">'+i+':00</option>';--%>
    <%--    }--%>
    <%--    text+='</select>';--%>
    <%--    //인원수--%>
    <%--    text += '인원수<select id="walkInCovers" class="form-control"><option value="1">1명</option>';--%>
    <%--    for(var i=2;i<6;i++){--%>
    <%--        text+='<option value="'+i+'">'+i+'명</option>';--%>
    <%--    }--%>
    <%--    text+='</select>';--%>
    <%--    //테이블 번호--%>
    <%--    var tableList = <%=TableList%>--%>
    <%--        text += '테이블번호<select id="walkInTable" class="form-control">';--%>
    <%--    for(var i=0;i<tableList.length;i++){--%>
    <%--        var table=tableList[i];--%>
    <%--        text+='<option value="'+table.number+'">'+table.number+'번 테이블</option>';--%>
    <%--    }--%>
    <%--    text+='</select>';--%>
    <%--    text+='<div class="modal-footer">'--%>
    <%--        +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'--%>
    <%--        +'<button type="button" class="btn btn-dark" onclick="MakeWalkIn()">추가하기</button>'--%>
    <%--        +'</div>'--%>
    <%--    list.append(text);--%>
    <%--}--%>



    var selectedSchedule=[];
    var selectedText=[];
    function scheduleClicked(ij){
        if(ij<100){
            var id="#0"+ij;
        }
        else {
            var id="#"+ij;
        }
        var text = $(id).text();
        const index1 = selectedSchedule.indexOf(id);
        selectedSchedule.splice(index1, 1);
        selectedSchedule.push(id);

        const index2 = selectedText.indexOf(text);
        selectedText.splice(index2, 1);
        selectedText.push(text);

        console.log(selectedSchedule);
        console.log(selectedText);

        MakeModalData2(id);

    }

    function MakeModalData2(id){
        // var newID = '"'+id+'"';
        var list = $('#DataModify');
        var text='';
        alert('id:'+id);
        if(selectedText[0]=='-'){
            let today = new Date();
            var hour = today.getHours();

            //날짜
            var text = '';
            var date = <%=date%>;
            text+='날짜<input type="date" class="form-control" id="walkInDate1" name="new_date" value="'+date+'" placeholder="Date" readonly>';

            //시간
            var time_number=id.slice(2,4);
            text+='시간<input type="text" class="form-control" id="walkInDate2" name="new_time" value="'+time_number+'" placeholder="Date" readonly>';

            //테이블 번호
            var table_number=id.slice(1,2);
            text+='테이블번호<input type="text" class="form-control" id="walkInTable" name="new_table" value="'+(table_number)+'" placeholder="Date" readonly>';

            //인원수
            text += '인원수<select id="walkInCovers" class="form-control"><option value="1">1명</option>';
            for(var i=2;i<6;i++){
                text+='<option value="'+i+'">'+i+'명</option>';
            }
            text+='</select>';
            text+='<div class="modal-footer">'
                +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
                +'<button type="button" class="btn btn-dark" onclick="MakeWalkIn()">추가하기</button>'
                +'</div>';
        }
        else {//(미완성)발열 혹은 수정 기능 넣어야 할듯
            if(selectedText[0].slice(1,2)=='R'){
                //날짜
                text = '발열 입력<input type="date" class="form-control" id="modifyDate" name="new_date" value="" placeholder="Date" required>'
                    +'id:'+id;
                text+='<div class="modal-footer">'
                    +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
                    +'<button type="button" class="btn btn-dark" onclick="deleteSchedule()">도착</button>'
                    +'</div>';
            }
            else if(selectedText[0].slice(1,2)=='W'){
                //날짜
                text = '발열 입력 <input type="date" class="form-control" id="modifyDate" name="new_date" value="" placeholder="Date" required>'
                    +'id:'+id;
                text+='<div class="modal-footer">'
                    +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
                    +'<button type="button" class="btn btn-dark" onclick="deleteSchedule()">삭제하기</button>'
                    +'</div>';
            }
        }
        list.html(text);//누를때마다 #DataModify의 값을 완전 새로 갈아치움
    }






    function MakeTableHead(){
        var list = $('#TableHead');
        var text = '<tr><th scope="col">No.</th>';
        for(var i=openingTime;i<closingTime;i++){
            text+='<th scope="col">'+i+':00</th>';
        }
        text+='</tr>';
        list.append(text);
    }
    function MakeTableBody(){
        var tableList = <%=TableList%>
        var list = $('#TableData');
        var text = '';
        for(var i=0;i<tableList.length;i++){
            var newI=i+1;
            var table=tableList[i];
            text+='<tr>'
                +'<td>'+table.number+'</td>';
            for(var j=openingTime;j<closingTime;j++){
                text+='<td><button id='+newI+j+' type="button" class="btn btn-dark btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" onclick="scheduleClicked('+newI+j+')">-</button></td>'
            }
            +'</tr>';
        }
        list.append(text);
    }
    function MakeReservationData(){
        var tableList = <%=TableList%>
        var reservationList=<%=ReservationList%>
        var text = '';
        for(var i=1;i<tableList.length+1;i++){
            for(var j=openingTime;j<closingTime;j++){
                text='';
                for(var k=0; k<reservationList.length; k++) {
                    var reservationData = reservationList[k];
                    if (reservationData.time == j && reservationData.table_id == i) {
                        text+=i+""+j;
                        document.getElementById(eval("'"+text+"'")).innerText="[R]"+reservationData.customer_id;
                        // text += '<td>' + reservationData.customer_name + '</td>'
                    }
                }
            }
        }
    }
    function MakeWalkInData(){
        var tableList = <%=TableList%>
        var walkInList=<%=WalkInList%>
        var text = '';
        for(var i=1;i<tableList.length+1;i++){
            for(var j=openingTime;j<closingTime;j++){
                text='';
                for(var k=0; k<walkInList.length; k++) {
                    var walkInData = walkInList[k];
                    if (walkInData.time == j && walkInData.table_id == i) {
                       // alert(walkInData.table_id);
                        text+=i+""+j;
                        document.getElementById(eval("'"+text+"'")).innerText="[W]"+walkInData.covers+"명";
                        // text += '<td>' + reservationData.customer_name + '</td>'
                    }
                }
            }
        }
    }
    <%--function MakeNewOrderTable(){--%>
    <%--    var orderList = <%=NewOrderList%>--%>
    <%--    var list = $('#DataList');--%>
    <%--    var text = '';--%>
    <%--    for(var i=0;i<orderList.length;i++){--%>
    <%--        var order=orderList[i];--%>
    <%--        text+='<tr>'--%>
    <%--            + '<th>'+order.oid+'</th>'--%>
    <%--            + '<th>'+order.covers+'</th>'--%>
    <%--            + '<th>'+order.date+'</th>'--%>
    <%--            + '<th>'+order.time+'</th>'--%>
    <%--            + '<th>'+order.customer_name+'</th>'--%>
    <%--            + '<th>'+order.customer_id+'</th>'--%>
    <%--            + '<th>'+order.message+'</th>'--%>
    <%--            + '<th><button onclick="addReservation('+i+')">예약 배정</button></th>'--%>
    <%--            +'</tr>';--%>
    <%--    }--%>
    <%--    list.append(text);--%>
    <%--}--%>
    function callSetupTableView(){
        $('#table').bootstrapTable('load',data());
        // $('#table').bootstrapTable('append',data());
        $('#table').bootstrapTable('refresh');
    }
    function data(){
        var orderList = <%=NewOrderList%>
        var rows = [];
        for(var i=0;i<orderList.length;i++){
            var order=orderList[i];
            rows.push({
                oid: order.oid,
                covers: order.covers,
                date: order.date,
                time: order.time,
                customer_name: order.customer_name,
                customer_id: order.customer_id,
                message: order.message,
                action : '<button class="btn btn-dark" onclick="addReservation('+i+')">예약 배정</button>'
            });
        }
        // alert(rows);
        return rows;
    }

    function callSetupTableView2(){
        $('#table1').bootstrapTable('load',data2());
        // $('#table').bootstrapTable('append',data());
        $('#table1').bootstrapTable('refresh');
    }
    function data2(){
        var waitingList = <%=WaitingList%>
        var rows = [];
        for(var i=0;i<waitingList.length;i++){
            var waiting=waitingList[i];
            rows.push({
                covers: waiting.covers,
                date: waiting.date,
                customer_name: waiting.name,
                action : '<button class="btn btn-dark" onclick="addWaitingListToWalkIn('+i+')">손님 배정</button>'
            });
        }
        // alert(rows);
        return rows;
    }

    function addWaitingListToWalkIn(i){
        var waitingList = <%=WaitingList%>
        var waiting=waitingList[i];
        let today=new Date();
        var time=today.getHours();
        var data =waiting.covers+"-/-/-"+waiting.date+"-/-/-"+waiting.name+"-/-/-"+time;
        var check=confirm("배정 하시겠습니까?");
        if(check){
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "addWaitingListToWalkIn",
                    data: data
                },
                success: function (oid) {
                    if(oid=="-1"){
                        alert("현재 만석입니다.");
                    }
                    else {
                        alert("현장 예약이 정상적으로 요청되었습니다.");
                    }
                    location.href = 'customerManager.do?date='+<%=date%>;
                }
            })
        }
    }
    function addReservation(i){
        var orderList = <%=NewOrderList%>
        var order=orderList[i];
        var data = order.covers+"-/-/-"+order.date+"-/-/-"+order.time+"-/-/-"+order.customer_id+"-/-/-"+order.customer_name;
        var check=confirm("배정 하시겠습니까?");
        if(check){
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "addReservation",
                    data: data
                },
                success: function (oid) {
                    alert("[예약번호:"+oid+"]의 현장 예약이 정상적으로 요청되었습니다.");
                    location.href = 'customerManager.do?date='+<%=date%>;
                }
            })
        }
    }
    function MakeWalkIn() {
        var date = document.getElementById('walkInDate1').value;
        var time = document.getElementById('walkInDate2').value;
        var cover = document.getElementById('walkInCovers').value;
        var table = document.getElementById('walkInTable').value;
        var data = date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+table;
        var check = confirm("배정 하시겠습니까?");
        if(check){
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "walkInRequest",
                    data: data
                },
                success: function (oid) {
                    if(oid=="-1"){
                        alert("이미 입석한 손님이 존재합니다.");
                    }
                    else if(oid=="-2"){
                        var check = confirm("현재 만섭입니다. 대기리스트에 등록하시겠습니까?");
                        if(check)
                            MakeWaitingList(check);
                    }
                    else {
                        alert("[예약번호:" + oid + "]의 현장 예약이 정상적으로 요청되었습니다.");
                    }
                    location.href = 'customerManager.do?date='+<%=date%>;
                }
            })
        }
    }
    function  MakeWaitingList(checking){
        var date = document.getElementById('walkInDate1').value;
        var table = document.getElementById('walkInTable').value;
        var cover = document.getElementById('walkInCovers').value;
        var data=date+"-/-/-"+table+"-/-/-"+cover;
        var check = checking;
        if(check){
            var name=prompt("성함를 남겨주세요","");
            data+="-/-/-/"+name;
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "makeWaitingList",
                    data: data
                },
                success: function (oid) {
                    alert("[예약번호:" + oid + "]의 대기리스트 등록이 정상적으로 요청되었습니다.");
                    location.href = 'customerManager.do?date='+<%=date%>;
                }
            })
        }
    }
    function reload(){
        var date=$('#reservationDate').val();
        if(date!=''){
            location.href = 'customerManager.do?date='+date;
        }
        else {
            // alert(date);
            alert("날짜를 선택해주세요!");
        }
    }
</script>
</html>