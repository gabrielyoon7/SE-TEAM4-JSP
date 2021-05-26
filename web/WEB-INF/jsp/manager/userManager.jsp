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
    String userList =  (String)request.getAttribute("userList");
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <link href='css/bootstrap-table.css' rel='stylesheet' type='text/css'>
    <link href='css/boardtable.css' rel='stylesheet' type='text/css'>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-table.js"></script>
    <script src="/js/bootstrap-table-cookie.js"></script>
    <script src="/js/bootstrap-table-export.min.js"></script>
<%--    <style>--%>
<%--        .bootstrap-table>.pull-right{--%>
<%--            display: none;--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<%@include file="../common/header.jsp" %>
<div>현재 테이블 띄우는거 오류 있습니다. 수정 예정!!</div>

<%--<table  class="boardtable" id="table" data-toggle="table" data-pagination="true" data-toolbar="#toolbar">--%>
<table class="boardtable" id="table" data-toggle="table"
       data-pagination="true" data-toolbar="#toolbar"
       data-search="true" data-side-pagination="true" data-click-to-select="true"
       data-page-list="[10]">
    <thead>
    <tr>
        <th data-field="action">설정</th>
        <th data-field="type" data-sortable="true">타입</th>
        <th data-field="name" data-sortable="true">이름</th>
        <th data-field="id" data-sortable="true">아이디</th>
        <th data-field="password" data-sortable="true">비밀번호</th>
        <th data-field="birthDay" data-sortable="true">생년월일</th>
        <th data-field="phoneNumber" data-sortable="true">연락처</th>
        <th data-field="blackList" data-sortable="true">블랙리스트</th>
    </tr>
    </thead>
<%--    <tbody id="TableData">--%>
<%--    </tbody>--%>
</table>
</body>
<script>
    $(document).ready(function(){
        // MakeTableData();
        callSetupTableView();
    })


    var userList=<%=userList%>;

    function callSetupTableView(){
        $('#table').bootstrapTable('load',data());
        // $('#table').bootstrapTable('append',data());
        $('#table').bootstrapTable('refresh');
    }

    function data(){
        var rows = [];
        for(var i=0;i<userList.length;i++){
            var user=userList[i];
            rows.push({
                type: user.type,
                name: user.name,
                id: user.id,
                password: user.password,
                birthDay: user.birthDay,
                phoneNumber: user.phoneNumber,
                blackList: user.blackList,
                action : '<button onclick="deleteUser('+i+')">삭제</button><button onclick="pwReset('+i+')">pw초기화</button><button onclick="changeType('+i+')">타입변경</button><button onclick="blackList('+i+')">블랙리스트 전환</button>'
            });
        }
        return rows;
    }

    // function MakeTableData(){
    //     var list = $('#TableData');
    //     var text = '';
    //     for(var i=0;i<userList.length;i++){
    //         var user=userList[i];
    //          text+='<tr>'
    //              + '<th><button onclick="deleteUser('+i+')">삭제</button><button onclick="pwReset('+i+')">pw초기화</button><button onclick="changeType('+i+')">타입변경</button><button onclick="blackList('+i+')">블랙리스트 전환</button></th>'
    //              + '<th>'+user.type+'</th>'
    //              + '<th>'+user.name+'</th>'
    //              + '<th>'+user.id+'</th>'
    //              + '<th>'+user.password+'</th>'
    //              + '<th>'+user.birthDay+'</th>'
    //              + '<th>'+user.phoneNumber+'</th>'
    //              + '<th>'+user.blackList+'</th>'
    //              +'</tr>';
    //     }
    //     list.append(text);
    // }
    function blackList(i){ //대상자에서 삭제
        var user =userList[i];
        var data = userList[i].id+"-/-/-"+userList[i].blackList;
        if(userList[i].blackList=='false'){
            var check = confirm(user.name+"["+user.id+"]님의 계정을 블랙리스트에 추가하시겠습니까?");
        }
        else{
            var check = confirm(user.name+"["+user.id+"]님의 계정을 블랙리스트에 삭제하시겠습니까?");
        }

        if(check){
            $.ajax({
                url : "ajax.do", //AjaxAction
                type : "post",
                data : {
                    req : "changeBlacklist",
                    data : data
                },
                success :function(blackList){
                    if(blackList=='true'){
                        alert("블랙리스트에 추가되었습니다.");
                        location.reload();
                    }
                    else{
                        alert("블랙리스트에서 삭제되었습니다.");
                        location.reload();
                    }

                }
            })
        }
    }
    function deleteUser(i){ //대상자에서 삭제
        var user =userList[i];
        var check = confirm(user.name+"["+user.id+"]님의 계정을 삭제 하시겠습니까? (취소 불가능)");
        if(check){
            $.ajax({
                url : "ajax.do", //AjaxAction
                type : "post",
                data : {
                    req : "deleteUser",
                    data : userList[i].id
                },
                success :function(data){
                    alert("삭제되었습니다.");
                    location.reload();
                }
            })
        }
    }
    function pwReset(i){
        var user =userList[i];
        var check = confirm(user.name+"["+user.id+"]님의 비밀번호를 0000으로 초기화 하시겠습니까? (취소 불가능)");
        if(check){
            $.ajax({
                url : "ajax.do", //AjaxAction
                type : "post",
                data : {
                    req : "pwReset",
                    data : userList[i].id
                },
                success :function(data){
                    alert("변경되었습니다.");
                    location.reload();
                }
            })
        }
    }
    function changeType(i){
        var user =userList[i];
        var check = confirm(user.name+"["+user.id+"]님의 Type을 변경하시겠습니까?");
        var data=userList[i].id+"-/-/-"+userList[i].type;
        if(check){
            $.ajax({
                url : "ajax.do", //AjaxAction
                type : "post",
                data : {
                    req : "typeChange",
                    data : data
                },
                success :function(data){
                    alert("변경되었습니다.");
                    location.reload();
                }
            })
        }
    }

</script>
<script src="js/bootstrap.bundle.min.js"></script>
</html>



