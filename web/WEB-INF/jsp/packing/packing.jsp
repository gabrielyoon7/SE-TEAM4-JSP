<%--
  Created by IntelliJ IDEA.
  User: dnwnd
  Date: 2021-05-13
  Time: 오후 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String menuList = (String) request.getAttribute("menuList");
%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.83.1">
  <title>Album example · Bootstrap v5.0</title>

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
    .clicked {
      background-color: #2a6496;
      color: white;
    }

    .bottom_bar{
      background: black;
      position: fixed;
      left: 0; right: 0; bottom: 0;
      height: 50px;
      text-align: center;
    }

    .bottom_bar>button{
    }

  </style>

</head>


<body>
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>


<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Choose the menu</h1>
        <p style="font-family: 'Noto Serif KR', serif;" class="lead text-muted">원하는 메뉴를 골라 장바구니에 추가한 뒤, 하단의 주문하기를 누르세요.</p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="card">
      </div>
    </div>
  </div>
  <form></form>
  <div class="bottom_bar">
    <button class="w-25 btn-light btn-lg" style="font-family: 'Noto Serif KR', serif;" onclick="orderClicked()">주문하기</button>
  </div>

</main>

<script src="js/bootstrap.bundle.min.js"></script>

<%@include file="../common/footer.jsp" %>
</body>

<script>
  $(document).ready(function(){
    makeinfoAll();
  })
  var data = <%=menuList%>;
  function makeinfoAll(){
    var list = $('#card');
    var text = '';

    for(var i=0; i<data.length; i++){
      text+= ' <div class="col"><div class="card shadow-sm">'
              +'<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="img/menu/'+data[i].imageURL+'" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/>'
              +'<text x="50%" y="50%" fill="#eceeef" dy=".3em">['+data[i].type+']'+data[i].name+'</text>'
              //+'<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>'
              +'<div class="card-body">'
              +'<p class="card-text">'+data[i].name+'</p>'
              +'<p class="card-text">'+data[i].notice+'</p>'
              +'<div class="d-flex justify-content-between align-items-center">'
              +'<small class="text-muted">'+data[i].price+'원</small>'
              +'<div class="btn-group">'
              // +'<button type="button" class="btn btn-sm btn-outline-secondary" id="menu'+i+'" onclick=basketClicked('+i+')>장바구니에 추가</button></div>'
              +'<button type="button" class="" id="menu'+i+'" onclick=basketClicked('+i+')>장바구니에 추가</button></div>'
              +'</div></div></div></div>';
    }
    list.append(text);
  }

  function orderClicked() {
    location.href = 'basket.do?carts='+selectedMenu;

  }

  let selectedMenu = new Array();

  function basketClicked(i){
    var id="#menu"+i;
    if($(id).hasClass("clicked")){
      const index = selectedMenu.indexOf(data[i].name);
      selectedMenu.splice(index, 1);
      $(id).removeClass("clicked");
    }
    else {
      $(id).addClass("clicked")
      selectedMenu.push(data[i].name);
    }
    console.log(selectedMenu);
  }


</script>


</html>
