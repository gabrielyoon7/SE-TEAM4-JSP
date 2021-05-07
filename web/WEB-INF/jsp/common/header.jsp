<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String user =  (String)session.getAttribute("user");
%>
<style>
	h1 {
		display: inline-block;
		vertical-align: middle;
		color: white;
		margin: 0.5rem;
		padding: 0;
	}

	nav {
		display: inline-block;
		vertical-align: middle;
	}

	ul {
		list-style: none;
		margin: 0;
		padding: 0;
		display: flex;
	}

	li.icon {
		flex-basis: 25%;
	}

	header {
		background: cadetblue;
		padding: 20px;
	}

	a {
		display: block;
		text-align: center;
		margin: .25rem;
		padding: .5rem 1rem;
		text-decoration: none;
		font-weight: bold;
		color: white;
		background: teal;
	}

	a:hover {
		background: yellowgreen;
	}

	html {
		box-sizing: border-box;
	}

	*, *:before, *:after {
		box-sizing: inherit;
	}
</style>

<header>
	<h1><a href="main.do">Team4 Restaurant</a></h1>
	<nav>
		<ul>
			<li id="login"></li>
		</ul>
	</nav>
	<nav id="main-navigation">
		<div class="pull-left">
			<ul class="outer-menu">
				<li class="outer-menu-item">
                    <span class="menu-title">
                        <a href="test.do">BRAND</a>
                    </span>
				</li>
				<li class="outer-menu-item">
                    <span class="menu-title">
                        <a href="test.do">MENU</a>
                    </span>
				</li>
				<li class="outer-menu-item">
                    <span class="menu-title">
                        <a href="test.do">RESERVATION</a>
                    </span>
				</li>
				<li class="outer-menu-item">
                    <span class="menu-title">
                        <a href="test.do">PACKING</a>
                    </span>
				</li>
			</ul>
		</div>
	</nav>
	<br>여기는 헤더가 출력될 위치입니다. <br>
	----------------------------여기 위로는 헤더에서 출력됨-----------------------------------
</header>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		loginInfo();
	})
	function loginInfo(){
		var user = <%=user%>;
		var list = $('#login');
		var a = '';
		if (user==null){//미로그인 상태
			a+= '<a href="loginPage.do">로그인</a>';
		}
		else {//로그인 상태
			a+='안녕하세요 '+user.name+'님! <a href="logout.do">로그아웃</a>';
		}
		list.append(a);
	}
</script>