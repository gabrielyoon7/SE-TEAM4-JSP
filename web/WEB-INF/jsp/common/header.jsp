<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-09
  Time: 오전 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	/**[윤주현]
	 * session에서 user의 정보를 받아옵니다.
	 * user를 setAttribute하고 있는 곳은 src/com/se/team4/application/domain/AjaxAction 클래스의
	 * session.setAttribute("user", gson.toJson(HomeDAO.getInstance().getUserInfo(id))); 입니다.
	 * 로그인을 하지 않은 경우 user는 null입니다.
	 * 즉, 로그인 정보는 이 header.jsp가 include되는 어느 곳에서든 따라다니게 되므로 user 사용이 어디서나 가능하게 됩니다.
	 */
	String user =  (String)session.getAttribute("user");
%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.83.1">
	<title>TEAM4 Booksys</title>
	<script src="js/jquery-3.2.1.min.js"></script>
	<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">



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


	<!-- Custom styles for this template -->
	<link href="css/carousel.css" rel="stylesheet">
</head>
<header>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.do">Little4 Restaurant</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="brand.do">Brand</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="menu.do">Menu</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="reservation.do">Reservation</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="packing.do">Packing</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="test.do">TEST</a>
					</li>
					<li class="nav-item">
						<a class="nav-link disabled" href="test.do" tabindex="-1" aria-disabled="true">Disabled</a>
					</li>
				</ul>
				<div class="d-flex">
					<%--                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
					<div id="login"></div>
				</div>
			</div>
		</div>
	</nav>
</header>

<script>
	$(document).ready(function(){ //이 파일이 시작되면 자동으로 실행됩니다.
		loginInfo();
	})
	function loginInfo(){ //로그인 여부에 따라 버튼을 바꿔주는 역할
		var user = <%=user%>;
		var list = $('#login'); //위의 div id="login"에 집어넣습니다.
		var a = '';
		if (user==null){//미로그인 상태
			a+= '<button class="btn btn-outline-success" onclick="goToLoginPage()">LOGIN</button>';
		}
		else {//로그인 상태
			// alert(user.type+'의 접속');
			if(user.type=='관리자'){
				// a+='안녕하세요 '+user.name+'님! <button class="btn btn-outline-success" onclick="manager()">관리페이지</button> <button class="btn btn-outline-success" onclick="logout()">LOGOUT</button>';
				a+='안녕하세요 '+user.name+'님! '
						+'<div class="dropdown" style="display: inline-block"><button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">관리자 메뉴</button>'
						// +'<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">관리자 메뉴</button>'
				  +'<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">'
				  +'<li><a class="dropdown-item" href="userManager.do">사용자관리</a></li>'
				  +'<li><a class="dropdown-item" href="pickupManager.do">포장관리</a></li>'
				  +'<li><a class="dropdown-item" href="customerManager.do">고객관리</a></li>'
						+'</ul></div>'
						// +'</ul>'
				  +' <button class="btn btn-outline-success" onclick="logout()">LOGOUT</button>';
			}
			else{
				a+='안녕하세요 '+user.name+'님!  <button class="btn btn-outline-success" onclick="logout()">LOGOUT</button>';
			}
		}
		list.append(a);
	}
	function goToLoginPage(){ //버튼에 바로가기 키를 넣기 위한 조치. (버튼은 url 넣기가 불편합니다. 더 좋은 방법이 있으신분은 개선해주세요.)
		location.href='loginPage.do';
	}
	function logout(){ //버튼에 바로가기 키를 넣기 위한 조치
		location.href='logout.do';
	}
	function manager(){ //관리자 메뉴 진입
		location.href='userManager.do';
	}
</script>