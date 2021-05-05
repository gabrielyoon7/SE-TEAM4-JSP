<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-05
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String getSomething = (String) request.getAttribute("getSomething");
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
<div id="testDataPrinter"></div>
-------------------------<br>
</body>
<script>
    $(document).ready(function(){
        makeinfo1();
    })

    function makeinfo1(){
        var data = <%=getSomething%>;
        var list = $('#testDataPrinter');
        var text = '';
        text+= '<div>'+'oid : '+data[0].oid+'/ name : '+data[0].name+'/ phoneNumber : '+data[0].phoneNumber+'</div>';

        list.append(text);
    }
</script>
</html>