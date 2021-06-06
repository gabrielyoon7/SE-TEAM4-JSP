<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-11
  Time: 오전 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /**[윤주현]
     * 존재하는 user정보를 전부 받아와서 가공합니다.
     */
    String tableList =  (String)request.getAttribute("tableList");
    String covidLog =  (String)request.getAttribute("covidLog");
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Little4 Restaurant MANAGER</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href='css/bootstrap-table.css' rel='stylesheet' type='text/css'>
    <link href='css/boardtable.css' rel='stylesheet' type='text/css'>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<br>

<div id="container" class="py-5 row text-center" style="font-family: 'Noto Serif KR', serif;">

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel2">수정하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id = "DataModify"></div>
            </div>
        </div>
    </div>
    <div>
        <br>
        <br>

        <div>테이블 설정</div><button class="btn btn-outline-dark" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" onclick="makeAddModal()">추가</button>
        <table  class="boardtable" style="font-family: 'Noto Serif KR', serif;" id="table" data-toggle="table" data-pagination="true" data-toolbar="#toolbar" data-page-list="[10]" data-search="true" >
            <style>
                .pull-right ul{
                    display: none;
                }
            </style>
            <thead>
            <tr>
                <th data-field="action">설정</th>
                <th data-field="oid" data-sortable="true">oid</th>
                <th data-field="number" data-sortable="true">테이블 번호</th>
                <th data-field="places" data-sortable="true">위치</th>
                <th data-field="limits" data-sortable="true">인원제한</th>
            </tr>
            </thead>
        </table>
    </div>
    <div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div>코로나19 기록</div>
        <table  class="boardtable" style="font-family: 'Noto Serif KR', serif;" id="table1" data-toggle="table" data-pagination="true" data-toolbar="#toolbar" data-page-list="[10]" data-search="true">
            <style>
                .pull-right ul{
                    display: none;
                }
            </style>
            <thead>
            <tr>
                <th data-field="date" data-sortable="true">날짜</th>
                <th data-field="time_num" data-sortable="true">시간대</th>
                <th data-field="table_num" data-sortable="true">테이블</th>
                <th data-field="name" data-sortable="true">이름</th>
                <th data-field="address" data-sortable="true">주소</th>
                <th data-field="phoneNumber" data-sortable="true">연락처</th>
                <th data-field="symptom" data-sortable="true">증상여부</th>
                <th data-field="temperature" data-sortable="true">체온</th>
            </tr>
            </thead>
        </table>
    </div>

</div>


</body>
<script>
    $(document).ready(function(){
        callSetupTableView();
    })


    var tableList=<%=tableList%>;
    var covidLog=<%=covidLog%>;

    function callSetupTableView(){
        $('#table').bootstrapTable('load',data());
        $('#table').bootstrapTable('refresh');
        $('#table1').bootstrapTable('load',data1());
        $('#table1').bootstrapTable('refresh');
    }

    function data(){
        var rows = [];
        for(var i=0;i<tableList.length;i++){
            var table=tableList[i];
            rows.push({
                oid: table.oid,
                number: table.number,
                places: table.places,
                limits: table.limits,
                action : '<button class="btn btn-outline-dark" onclick="deleteTable('+i+')">삭제</button>' +
                    '<button class="btn btn-outline-dark" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2"  onclick="makeModifyModal('+i+')">수정</button>'
            });
        }
        return rows;
    }

    function data1(){
        var rows = [];
        for(var i=0;i<covidLog.length;i++){
            var covid=covidLog[i];
            rows.push({
                date: covid.date,
                time_num: covid.time_num,
                table_num: covid.table_num,
                name: covid.name,
                address: covid.address,
                phoneNumber: covid.phoneNumber,
                symptom: covid.symptom,
                temperature: covid.temperature
            });
        }
        return rows;
    }


    function deleteTable(i){
        var table=tableList[i];
        var data =table.number;
        var check=confirm("삭제 하시겠습니까?");
        if(check){
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "deleteTable",
                    data: data
                },
                success: function (oid) {
                    location.href = 'restaurantManager.do';
                }
            })
        }
    }

    function makeModifyModal(i){
        var table=tableList[i];
        var list = $('#DataModify');
        var text='';
        text+='oid<input type="text" class="form-control" id="oid" name="new_table" value="'+(table.oid)+'" placeholder="Date" readonly>';
        text+='테이블번호<input type="text" class="form-control" id="number" name="new_table" value="'+(table.number)+'" placeholder="">';
        text+='테이블위치<input type="text" class="form-control" id="places" name="new_table" value="'+(table.places)+'" placeholder="">';
        text+='테이블인원<input type="text" class="form-control" id="limits" name="new_table" value="'+(table.limits)+'" placeholder="">';


        text+='<div class="modal-footer">'
            +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
            +'<button type="button" class="btn btn-dark" onclick="modifyTable()">수정하기</button>'
            +'</div>';
        list.html(text);//누를때마다 #DataModify의 값을 완전 새로 갈아치움
    }
    function modifyTable(){
        var oid  = $('#oid').val();
        var number = $('#number').val();
        var places = $('#places').val();
        var limits = $('#limits').val();

        var data =oid+"-/-/-"+number+"-/-/-"+places+"-/-/-"+limits;
        var check=confirm("수정 하시겠습니까?");
        if(check){
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "modifyTable",
                    data: data
                },
                success: function (oid) {
                    location.href = 'restaurantManager.do';
                }
            })
        }
    }
    function makeAddModal(){
        var list = $('#DataModify');
        var text='';
        text+='테이블번호<input type="text" class="form-control" id="add_number" name="new_table" value="" placeholder="숫자만 입력">';
        text+='테이블위치<input type="text" class="form-control" id="add_places" name="new_table" value="" placeholder="숫자만 입력">';
        text+='테이블인원<input type="text" class="form-control" id="add_limits" name="new_table" value="" placeholder="숫자만 입력">';


        text+='<div class="modal-footer">'
            +'<button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>'
            +'<button type="button" class="btn btn-dark" onclick="addTable()">추가하기</button>'
            +'</div>';
        list.html(text);//누를때마다 #DataModify의 값을 완전 새로 갈아치움
    }
    function addTable(){
        var number = $('#add_number').val();
        var places = $('#add_places').val();
        var limits = $('#add_limits').val();

        var data =number+"-/-/-"+places+"-/-/-"+limits;
        var check=
            swal({
                title : '추가 하시겠습니까?',
                icon : 'info',
                button : '확인'
            }).then(function (){
                if(check){
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "addTable",
                            data: data
                        },
                        success: function (oid) {
                            location.href = 'restaurantManager.do';
                        }
                    })
                }
            });
    }
</script>
<script src="js/bootstrap.bundle.min.js"></script>
</html>



