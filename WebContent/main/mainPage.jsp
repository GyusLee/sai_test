<%@page import="com.sai.model.spring.dao.MemberDAO"%>
<%@page import="com.sai.model.domain.SubCate"%>
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
	List<String> memberList=(List)request.getAttribute("memberList");
	
	int height = 1000;
	if (list.size() > 3) {
		height = list.size() * 350;
	}

%>
<!-- 지도 관련 -->
<%
	List<SubCate> subCateList = (List)session.getAttribute("subCateList");
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
<script src="js/naverLogin_implicit-1.0.2-min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
/* 프로필 */
#modalBodyProfile{
	height: 200px;

}

/* 모달 css */
.modal-header {
	background-color: #ffc4b2;
}
.myProfileModal{
	width:20%;
}
.modal-body {
	height: 230px;
}

body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	top: 70px;
	width: 0;
	border-left: 1px solid #e7e7e7;
	position: fixed;
	z-index: 10;
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

#mySidenav {
	top: 70px;
	border-top: 1px solid #e7e7e7;
	height: 800px;
}

#main {
	width: 100%;
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

#wraaper {
	width: 100%;
	overflow: none;
	height: 1000px;
}

#left {
	height: 1000px;
	border: 1px solid #e7e7e7;
}

#right {
	height: 1000px;
	border: 1px solid #e7e7e7;
	border-left: none;
}

#center {
	height: 1000px;
	border: 1px solid #e7e7e7;
	border-right: none;
}

#badge1 {
	margin-top: 5px;
}

#listModalSetting {
	width: 85%;
	height: 800px;
}

#listModelContent {
	width: 100%;
	height: 800px;
}

#listModelBody {
	height: 600px;
}

#topWrapper {
	width: 100%;
	height: 50px;
	position: fixed;
	z-index: 999;
	background: rgba(255, 255, 255, 0.95);
	border: 1px solid #e7e7e7;
	border-top: none;
	top: 0px;
}

#here {
	z-index: 888;
	background: rgba(255, 255, 255, 0.95);
	border: 1px solid #e7e7e7;
	border-top: none;
}

/* 이미지 크기 css */
.thumbnail-wrappper {
	width: 25%;
}

.thumbnail {
	position: relative;
	padding-top: 50%; /* 1:1 ratio */
	overflow: hidden;
}

.thumbnail .centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-transform: translate(50%, 50%);
	-ms-transform: translate(50%, 50%);
	transform: translate(50%, 50%);
}

.thumbnail .centered img {
	position: absolute;
	top: 0;
	left: 0;
	max-width: 100%;
	height: auto;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

/* 프리뷰 이미지 크기 css */
.thumbnail-wrappper2 {
	width: 25%;
}

.thumbnail2 {
	position: relative;
	padding-top: 68%; /* 1:1 ratio */
	overflow: hidden;
}

.thumbnail2 .centered2 {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-transform: translate(50%, 50%);
	-ms-transform: translate(50%, 50%);
	transform: translate(50%, 50%);
}

.thumbnail2 .centered2 img {
	position: absolute;
	top: 0;
	left: 0;
	max-width: 100%;
	height: auto;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

#modalCon {
	width: 30%;
	height: 400px;
	text-overflow: ellipsis;
	border: 1px solid #BAF2E8;
}

#modalCon2 {
	margin-top: 5px;
	padding-top: 20px;
	width: 30%;
	height: 230px;
	text-overflow: ellipsis;
	border: 1px solid #BAF2E8;
}

#modal_thumbnail {
	padding-top: 75%;
}
.allReply{
	padding-top:5px;
}

/*  지도 관련  */
#map {
	width: 100%;
	height: 600px;
	border: 1px solid #e7e7e7;
}


#courseArea {
	width: 100%;
	border: 1px solid #e7e7e7;
}

