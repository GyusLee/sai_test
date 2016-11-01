<%@page import="java.util.List"%>
<%@page import="com.sai.model.domain.Board"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	List<Board> list = (List) request.getAttribute("list");
%>
<!DOCTYPE>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 100%;
    background-color: #FFEBE4;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

#left {
	height: 1000px;
	border: 1px solid #e7e7e7;
}

#right {
	height: 1000px;
	border: 1px solid #e7e7e7;
}

#center {
	height: 1000px;
	border: 1px solid #e7e7e7;
}

#badge1 {
	margin-top: 5px;
}
</style>
<script>
	function openNav() {
		document.getElementById("mySidenav").style.width = "25%";
		document.getElementById("mySidenav").style.left = "75%";
		document.getElementById("main").style.marginRight = "0%";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("mySidenav").style.left = "100%";
		document.getElementById("main").style.marginRight = "0";
	}

	function regist() {
		alert("버튼눌렀어?");
		form1.action = "/main/write.do";
		form1.submit();
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid" id="top">

			<!-- 숨겨진 우측 네비게이션 -->
			<div class="navbar-header" id="topNav">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#here" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- 로고 및 프로젝트 명 -->
				<a class="navbar-brand" href="#">WWW.SAI.CO.KR</a>
			</div>

			<div class="collapse navbar-collapse" id="here">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" onclick="openNav()">표시 1</a></li>
					<li><a href="#">표시 2</a></li>
					<li><a href="#">표시 3</a></li>

					<!-- 알림 목록 -->
					<!--  <li><button class="btn btn-danger" type="button" id="badge1">
                  Messages <span class="badge">12</span>
               </button></li>-->
					<!-- NickName 및 Icon Image-->
					<li><button type="button" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							NickName
						</button></li>
					<!-- 드랍 박스 -->

					<li class="dropdown" id="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">Dropdown <span
							class="caret"></span></a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a href="#">메뉴1</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">메뉴2</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">메뉴3</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">메뉴4</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-2" id="left">
				<!-- 상위 카테고리 -->
				<br>
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true">
						상위카테고리 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a href="#">항목1</a></li>
						<li><a href="#">항목2</a></li>
						<li><a href="#">항목3</a></li>
						<li><a href="#">항목4</a></li>
					</ul>
				</div>
				<!-- 하위 카테고리 -->
				<br> <br> <br> <br>
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true">
						하위카테고리 <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<li><a href="#">항목1</a></li>
						<li><a href="#">항목2</a></li>
						<li><a href="#">항목3</a></li>
						<li><a href="#">항목4</a></li>
					</ul>
				</div>

			</div>
			<div class="col-md-7" id="center">

				<!-- 찾기 -->
				<br>
				<div class="row">
					<div class="col-lg-7">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search" aria-hidden="true"
										style="font-size: 20px"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-lg-6">
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="true">
								시/도 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
								<li><a href="#">서울</a></li>
								<li><a href="#">인천</a></li>
								<li><a href="#">대전</a></li>
								<li><a href="#">대구</a></li>
								<li><a href="#">부산</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- sns창 -->
			<div class="col-md-3" id="right">
				<form name="form1" method="post">
					<div id="mySidenav" class="sidenav">
						<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
						<div id="write" width=100%>
							<div id="top">
								<img src="/images/default.png" id="profile" width="50px">&nbsp<strong>NickName</strong>
							</div>
							<br>
							<div id="center">
								<textarea name="content" class="form-control" rows="7"
									id="comment" placeholder="우리들의 핫 플레이스.."></textarea>
							</div>
							<br>
							<div id="bottom" align="right">
								<img src="/images/comment.png" width="30px"> <img
									src="/images/cam.png" width="30px"> <img
									src="/images/movie.png" width="30px">
								<button type="button" class="btn btn-primary" onClick="regist()">post</button>
							</div>
						</div>
					</div>
				</form>
				<br>
				<%
					for (int i = 0; i < 6; i++) {
				%>
				<!-- list 나오는 부분  -->
				<div style="border: solid 1px #D3D2E0"></div>
				<br>
				<div id="list_div">
					<div id="list_top">
						<img src="/images/default.png" id="profile" width="30px">&nbsp<strong>NickName</strong>
					</div>
					<br>
					<div id="list_content"></div>
					<br>
					<div id="list_bottom">
						<textarea name="content" class="form-control" rows="2"
							id="comment" placeholder="comment...">
								</textarea>
					</div>
					<br>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>

</body>
</html>