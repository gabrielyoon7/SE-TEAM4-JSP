<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-05
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
//    System.out.println(pageContext.request.contextPath);
%>
<!doctype html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="'viewport" content="width-device-width", initial-scale="1">
    <link href='css/bootstrap.css' rel='stylesheet' type='text/css'>
    <title>TEAM4 : Booksys JSP</title>
</head>
<body>
<%@include file="../common/header.jsp" %>
web/WEB-INF/jsp/page/main.jsp<br>
    <article>
        <div class="slideshow-container">
            <div class="mySlides fade" style="text-align:center">
                <img src="img/img1.jpg" width="700" height="500">
                    <div class="text" style="text-align:center">
                    </div>
            </div>
            <div class="mySlides fade" style="text-align:center">
                <img src="img/img2.jpg" width="700" height="500">
                <div class="text">

                </div>
            </div>
            <div class="mySlides fade" style="text-align:center">
                <img src="img/img3.jpg" width="700" height="500">
                <div class="text">

                </div>
            </div>
            <div class="mySlides fade" style="text-align:center">
                <img src="img/img4.jpg" width="700" height="500">
                <div class="text">

                </div>
            </div>

        </div>
        <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
            <span class="dot" onclick="currentSlide(4)"></span>

        </div>
    </article>

    <script src="js/js1.js"></script>
    <link rel="stylesheet" href='css/css1.css'>

    <a href="test.do">Go To TestPage</a>
    <footer id="main-footer">
        <a href="#">Created by SE-TEAM4</a>
    </footer>
</body>
</html>