/* writeModal */
#writeModalHeader{
	height: 100px;
	background-color: #BAF2E8;
}
#writeModalBody{
	height: 270px;
}
</style>
<script>
var openFlag;
var d1;
var temp;
var myFile;
var comment_txt;
var myProfile;
window.addEventListener("load", function(){
	openFlag=0;
	myFile=document.getElementById("myFile");
	myProfile=document.getElementById("myProfile");
	comment_txt=document.getElementById("comment");

	var x=document.getElementById("x");
	$('#myFile').change(function(){
		x.innerHTML=$('#myFile').val().substring($('#myFile').val().lastIndexOf("\\")+1,$('#myFile').val().length);
	});
	
/* 	comment_txt.addEventListener("keydown", function(){
		var key=event.keyCode;
		if(key==13){
			alert("엔터키 눌렀어?");
			registComment();
		}
	}); */
})
	function openNav() {
		
		if(openFlag==0){
	 	$("#mySidenav").animate({
	 		left:"75%"
	 		,width:"25%"
	 		},"fast");	
	 	
	 	$("#left").hide(300);
	 			
	 	

		openFlag=1;
		
	 	
		/* document.getElementById("left").style.right="10%";
		document.getElementById("center").style.right="10%";
		document.getElementById("right").style.right="10%";
		document.getElementById("mySidenav").style.width = "25%";
		document.getElementById("mySidenav").style.left = "75%"; */
		document.getElementById("main").style.marginRight ="none";

		}
	}

	function closeNav() {
	 	
		if(openFlag==1){

		$("#left").show(300);

	 	$("#mySidenav").animate({left:"100%",width:"0px"},"fast");	
	 	
	 	openFlag=0;
		/* document.getElementById("left").style.right="0";
		document.getElementById("center").style.right="0";
		document.getElementById("right").style.right="0";
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("mySidenav").style.left = "100%";*/
		document.getElementById("main").style.marginRight = "none";
		
		}
	}

	// file 함수 호출
	function getFile(){
		myFile.click();
		getFileName();
	}
	
	// 글 업로드
	function regist() {
		alert("버튼눌렀어?");
		form1.encoding="multipart/form-data";
		form1.action = "/main/write.do";
		form1.submit();
	}
	
	// 프사 미리보기
	function previewImg(){
	      var oFReader = new FileReader();
	      oFReader.readAsDataURL(document.getElementById("myProfile").files[0]);

	      oFReader.onload = function (oFREvent) {
	          document.getElementById("preImg").src = oFREvent.target.result;
	      };
	}
	
	// 프로필 사진 바꾸기!!
	function changeProfile(){
		myProfile.click();
	}
	
	// 사진 등록
	function registProfile(){
		form3.encoding="multipart/form-data";
		form3.action = "/main/writePic.do";
		form3.submit();
	}
	// 댓글 업로드
	function registReply(){
		alert("엔터키 눌렀어?");
	}
	
 	function show(board_id){
		//show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
		var modal_img=document.getElementById("modal_img");
		var modal_txt=document.getElementById("modal_txt");
		var jData = {"board_id" : board_id};
		while (modal_txt.hasChildNodes()) {   
			modal_txt.removeChild(modal_txt.firstChild);
		}
		while (modal_img.hasChildNodes()) {   
			modal_img.removeChild(modal_img.firstChild);
		}
		$.ajax({
			contentType:'application/json;charset=UTF-8',
			dataType:'json',
			url:'/main/modal.do',
			type:'POST',
			async   : false,
			data:JSON.stringify(jData),
			success:function(response){
				var jason=JSON.stringify(response);
				var jasonParcing=JSON.parse(jason);
				

				var list_profile=document.getElementById("list_profile");
				if(jasonParcing.myImg!=null)
					list_profile.src="/data/"+jasonParcing.myImg;
				
				var img=document.createElement("img");
				img.style.maxWidth="100%";
				img.style.height="auto";
				img.src="/data/"+jasonParcing.img;
				modal_img.appendChild(img);
				$("#timeline_top").html(jasonParcing.name+" ( "+ response.email+" ) ");
				/* document.getElementById("createSpan").style.fontFamily="'Roboto', sans-serif;"; */
				$("#timeline_content").html(response.content);
				$("#modal_like").html(" "+jasonParcing.likesNumber+"명이 좋아합니다.");
				for(var i=0;i<jasonParcing.listName.length;i++){
					
					var name=jasonParcing.listName[i].m_name;
					var myImg=jasonParcing.listName[i].img;
					var content=jasonParcing.rList[i].content;
					var span=document.createElement("span");
					var span2=document.createElement("span");
					var div=document.createElement("div");
					var img=document.createElement("img");
					if(myImg==null){
						img.src="/images/default.png";
					}else{
						img.src="/data/"+myImg;
					}
					img.style.width="30px";
					img.style.height="30px";
					span2.innerText="  ";
					span.className="label label-default";
					span.innerText=" "+name+"  ";
					span.style.fontSize="12px";
					span.appendChild=img;
					span.style.background="#BAF2E8";
					span.style.fontWeight="bold";
					modal_txt.appendChild(img);
					modal_txt.appendChild(span2);
					modal_txt.appendChild(span);
					div.style.fontSize="12px";
					div.className="allReply";
					//div.style.paddingTop="5px";
					div.innerText=content;
					
					modal_txt.appendChild(div);
					 
				}
				$("#listModal").modal('show');

			
			}
		});  

	}
 	$(document).ready(function(){
 		
 		<%if(list.size()>0){%>
 		<%for(int i=0;i<list.size();i++){%>
 	
 		var m_email="<%=member.getM_email()%>";
 		
 		var board_id="<%=list.get(i).getBoard_id()%>";
		
 		var iData = {"board_id" : board_id,"m_email":m_email};

		$.ajax({
			contentType:'application/json;charset=UTF-8',
			dataType:'json',
			url:'/main/initLikes.do',
			type:'POST',
			async   : false,
			data:JSON.stringify(iData),
			success:function(response){
				
				if(response.result==1){
					//있다.
					$("#likes"+board_id).css("color","#FFACA6");
					$("#likes"+board_id).css("font-size","14px");
					$("#likes"+board_id).css("font-weight","bold");
				}else if(response.result==0){
					//없다.	
					$("#likes"+board_id).css("color","#333");
					$("#likes"+board_id).css("font-size","12px");
					$("#likes"+board_id).css("font-weight","normal");
				}
				if(response.maxNum!=0)
					$("#likes"+board_id).html(response.maxNum);
			}
		});
		var rData={"board_id" : board_id};
		
		$.ajax({
			contentType:'application/json;charset=UTF-8',
			dataType:'json',
			url:'/main/getReply.do',
			type:'POST',
			async   : false,
			data:JSON.stringify(rData),
			success:function(response){	
				var json=JSON.stringify(response);
				var json2=JSON.parse(json);	
					
					for(var i=0;i<json2.name.length;i++){
						var name=json2.name[i];
						var content=json2.rList[i].content;
						var list_content=document.getElementById("list_content"+board_id);
						var div=document.createElement("div");
						div.style.fontSize="10px"
						div.innerText="[ "+name+" ] : "+content;
						list_content.appendChild(div);
						document.getElementById("comment"+board_id).value=""; 
					}
				}

			});

		
		
		<%}%>
		<%}%>
 		
 	})
 	
 	
 	function likeChk(board_id){
		//show 호출시 넘겨준 값을 이용하여 ajax 등을 통해 modal 을 띄울때 동적으로 바뀌어야 하는 값을 얻어온다.  
		
		var m_email="<%=member.getM_email()%>";
		var jData = {"board_id" : board_id,"m_email":m_email};
		
		$.ajax({
			contentType:'application/json;charset=UTF-8',
			dataType:'json',
			url:'/main/isLikes.do',
			type:'POST',
			data:JSON.stringify(jData),
			success:function(response){
				
				if(response.result==1){
					//있다.
					$("#likes"+board_id).css("color","#FFACA6");
					$("#likes"+board_id).css("font-size","14px");
					$("#likes"+board_id).css("font-weight","bold");
				}else if(response.result==0){
					//없다.
					$("#likes"+board_id).css("color","#333");
					$("#likes"+board_id).css("font-size","12px");
					$("#likes"+board_id).css("font-weight","normal");
				}
				if(response.maxNum!=0)
					$("#likes"+board_id).html(response.maxNum);
				else
					$("#likes"+board_id).html("");
			}
		});  

	}
	function getFileName(){
		var path=document.getElementById("myFile").value;
		var x=path.lastIndexOf("\\");
		console.log(path);
		var fileName=path.substring(x, path.length);
		console.log(fileName);
	}
	function registComment(board_id){
		var key=event.keyCode;
		if(key==13){
			//alert(document.getElementById("comment"+board_id).value);
			var jData = {"board_id" : board_id,"m_email":"<%=member.getM_email()%>","content":document.getElementById("comment"+board_id).value};
			$.ajax({
				contentType:'application/json;charset=UTF-8',
				dataType:'json',
				url:'/main/reWrite.do',
				type:'POST',
				data:JSON.stringify(jData),
				success:function(response){
					
					var list_content=document.getElementById("list_content"+board_id);
					var div=document.createElement("div");
					div.style.fontSize="10px";
					div.innerText="[ <%=member.getM_name()%> ] : 	"+document.getElementById("comment"+board_id).value;
					list_content.appendChild(div);
					document.getElementById("comment"+board_id).value="";
				}
			}); 
		}
	}
	
	//로그아웃
	 function logout() {
		  window.location.href="http://nid.naver.com/nidlogin.logout";
	}	

					
