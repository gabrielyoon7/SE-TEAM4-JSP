<%--
  Created by IntelliJ IDEA.
  User: ssh10
  Date: 2021-05-12
  Time: 오후 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String menuList = (String) request.getAttribute("menuList");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Album example · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap" rel="stylesheet">


    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

    </style>

    <link href="css/heroes.css" rel="stylesheet">
</head>
<body>
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Check the menu</h1>
                <p style="font-family: 'Noto Serif KR', serif;" class="lead text-muted">아래의 다양한 메뉴들을 직접 확인하세요.</p>
            </div>
            <div>
                <a href="menu.do?type=all">메뉴 전체보기</a>
                <a href="menu.do?type=치킨">치킨</a>
                <a href="menu.do?type=피자">피자</a>
                <a href="menu.do?type=스테이크">스테이크</a>
                <a href="menu.do?type=파스타">파스타</a>
                <a href="menu.do?type=음료">음료</a>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="card">

            </div>
        </div>
    </div>

</main>

<%@include file="../common/footer.jsp" %>

<script src="js/bootstrap.bundle.min.js"></script>


</body>
<script>
    $(document).ready(function(){
        makeinfoAll();
    })
    function makeinfoAll(){
        var data = <%=menuList%>;
        var list = $('#card');
        var text = '';

        for(var i=0; i<data.length; i++){
            text+= ' <div class="col"><div class="card shadow-sm">'
                // +'<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>'
                +'<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="img/menu/'+data[i].imageURL+'" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/>'
                +'<text "x="50%" y="50%" fill="#eceeef" dy=".3em">['+data[i].type+']'+data[i].name+'</text>'
                +'<div class="card-body">'
                +'<p class="card-text">'+data[i].notice+'</p>'
                +'<div class="d-flex justify-content-between align-items-center">'
                +'<div class="btn-group">'
                +'<button type="button" class="btn btn-sm btn-outline-secondary" onclick="gotoMenuInfo('+data[i].oid+')">View</button>'
                +'<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button></div>'
                +'<small class="text-muted">'+data[i].price+' 원</small>'
                +'<small class="text-muted">조리시간 : '+data[i].cookingTime+'분</small>'
                +'</div></div></div></div>';
        }
        list.append(text);
    }
    function gotoMenuInfo(oid){
        location.href='menuInfo.do?oid='+oid;
    }
</script>
</html>