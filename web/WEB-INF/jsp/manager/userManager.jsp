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
<table  class="boardtable" id="table" data-toggle="table" data-pagination="true" data-toolbar="#toolbar">
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
    <tbody id="TableData">
    </tbody>
</table>
</body>
<script>
    $(document).ready(function(){
        MakeTableData();
    })

    var userList=<%=userList%>;
    function MakeTableData(){
        var list = $('#TableData');
        var text = '';
        for(var i=0;i<userList.length;i++){
            var user=userList[i];
             text+='<tr>'
                 + '<th><button onclick="deleteUser('+i+')">삭제</button><button onclick="pwReset('+i+')">pw초기화</button><button onclick="changeType('+i+')">타입변경</button></th>'
                 + '<th>'+user.type+'</th>'
                 + '<th>'+user.name+'</th>'
                 + '<th>'+user.id+'</th>'
                 + '<th>'+user.password+'</th>'
                 + '<th>'+user.birthDay+'</th>'
                 + '<th>'+user.phoneNumber+'</th>'
                 + '<th>'+user.blackList+'</th>'
                 +'</tr>';
        }
        list.append(text);
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
</html>


