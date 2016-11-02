<%@page import="com.sai.model.domain.Couple"%>
<%@page import="com.sai.model.domain.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.sai.model.domain.Board"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	Couple couple = (Couple) session.getAttribute("couple");
	Member member = (Member) session.getAttribute("member");
	List<Board> list = (List) request.getAttribute("list");
	int height = 1000;
	if (list.size() > 3) {
		height = list.size() * 350;
	}
%>
<!DOCTYPE>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
/* 모달 css */
.modal-header {
	background-color: #ffc4b2;
}

.modal-body {
	height: 230px;
}

body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 0;
	border-left:1px solid #e7e7e7;
	position: fixed;
	z-index: 10;
	top: 10%;
	left: 100%;
	background-color: white;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 0px;
	padding-left: 30px;
	padding-right: 30px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	padding-top: 0px;
	color: #818181;
	display: block;
	transition: 0.3s
}

.sidenav a:hover, .offcanvas a:focus {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	padding-top: 0px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	width:100%;
	transition: margin-left .5s;
	padding: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 0px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
#wraaper{
	width:100%;
	overflow:none;
	height:1000px;
}
#left {
	
	height:1000px;
	border: 1px solid #e7e7e7;
}

#right {
	
	height:1000px;
	border: 1px solid #e7e7e7;
	border-left:none;
}

#center {
	
	height:1000px;
	border: 1px solid #e7e7e7;
	border-right:none;
}

#badge1 {
	margin-top: 5px;
}

#listModalSetting {
	width: 75%;
	height: 800px;
}

#listModelContent {
	width: 100%;
	height: 800px;
}

#listModelBody {
	height: 600px;
}
#topWrapper{
	width: 100%;
	height: 50px;
	position: fixed;
	z-index: 999;
	background: rgba(255, 255, 255, 0.95);
	border: 1px solid #e7e7e7;
	border-top:none;
	top:0px;
}
#here{
	z-index: 888;
	background: rgba(255, 255, 255, 0.95);
		border: 1px solid #e7e7e7;
	border-top:none;
}
</style>
<script>
	function openNav() {
		document.getElementById("mySidenav").style.width = "25%";
		document.getElementById("mySidenav").style.left = "75%";
		document.getElementById("main").style.marginRight = "0";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("mySidenav").style.left = "100%";
		document.getElementById("main").style.marginRight = "0";
	}

	// file 함수 호출
	function getFile(){
		var myFile=document.getElementById("myFile");
		myFile.click();
	}
	
	// 글 업로드
	function regist() {
		alert("버튼눌렀어?");
		form1.encoding="multipart/form-data";
		form1.action = "/main/write.do";
		form1.submit();
	}
	
 	function show(board_id){
		//show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
		
		var jData = {"board_id" : board_id};
		
		$.ajax({
			contentType:'application/json;charset=UTF-8',
			dataType:'json',
			url:'/main/modal.do',
			type:'POST',
			data:JSON.stringify(jData),
			success:function(response){
				$("#timeline_top").html(response.email);
				$("#timeline_content").html(response.content);
				
				$("#listModal").modal('show');
				
			}
		});  
	}	 
	
	
</script>
</head>
<body>
	<nav class="navbar navbar-default" >
	<div id="topWrapper">
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
					<%
						if (member.getM_gender().equals("M")) {
					%>
					<li class="navbar-brand"><%=couple.getF_email()%>님과 연결 됨</li>
					<%
						} else {
					%>
					<li class="navbar-brand"><%=couple.getM_email()%>님과 연결 됨</li>
					<%
						}
					%>


					<!-- 알림 목록 -->
					<!--  <li><button class="btn btn-danger" type="button" id="badge1">
                  Messages <span class="badge">12</span>
               </button></li>-->
					<!-- NickName 및 Icon Image-->
					<li><button type="button" class="btn btn-primary btn-lg">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<%=member.getM_name()%>님의 SAI
						</button></li>
					<!-- 드랍 박스 -->

					<li class="dropdown" id="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">Dropdown <span
							class="caret"></span></a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a href="#" onclick="openNav()">list</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal">write</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">메뉴3</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">메뉴4</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container-fluid" id="wraaper">
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
			<div class="col-md-3" id="right">
				<!-- 글 List  -->
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<%
						Board board = list.get(i);
					%>
					<!-- list 나오는 부분  -->
					<div style="border: solid 1px #D3D2E0"></div>
					<br>
					<div id="list_div" data-target="#listModal">
						<div id="list_top">
							<img src="/images/default.png" id="profile" width="30px"
								role="button" onClick="show(<%=board.getBoard_id()%>)">&nbsp<strong
								role="button" onClick="show(<%=board.getBoard_id()%>)"><%=board.getM_email()%></strong>
				
							<button type="button" class="btn btn-default" style="border:none;">
								<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" style="font-size:12px;">11</span>
							</button>
							

						</div>
						<br>

						<div id="list_content" role="button"
							onClick="show(<%=board.getBoard_id()%>)">
							<%=board.getContent()%>
						</div>
						<br>
						<div id="list_bottom">
							<textarea name="content" class="form-control" rows="2"
								id="comment" placeholder="comment..."></textarea>
						</div>
						<br>
					</div>
					<%
						}
					%>
				</div>
				<!-- 글 List  끝-->
			</div>
		</div>
	</div>

	<!-- modal start -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<form name="form1" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<div class="row">
							<div class="col-sm-12">
								<img src="/images/default.png" id="profile" width="70px">&nbsp<strong><%=member.getM_name()%></strong>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<textarea class="form-control" rows="9" id="content"
								name="content" placeholder="우리들의 핫 플레이스.."></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<img src="/images/cam.png" width="40px" onClick="getFile()"> 
						<button type="button" class="btn btn-primary" onclick="regist()">post</button>
					</div>
					<input type="file" id="myFile" style="display:none" name="myFile">
				</div>
			</form>
		</div>
	</div>
	<!-- modal end -->


	<!--리스트 모달-->
	<div class="modal bs-example-modal-lg" id="listModal" role="dialog">
		<div class="modal-dialog" id="listModalSetting">
			<!-- 모달 내용-->
			<div class="modal-content" id="listModelContent">
				<div class="modal-header">

					<img src="/images/default.png" id="list_profile" width="50px">&nbsp<strong
						id="timeline_top"></strong>
					<button type="button" class="close" data-dismiss="modal"
						style="font-size: 30px">&times;</button>
					<br>
				</div>
				<div class="modal-body" id="listModelBody">
					<p id="timeline_content"></p>
				</div>
				<div class="modal-footer">
					<textarea name="content" class="form-control" rows="2" id="comment"
						placeholder="comment..."></textarea>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->


</body>
</html>