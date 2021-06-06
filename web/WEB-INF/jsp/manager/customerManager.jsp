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
    <title>Little4 Restaurant MANAGER</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href='css/bootstrap-table.css' rel='stylesheet' type='text/css'>
    <link href='css/boardtable.css' rel='stylesheet' type='text/css'>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <%--    <script src="/js/bootstrap-table.js"></script>--%>
    <%--    <script src="/js/bootstrap-table-cookie.js"></script>--%>
    <%--    <script src="/js/bootstrap-table-export.min.js"></script>--%>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <style>
        #bt{
            margin-right: 5px;
        }
        .pull-right ul{
            display: none;
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
                            <h5 class="modal-title" id="staticBackdropLabel2">관리하기</h5>
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

            <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel3" >대기리스트 등록</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" id = "WaitingData"></div>
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
<%--            <button class="w-25 btn-dark btn-lg" onclick="MakeWaitingList()">대기리스트 추가</button>--%>
                <button type="button" class="btn btn-dark btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" onclick="MakeModalData4()">대기리스트 추가</button>
        </div>
    </div>

    <div>
        <br>
        <br>
        <p style="font-family: 'Noto Serif KR', serif; font-size: 25px;" >대기 리스트</p>
        <table class="boardtable" id="table1"  style="font-family: 'Noto Serif KR', serif;" data-toggle="table"
               data-pagination="true" data-toolbar="#toolbar"
               data-search="true" data-side-pagination="true" data-click-to-select="true" data-height="460"
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
        <p style="font-family: 'Noto Serif KR', serif; font-size: 25px;" >예약 요청 명단</p>
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
               data-search="true" data-side-pagination="true" data-click-to-select="true" data-height="460"
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

    function MakeModalData2(id){ //id = #테이블번호+타임
        // var newID = '"'+id+'"';
        var list = $('#DataModify');
        var text='';
        // alert('id:'+id);
        var index=selectedText[0].indexOf("]");
        var date = <%=date%>;
        var time_number=id.slice(2,4);
        var table_number=id.slice(1,2);

        if(selectedText[0]=='-'){
            //날짜
            text+='날짜<input type="date" class="form-control" id="walkInDate1" name="new_date" value="'+date+'" placeholder="Date" readonly>';

            //시간
            text+='시간<input type="text" class="form-control" id="walkInDate2" name="new_time" value="'+time_number+'" placeholder="Date" readonly>';

            //테이블 번호
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
        else {//(미완성) 신청된 일정일 시
            //공통으로 뜰 것
            text +='날짜<input type="date" class="form-control" id="modifyDate" name="new_date" value="'+date+'" placeholder="Date" >'

            text +='시간<select id="modifyTime" class="form-control"><option value="'+time_number+'">'+time_number+':00</option>'
            for(var i=openingTime;i<closingTime;i++){
                text+='<option value="'+i+'">'+i+':00</option>';
            }
            text +='</select>';

            var tableList = <%=TableList%>
            text +='테이블번호<select id="modifyTable" class="form-control"><option value="'+table_number+'">'+table_number+'번 테이블</option>'
            for(var i=0;i<tableList.length;i++){
                var newI=i+1;
                text+='<option value="'+newI+'">'+newI+'번 테이블</option>';
            }
            text +='</select>';
            text += '인원수<select id="modifyCovers" class="form-control"><option value="1">1명</option>';
            for(var i=2;i<6;i++){
                text+='<option value="'+i+'">'+i+'명</option>';
            }
            text+='</select>';
            if(selectedText[0].slice(1,2)=='R'){
                text+='<div class="modal-footer">'
                    +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
                    +'<button type="button" class="btn btn-dark" onclick="deleteSchedule()">삭제</button>'
                    +'<button type="button" class="btn btn-dark" onclick="modifyReservation('+selectedText[0].slice(3,index)+')">수정</button>'
                    +'<button type="button" class="btn btn-dark" onclick="recordArrival('+table_number+time_number+')">도착</button>'
                    +'<button type="button" class="btn btn-dark" onclick="MakeModalData3('+table_number+time_number+')">기록</button>'
                    +'</div>';
            }
            else if(selectedText[0].slice(1,2)=='W'){
                text+='<div class="modal-footer">'
                    +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
                    +'<button type="button" class="btn btn-dark" onclick="deleteSchedule()">삭제</button>'
                    +'<button type="button" class="btn btn-dark" onclick="modifyWalkIn('+selectedText[0].slice(3,index)+')">수정</button>'
                    +'<button type="button" class="btn btn-dark" onclick="MakeModalData3('+table_number+time_number+')">기록</button>'
                    +'</div>';
            }
        }
        list.html(text);//누를때마다 #DataModify의 값을 완전 새로 갈아치움
    }

    function MakeModalData4(){
        var list = $('#WaitingData');
        var text='';
        // alert('id:'+id);
        var date = <%=date%>;

        text+='날짜<input type="date" class="form-control" id="waitingDate" name="new_date" value="'+date+'" placeholder="Date" readonly>';

        //이름
        text+= '이름<input type="text" class="form-control" id="waitingName" name="new_name" value="'+""+'">';

        //인원수
        text += '인원수<select id="waitingCovers" class="form-control"><option value="1">1명</option>';
        for(var i=2;i<6;i++){
            text+='<option value="'+i+'">'+i+'명</option>';
        }
        text+='</select>';
        text+='<div class="modal-footer">'
            +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
            +'<button type="button" class="btn btn-dark" onclick="MakeWaitingList()">추가하기</button>'
            +'</div>';
        list.html(text);//누를때마다 #DataModify의 값을 완전 새로 갈아치움
    }

    function MakeModalData3(id){ //id = #테이블번호+타임
        var id2="#"+id;
        // var newID = '"'+id+'"';
        var list = $('#DataModify');
        var text='';
        // alert('id:'+id);
        var date = <%=date%>;
        var time_number=id2.slice(2,4);
        var table_number=id2.slice(1,2);
        //체온
        // text+= '<button type="button" class="btn btn-dark" onclick="addCovidLog()">인원 추가</button>'
        text+= ''
            +'날짜<input type="date" class="form-control" id="covid_date" name="covid_date" value="'+date+'" placeholder="Date" readonly>'
            +'시간<input type="text" class="form-control" id="covid_time" name="covid_time" value="'+time_number+'" placeholder="Date" readonly>'
            +'테이블번호<input type="text" class="form-control" id="covid_table" name="covid_table" value="'+table_number+'" placeholder="Date" readonly>'
            +'이름<input type="text" class="form-control" id="covid_name" name="covid_name" value="">'
            +'주소<input type="text" class="form-control" id="covid_address" name="covid_address" value="">'
            +'연락처<input type="text" class="form-control" id="covid_phoneNumber" name="covid_phoneNumber" value="">'
            +'증상 있음<input id="covid_symptom" name="covid_symptom" type="radio" class="pay-form-input" checked="" required="" value="yes">'
            +'증상 없음<input id="covid_symptom" name="covid_symptom" type="radio" class="pay-form-input" required="" value="no">'
            +'체온<input type="text" class="form-control" id="covid_temperature" name="covid_temperature" value="">';
        //footer
        text+='<div class="modal-footer">'
            +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
            +'<button type="button" class="btn btn-dark" onclick="addCovidLog()">저장</button>'
            +'</div>';
        list.html(text);
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
                text+='<td><button style="text-overflow:ellipsis; overflow:hidden; width:100px; height: 80px" id='+newI+j+' type="button" class="btn btn-outline-dark btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" onclick="scheduleClicked('+newI+j+')">-</button></td>'
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
                        // alert(i);
                        text+=i+""+j;
                        document.getElementById(eval("'"+text+"'")).innerText="[R-"+reservationData.oid+"] "+reservationData.customer_id;
                        document.getElementById(eval("'"+text+"'")).classList.remove('btn-outline-dark');
                        if(reservationData.arrivalTime==null){
                            document.getElementById(eval("'"+text+"'")).classList.add('btn-secondary');
                        }
                        else {
                            document.getElementById(eval("'"+text+"'")).classList.add('btn-dark');
                        }

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
                        document.getElementById(eval("'"+text+"'")).innerText="[W-"+walkInData.oid+"] "+walkInData.covers+"명";
                        document.getElementById(eval("'"+text+"'")).classList.remove('btn-outline-dark');
                        document.getElementById(eval("'"+text+"'")).classList.add('btn-dark');
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
                action : '<button class="btn btn-dark" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" onclick="MakeModalData5('+i+')">손님 배정</button>'
            });
        }
        // alert(rows);
        return rows;
    }

    function MakeModalData5(i){
        var list = $('#DataModify');
        var text='';
        text +='시간<select id="waitingListTime" class="form-control"><option value="10">시간을 선택해주세요</option>'
        for(var t=openingTime;t<closingTime;t++){
            text+='<option value="'+t+'">'+t+':00</option>';
        }
        text +='</select>';
        //footer
        text+='<div class="modal-footer">'
            +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
            +'<button type="button" class="btn btn-dark" onclick="addWaitingListToWalkIn('+i+')">배정</button>'
            +'</div>';
        list.html(text);
    }


    function addWaitingListToWalkIn(i){
        var waitingList = <%=WaitingList%>
        var waiting=waitingList[i];
        let today=new Date();
        var time=$('#waitingListTime').val();
        var data =waiting.covers+"-/-/-"+waiting.date+"-/-/-"+waiting.name+"-/-/-"+time;
        var check=
            swal({
                title : "배정 하시겠습니까?",
                icon : 'info',
                button : '확인'
            }).then(function (){
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
                                swal({
                                    title : "현재 만석입니다.",
                                    icon : 'error',
                                    button : '확인'
                                });
                            }
                            else {
                                swal({
                                    title : '현장 예약이 정상적으로 요청되었습니다.',
                                    icon : 'success',
                                    button : '확인'
                                }).then(function (){
                                    location.href = 'customerManager.do?date='+<%=date%>;
                                });
                            }
                        }
                    })
                }
            });
    }
    function addReservation(i){
        var orderList = <%=NewOrderList%>
        var order=orderList[i];
        var data = order.covers+"-/-/-"+order.date+"-/-/-"+order.time+"-/-/-"+order.customer_id+"-/-/-"+order.customer_name;
        var check=
            swal({
                title : "배정 하시겠습니까?",
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "addReservation",
                            data: data
                        },
                        success: function (oid) {
                            swal({
                                title : '요청 성공!',
                                text : "[예약번호:"+oid+"]의 현장 예약이 정상적으로 요청되었습니다.",
                                icon : 'success',
                                button : '확인'
                            }).then(function (){
                                location.href = 'customerManager.do?date='+<%=date%>;
                            });
                        }
                    })
                }

            });
    }
    function MakeWalkIn() {
        var date = document.getElementById('walkInDate1').value;
        var time = document.getElementById('walkInDate2').value;
        var cover = document.getElementById('walkInCovers').value;
        var table = document.getElementById('walkInTable').value;
        var data = date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+table;
        var check =
            swal({
                title : "배정 하시겠습니까?",
                icon : 'info',
                button : '확인'
            }).then(function (){
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
                                swal({
                                    title : "이미 입석한 손님이 존재합니다.",
                                    icon : 'error',
                                    button : '확인'
                                });
                            }
                                // else if(oid=="-2"){
                                //     var check = confirm("현재 만섭입니다. 대기리스트에 등록하시겠습니까?");
                                //     if(check)
                                //         MakeWaitingList(check);
                            // }
                            else {
                                swal({
                                    title : '요청 성공!',
                                    text : "[예약번호:" + oid + "]의 현장 예약이 정상적으로 요청되었습니다.",
                                    icon : 'success',
                                    button : '확인'
                                }).then(function (){
                                    location.href = 'customerManager.do?date='+<%=date%>;
                                });
                            }
                        }
                    })
                }
            });
    }
    function  MakeWaitingList(){
        var date = document.getElementById('waitingDate').value;
        var cover = document.getElementById('waitingCovers').value;
        var name = document.getElementById('waitingName').value;
        var data=date+"-/-/-"+cover+"-/-/-"+name;
        var check =
            swal({
                title : "대기리스트에 등록하시겠습니까?",
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "makeWaitingList",
                            data: data
                        },
                        success: function (oid) {
                            swal({
                                title : '요청 성공!',
                                text : "[예약번호:" + oid + "]의 대기리스트 등록이 정상적으로 요청되었습니다.",
                                icon : 'success',
                                button: '확인'
                            }).then(function ()
                            {
                                location.href = 'customerManager.do?date='+<%=date%>;
                            });
                        }
                    })
                }
            });
    }
    function deleteSchedule(){
        var date = document.getElementById('modifyDate').value;
        var time = document.getElementById('modifyTime').value;
        var table = document.getElementById('modifyTable').value;
        var data=date+"-/-/-"+time+"-/-/-"+table;
        var check=
            swal({
                title : "삭제하시겠습니까?",
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "deleteSchedule",
                            data: data
                        },
                        success: function (oid) {
                            swal({
                                title : '일정이 삭제되었습니다.',
                                icon : 'success',
                                button: '확인'
                            }).then(function ()
                            {
                                location.href = 'customerManager.do?date='+<%=date%>;
                            });
                        }
                    })
                }
            });
    }
    function  modifyReservation(oid){
        var date = document.getElementById('modifyDate').value;
        var time = document.getElementById('modifyTime').value;
        var cover = document.getElementById('modifyCovers').value;
        var table = document.getElementById('modifyTable').value;
        //var name = document.getElementById('modifyName').value;
        var data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+table+"-/-/-"+oid;
        var check =
            swal({
                title : "수정하시겠습니까?",
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "modifyReservation",
                            data: data
                        },
                        success: function (oid) {
                            if(oid=="-1") {
                                swal({
                                    title: '이미 예약이 되어있습니다.',
                                    icon: 'error',
                                    button: '확인'
                                }).then(function () {
                                    location.href = 'customerManager.do?date=' + date;
                                });
                            }
                            else {
                                swal({
                                    title: '예약이 수정되었습니다.',
                                    icon: 'success',
                                    button: '확인'
                                }).then(function () {
                                    location.href = 'customerManager.do?date=' + date;
                                });
                            }
                        }
                    })
                }

            });
    }
    function  modifyWalkIn(oid){
        var date = document.getElementById('modifyDate').value;
        var time = document.getElementById('modifyTime').value;
        var cover = document.getElementById('modifyCovers').value;
        var table = document.getElementById('modifyTable').value;
        //var name = document.getElementById('modifyName').value;
        var data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+table+"-/-/-"+oid;
        var check =
            swal({
                title : "수정 하시겠습니까?",
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "modifyWalkIn",
                            data: data
                        },
                        success: function (oid) {
                            if(oid=="-1") {
                                swal({
                                    title: '이미 예약이 되어있습니다.',
                                    icon: 'error',
                                    button: '확인'
                                }).then(function () {
                                    location.href = 'customerManager.do?date=' + date;
                                });
                            }
                            else {
                                swal({
                                    title: '예약이 수정되었습니다.',
                                    icon: 'success',
                                    button: '확인'
                                }).then(function () {
                                    location.href = 'customerManager.do?date=' + date;
                                });
                            }
                        }
                    })
                }
            });
    }

    function reload(){
        var date=$('#reservationDate').val();
        if(date!=''){
            location.href = 'customerManager.do?date='+date;
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

    function recordArrival(id){
        var id2="#"+id;
        var date = <%=date%>;
        var time_number=id2.slice(2,4);
        var table_number=id2.slice(1,2);
        var data=date+"-/-/-"+time_number+"-/-/-"+table_number;
        var check =
            swal({
                title : "도착했나요?",
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "recordArrival",
                            data: data
                        },
                        success: function (oid) {
                            swal({
                                title : '도착 처리했습니다.',
                                icon : 'success',
                                button: '확인'
                            }).then(function ()
                            {
                                location.href = 'customerManager.do?date='+date;
                            });
                        }
                    })
                }
            });
    }

    function addCovidLog(){
        var date=$('#covid_date').val();
        var time_num =$('#covid_time').val();
        var table_num =$('#covid_table').val();
        var name =$('#covid_name').val();
        var address =$('#covid_address').val();
        var phoneNumber =$('#covid_phoneNumber').val();
        var symptom =$('#covid_symptom').val();
        var temperature=$('#covid_temperature').val();
        var data=date+"-/-/-"+time_num+"-/-/-"+table_num+"-/-/-"+name+"-/-/-"+address+"-/-/-"+phoneNumber+"-/-/-"+symptom+"-/-/-"+temperature;
        var check =
            swal({
                title : "코로나 관련 정보 입력이 되셨나요?",
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "addCovidLog",
                            data: data
                        },
                        success: function (oid) {
                            swal({
                                title : '코로나 관련 기록을 저장했습니다.',
                                icon : 'success',
                                button: '확인'
                            }).then(function ()
                            {
                                location.href = 'customerManager.do?date='+date;
                            });
                        }
                    })
                }

            });
    }

</script>
</html>