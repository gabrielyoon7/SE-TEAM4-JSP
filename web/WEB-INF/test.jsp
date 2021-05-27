<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-05
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String getSomethingAll = (String) request.getAttribute("getSomething0");
    String getSomething = (String) request.getAttribute("getSomething1");
%>
<%
    String user =  (String)session.getAttribute("user");
%>
<!doctype html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="'viewport" content="width-device-width", initial-scale="1">
    <title>TEST PAGE</title>
    <link href='../css/bootstrap.css' rel='stylesheet' type='text/css'>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <link href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css" rel="stylesheet">

    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
</head>
<body>
<div id="toolbar">
    <button id="button" class="btn btn-secondary">getData</button>
</div>
<table
        id="table"
        data-toggle="table"
        data-toolbar="#toolbar"
        data-height="460"
        data-side-pagination="server"
        data-pagination="true"
        data-url="https://examples.wenzhixin.net.cn/examples/bootstrap_table/data">
    <thead>
    <tr>
        <th data-field="id">ID</th>
        <th data-field="name">Item Name</th>
        <th data-field="price">Item Price</th>
    </tr>
    </thead>
</table>
web/WEB-INF/test.jsp<br>
테스트용 페이지.<br>
--------DB연동 TEST-----------------<br>
** 리스트 전체를 불러오기*
<div id="testDataPrinter0"></div>

** oid==1인 리스트 전체를 불러오기*
<div id="testDataPrinter1"></div>

** oid==1인 회원의 전화번호 db 수정하기*
<div id="info"> </div>
<button onclick="updateTestInfo()" type="button">수정하기</button>
-------------------------<br>
----------------------로그인 테스트----------------------<br>
<div id="loginTestMessage"></div>
</body>
<script>
    var $table = $('#table')
    var $button = $('#button')

    $(function() {
        $button.click(function () {
            alert(JSON.stringify($table.bootstrapTable('getData')))
        })
    })
</script>
<script>
    $(document).ready(function(){
        makeinfoAll();
        makeinfo1();
        makeModifyinfo1();
        loginTest();
    })

    function makeinfoAll(){
        var data = <%=getSomethingAll%>;
        var list = $('#testDataPrinter0');
        var text = '';
        for(var i=0; i<data.length; i++){
            text+= '<div>'+'oid : '+data[i].oid+'/ name : '+data[i].name+'/ phoneNumber : '+data[i].phoneNumber+'</div>';
        }
        list.append(text);
    }

    function makeinfo1(){
        var data = <%=getSomething%>;
        var list = $('#testDataPrinter1');
        var text = '';
        text+= '<div>'+'oid : '+data[0].oid+'/ name : '+data[0].name+'/ phoneNumber : '+data[0].phoneNumber+'</div>';
        list.append(text);
    }

    function makeModifyinfo1(){
        var data = <%=getSomething%>;
        var list = $('#info');
        var a = '';
        a+= 'oid: <input type="text" name="oid" id="oid" value="' + data[0].oid+ '"readonly/>'
            + 'name: <input type="text" name="name" id="name" value="' + data[0].name+ '">'
            +'phoneNumber: <input type="text" name="phoneNumber" id="phoneNumber" placeholder="' + data[0].phoneNumber+'">'
        list.append(a);
    }

    function updateTestInfo(){
        var oid=$('#oid').val();
        var name=$('#name').val();
        var phoneNumber=$('#phoneNumber').val();

        var data = oid+'-/-/-'+name+"-/-/-"+phoneNumber;
        var check = confirm("회원 정보를 수정하시겠습니까?");
        if(check) {
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "updateTestInfo",
                    data: data
                },
                success: function (data) {
                    alert("db가 변경 되었습니다");
                    location.reload();
                }
            })
        }
    }
    function loginTest(){
        var user = <%=user%>;
        var list =$('#loginTestMessage');
        var a='';
        if(user==null){
            a+='로그인이 되지 않았습니다.';
        }
        else{
            a+='- oid : '+user.oid+'<br>'
                +'- id : '+user.id+'<br>'
                +'- password : '+user.password+'<br>'
                +'- type : '+user.type+'<br>'
                +'- name : '+user.name+'<br>'
                +'- birthDay : '+user.birthDay+'<br>'
                +'- phoneNumber : '+user.phoneNumber+'<br>'
                +'- blackList : '+user.blackList+'<br>'
            ;

        }
        list.append(a);
    }

</script>
</html>