</script>
</head>
<body>
	<nav class="navbar navbar-default">
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

					<img src="/images/sai.png" width="20%"><a
						class="navbar-brand" href="#">www.sai.co.kr</a>

				</div>

				<div class="collapse navbar-collapse" id="here">

					<ul class="nav navbar-nav navbar-right">

						<% if(member.getIsAdmin()!=0){%>

						<li><a href="/admin/member.do">회원관리</a></li>
						<li><a href="/admin/boardList.do">게시물관리</a></li>
						<li><a href="/admin/index.do">지도관리</a></li>
						<%}else{%>

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
						<%} %>


						<!-- 알림 목록 -->
						<!--  <li><button class="btn btn-danger" type="button" id="badge1">
                  Messages <span class="badge">12</span>
               </button></li>-->
						<!-- NickName 및 Icon Image-->

						<li><img src=<%if(member.getImg()==null){%>
							"/images/default.png"
						<%}else{%>
							<%="/data/"+member.getImg() %> <%} %> id="profile" width="40px"
							height="40px">&nbsp
							<button type="button" class="btn btn-primary btn-lg"
								style="font-size: 14px">
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								<%=member.getM_name()%>님의 sai
							</button></li>
						<!-- 드랍 박스 -->

						<li class="dropdown" id="dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">메뉴 <span
								class="caret"></span></a>
							<ul class="dropdown-menu" id="dropdown-menu">
								<li><a href="#" data-toggle="modal"
									data-target="#myProfileModal">프로필</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#" onClick="openNav()">뉴스피드</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#" data-toggle="modal" data-target="#myModal">글쓰기</a></li>
								<li role="separator" class="divider" role="button"></li>
								<li><a href="#" onClick="logout()">로그아웃</a></li>
							</ul></li>
					</ul>
					<!-- /.navbar-collapse -->
				</div>
			</div>
			<!-- /.container-fluid -->
	</nav>
	<div class="container-fluid" id="wraaper">
		<div class="row-fluid">
			
			
			<!-- 카트가 들어가는 Left -->
			<div class="col-md-2" id="left" style="width:23%">
				<div class="container" style="width:100%">
				  <h3>데이트 코스</h3>
				  <ul id="cartList" class="nav nav-pills nav-stacked" style="width:100%">
				    
				  </ul>
				  <div class="modal fade" id="myModalDate" role="dialog">
				    <div class="modal-dialog modal-sm" style="width : 30%">
				      <div class="modal-content" id="showDateCourseDetail">
				        
				      </div>
				    </div>
				  </div>
				</div>
			</div>

			<!-- 지도를 포함한 center  -->
			<div class="col-md-9" id="center">
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
				<div class="row">
					<!-- 상위 카테고리 -->
					<br>
					<div class="col-lg-10">
						<div class="dropdown" style="width: 20%; float: left;">
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
						<div class="dropdown" style="width: 20%; float: left;">
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

						<div class="dropdown" style="width: 20%; float: left;">
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
					<div class="row"></div>
					<br>
				</div>

				<!-- 지도 추가  -->
				<div id="map"></div>
				<div class="container" id="courseArea">
					<h2>내가 만든 데이트 코스</h2>
					<div id="showDateCourse"></div>
				</div>
				<div>
					<button align="right" type="button" class="btn btn-danger" onClick="addCart()">장바구니 담기</button>
				</div>
				
				
			</div>


			<div class="col-md-1" id="right">
				<!-- 글 List  -->
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onClick="closeNav()">&times;</a>

					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<%
						Board board = list.get(i);
					%>
					<!-- list 나오는 부분  -->
					<br>
					<div id="list_div" data-target="#listModal">
						<div id="list_top">
							<div id="time<%=i%>" style="font-size: 11px;"></div>
							<script>
							d1=new Date();
							if(d1.getFullYear()==<%=board.getRegdate().split("-")[0]%>){
								if(d1.getMonth()+1==<%=board.getRegdate().split("-")[1]%>){
									if(d1.getDate()==<%=board.getRegdate().substring(9, 11)%>)
									{
										if(d1.getHours()==<%=board.getRegdate().substring(11, 13)%>){
											temp=d1.getMinutes()-<%=board.getRegdate().substring(14, 16)%>;
											document.getElementById("time<%=i%>").innerHTML=temp+"분 전에 게시";
										}else{
											temp=d1.getHours()-<%=board.getRegdate().substring(11, 13)%>;
											document.getElementById("time<%=i%>").innerHTML=temp+"시간 전에 게시";
										}
									}else{
										temp=d1.getDate()-<%=board.getRegdate().substring(9, 11)%>;
										document.getElementById("time<%=i%>").innerHTML=temp+"일 전에 게시";
									}
								}else{
									temp=d1.getMonth()+1-<%=board.getRegdate().split("-")[1]%>;
									document.getElementById("time<%=i%>").innerHTML=temp+"월 전에 게시";
								}
							}else{
								temp=d1.getFullYear()-<%=board.getRegdate().split("-")[0]%>;
								document.getElementById("time<%=i%>").innerHTML=temp+"년 전에 게시";
							}
							
							</script>

							<img src=<%if(memberList.get(i)==null){%>
								"/images/default.png"<%}else{%> <%=memberList.get(i) %> <%} %>
								id="profile" width="30px" height="30px" role="button"
								onClick="show(<%=board.getBoard_id()%>)">&nbsp<strong
								role="button" onClick="show(<%=board.getBoard_id()%>)"><%=board.getM_email()%></strong>

							<!-- 좋아요 버튼 -->

							<button type="button" class="btn btn-default"
								style="border: none;"
								onClick="likeChk(<%=board.getBoard_id()%>)">
								<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"
									style="font-size: 12px;" id="likes<%=board.getBoard_id()%>"></span>
							</button>

							<!-- 좋아요 버튼 종료 -->


						</div>
						<br>

						<!-- 댓글 폼태그 시작 -->
						<form name="form<%=board.getBoard_id() %>" method="post">
							<div id="list_content<%=board.getBoard_id() %>" role="button"
								onClick="show(<%=board.getBoard_id()%>)">
								<div class="thumbnail-wrapper">
									<div class="thumbnail" id="modal_thumbnail">
										<div class="centered">
											<img src="/data/<%=board.getImg()%>" width="80%"
												height="auto">
										</div>
									</div>
								</div>

								<%=board.getContent()%><br> <br>
								<div style="border-top: solid 1px #D3D2E0"></div>
								<br>
							</div>
							<br>
							<div id="list_bottom">

								<textarea name=content class="form-control" rows="2"
									id="comment<%=board.getBoard_id()%>" placeholder="comment..."
									onKeyDown="registComment(<%=board.getBoard_id()%>)"></textarea>
							</div>
						</form>
						<!-- 댓글 폼태그 끝 -->
					</div>
					<%
				}
			%>
				</div>
				<!-- 글 List  끝-->
			</div>
		</div>

	</div>

	<!-- 	 	<script type="text/javascript">
		// Add contents for max height
		$(document).ready(function () {
		$(mySidenav).scroll(function() {
		maxHeight = $(mySidenav).height();
		
		currentScroll = $(mySidenav).scrollTop()- $(mySidenav).height();
		console.log(currentScroll);
		if (maxHeight <= currentScroll) {
			alert("이상!!");
		}
		})
		});
		</script>  -->

	<!-- modal start -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<form name="form1" method="post">
				<div class="modal-content" id="writeModalContent">
					<div class="modal-header" id="writeModalHeader">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<div class="row">
							<div class="col-sm-12">
								<img src=<%if(member.getImg()==null){%>
									"/images/default.png"<%}else{ %>"/data/<%=member.getImg() %>"<%} %>
									id="profile" width="50px" style="vertical-align:text-bottom">&nbsp&nbsp<strong style="font-family:나눔고딕; color:black"><%=member.getM_name()%></strong>
							</div>
						</div>
					</div>
					<div class="modal-body" id="writeModalBody">
						<div class="form-group">
							<font face="Roboto', sans-serif ">CONTENT</font>
							<br>
							<br>
							<textarea class="form-control" rows="9" id="content"
								name="content" placeholder="우리들이 핫플레이스~"></textarea>
						</div>
					</div>
					<div class="modal-footer" id="writeModalFooter">
						<span id="x"></span> <img src="/images/cam.png" width="40px"
							onClick="getFile()">
						<button type="button" class="btn btn-primary" onclick="regist()" style="font-family:나눔고딕">등록</button>
					</div>
					<input type="file" id="myFile" size:"50" name="myFile"
						style="display: none">
				</div>
			</form>
		</div>
	</div>
	<!-- modal end -->


	<!-- 프로필 사진 업로드 모달 시작-->
	<div class="modal fade" id="myProfileModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<form name="form3" method="post">
				<div class="modal-content" id="modalProfileContent">
					<div class="modal-header" id="modalProfileContentHeader" style="background: #BAF2E8;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<font face="나눔고딕" color="black">아래의 사진을 클릭하세요</font>
					</div>
					<div class="modal-body" id="modalBodyProfile">
						<div class="form-group">
							<div class="thumbnail-wrapper2">
								<div class="thumbnail2">
									<div class="centered2">
										<span id="x"></span><%if(member.getImg()==null){ %>
										<img id="preImg" src="/images/default.png" onClick="changeProfile()">
										<%}else{ %>
										<img id="preImg" src="/data/<%=member.getImg() %>" onClick="changeProfile()">
										<%} %>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="registProfile()">등록</button>
					</div>
					<input type="file" id="myProfile" size:"50" name="myProfile"
						style="display: none" onChange="previewImg()">
				</div>
			</form>
		</div>
	</div>
	<!-- 프로필 사진 업로드 모달 끝 -->

	<!--리스트 모달-->
	<div class="modal bs-example-modal-lg" id="listModal" role="dialog">
		<div class="modal-dialog" id="listModalSetting">
			<!-- 모달 내용-->
			<div class="modal-content" id="listModelContent">
				<div class="modal-header" style="background: #BAF2E8;">

					<img src="/images/default.png" id="list_profile"
						style="width: 100px; height: auto; padding-left: 30px; padding-right: 15px;">&nbsp<strong
						id="timeline_top"
						style="font-size: 20px; color: rgba(255, 255, 255, 1);"></strong>

					<button type="button" class="close" data-dismiss="modal"
						style="font-size: 30px">&times;</button>
					<br>
				</div>
				<div class="modal-body" id="listModelBody">

					<div class="row">
						<div class="col-sm-8">

							<div class="thumbnail-wrapper" >
								<div class="thumbnail" style="height: 635px; border-color:#BAF2E8;">
									<div class="centered">
										<div id="modal_img"></div>

									</div>
								</div>
							</div>
						</div>
						<div class="col-md-3" id="modalCon">
							<h4
								style="font-family: 'Roboto', sans-serif; border-bottom: 1px solid #e7e7e7; padding-bottom: 10px;">
								CONTENTS<br>
							</h4>
							<button type="button" class="btn btn-default"
								style="border: none; padding-left: 0px;">
								<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"
									style="font-size: 15px;" id="modal_like"> </span>
							</button>
							<p id="timeline_content" style="padding-top: 10px;"></p>
						</div>
						<div class="col-md-3" id="modalCon2">
							<div id="modal_txt" style="font-size:12px;"></div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- modal end -->
