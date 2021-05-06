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
<!doctype html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="'viewport" content="width-device-width", initial-scale="1">
    <title>TEST PAGE</title>
    <link href='../css/bootstrap.css' rel='stylesheet' type='text/css'>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
</head>
<body>
web/WEB-INF/test.jsp<br>
테스트용 페이지.<br>
--------DB연동 TEST-----------------<br>
** 리스트 전체를 불러오기*
<div id="testDataPrinter0"></div>

** oid==1인 리스트 전체를 불러오기*
<div id="testDataPrinter1"></div>

**
-------------------------<br>
</body>
<script>
    $(document).ready(function(){
        makeinfoAll();
        makeinfo1();
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


</script>
</html>