</body>













<!--***********************************************************************************************  -->
<!--여긴 지도 관련 script입니다.  -->

<script>
	
	var map;
	
	var neighborhoods = [
	  <%for (int i = 0; i < subCateList.size(); i++) {%>
	  {lat: <%=subCateList.get(i).getLati()%>, lng: <%=subCateList.get(i).getLng()%>},
	  <%}%>
	];
	
	var markers = [];
	var contentString=[];
	var infowindow=[];
	
	var images=[];
	var makeDateCourseFirst=true;
	
  <%for (int i = 0; i < subCateList.size(); i++) {%>
	  
		if((1<=<%=subCateList.get(i).getT_id()%>)&&(<%=subCateList.get(i).getT_id()%><=3)){
			images[<%=i%>]="/images/food.png";
		}else if((4<=<%=subCateList.get(i).getT_id()%>)&&(<%=subCateList.get(i).getT_id()%><=5)){				
			images[<%=i%>]="/images/cafe.png";
		}else if((6<=<%=subCateList.get(i).getT_id()%>)&&(<%=subCateList.get(i).getT_id()%><=9)){
			images[<%=i%>]="/images/play.png";
		}
	
		  contentString[<%=i%>]='<div id="content">'+
	    '<div id="siteNotice">'+
	    '</div>'+
	    '<h2 id="firstHeading" class="firstHeading"><%=subCateList.get(i).getName()%></h2>'+
	    '<div id="bodyContent">'+
	    '주소 : <%=subCateList.get(i).getSido()%> <%=subCateList.get(i).getGugun()%> <%=subCateList.get(i).getDong()%>'+
	    '<%=subCateList.get(i).getAddress_detail()%>'+'<br>'+
	    '<%=subCateList.get(i).getTel()%>'+'<br>'+
	    '<%=subCateList.get(i).getPic()%>'+'<br>'+
	    '<img src="/data/<%=subCateList.get(i).getPic()%>">'+'<br>'+
	    '<button id="makeCourse" onclick=\'makeCourse(<%=i%>,<%=subCateList.get(i).getS_id()%>,<%String s_name='"'+subCateList.get(i).getName()+'"';%><%=s_name%>)\'>데이트 코스로 지정하기</button>'+
	    '</div>'+
	    '</div>';
 	<%}%>  
	
	function initMap() {
		
	
	  var myLatLng = {lat: 37.497594, lng: 127.038105};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: myLatLng
	  });
	  
	  <%for (int i = 0; i < subCateList.size(); i++) {%>
		  infowindow[<%=i%>] = new google.maps.InfoWindow({
		    content: contentString[<%=i%>]
		  });
	  		
		  markers[<%=i%>]=new google.maps.Marker({
		    position: {lat: <%=subCateList.get(i).getLati()%>, lng: <%=subCateList.get(i).getLng()%>},
		    map: map,
		    title: 'Hello World!',
		    icon: images[<%=i%>]
		  });
		  
		  markers[<%=i%>].addListener('click', function() {
			    infowindow[<%=i%>].open(map, markers[<%=i%>]);
		  });
		  
	  <%}%>
	}

	//화면에 보여지는 모든 마커 지우기
	function clearMarkers() {
	  for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(null);//마커도 초기화
	  }
	  markers = [];//배열정보도 초기화
	}

	function makeCourse(i,placeId,subCateName){
		var courseName;
		if(makeDateCourseFirst==true){
			alert("데이트 코스를 만드시겠습니까?");
			
			images[i]="/images/select.png"; //데이트 코스로 지정되어 이미지를 바꿔줌.
			
			//데이트 코스의 이름을 만들어 보자.
			courseName=prompt("데이트 코스의 이름을 정해주세요","예) 100일 기념 데이트 코스");
			
			//이 이름 값을 넘겨 데이트 코스를 하나 만들자.
			createDateCourse(courseName,placeId,subCateName);
			initMap();
		}else{
			alert("데이트 코스를 추가하시겠습니까?");
			images[i]="/images/select.png"; //데이트 코스로 지정되어 이미지를 바꿔줌.
			
			//이 이름 값을 넘겨 데이트 코스를 하나 만들자.
			createDateCourse(courseName,placeId,subCateName);
			initMap();
		}
	}
	
	var showDateCourse=document.getElementById("showDateCourse");
	//데이트 코스 만들기 함수
	function createDateCourse(courseName,placeId,subCateName){
		//아작스 방식으로 데이터를 요청하자.
		var xhttp=getHttp();
		
		 xhttp.onreadystatechange=function(){
			 if(xhttp.readyState==4&&xhttp.status==200){
				var data=xhttp.responseText;
				
				showDateCourse.innerHTML+=data;
				
			 }
		 }

		 xhttp.open("get","/main/insertDateCourse.do?name="+courseName+"&s_id="+placeId+"&subCateName="+subCateName+"&makeDateCourseFirst="+makeDateCourseFirst,"true");
		 xhttp.send();
		 
		 makeDateCourseFirst=false;
	}
	
	var cartList = document.getElementById("cartList");
	
	
	function addCart(){
		
		var xhttp=getHttp();
		var course_id=document.getElementById("course_id").value;
		var couple_id=<%=couple.getCouple_id()%>;
		
		 xhttp.onreadystatechange=function(){
			 if(xhttp.readyState==4&&xhttp.status==200){
				 var data=xhttp.responseText;
					cartList.innerHTML += data;
			 }
		 }

		 xhttp.open("get","/main/insertCart.do?course_id="+course_id+"&couple_id="+couple_id,true);
		 xhttp.send();
		
	}
	
	var showDateCourseDetail = document.getElementById("showDateCourseDetail");
	//장바구니를 선택했을떄..색깔 변화 밑 코스 디테일과 업체 정보를 불러오자.
	function showCourse(courseId){
		//selectedItem.className="active";
		//비동기 방식으로 값을 가져오자...
		var xhttp=getHttp();
		
		xhttp.onreadystatechange=function(){
			 if(xhttp.readyState==4&&xhttp.status==200){
				 var data=xhttp.responseText;
					showDateCourseDetail.innerHTML += data;
			 }
		 }
		
		 xhttp.open("get","/main/selectCourseAndSid.do?course_id="+courseId,"true");
		 xhttp.send();
	}
	
	 // 비동기 방식으로 가져오자
	function getHttp() {
		var xhttp; //비동기 요청을 처리하는 핵심 객체!!
		if (xhttp == undefined) {
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();//모든 브라우저 공통 방법
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xhttp;
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0RriAhjUWzjJL9AIANougGoQCUXNXzPE&signed_in=true&callback=initMap"></script>

</html>