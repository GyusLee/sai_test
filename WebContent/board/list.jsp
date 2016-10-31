<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    left: 0;
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

</style>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "25%";
    document.getElementById("main").style.marginLeft = "25%";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}

function regist(){
	alert("버튼눌렀어?");
	form1.action="test.jsp";
	form1.submit();
}
</script>
     
<body>
<form name="form1" method="post">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 	<div id="write" width=100%>
 		<div id="top">
	 		<img src="/images/default.png" id="profile" width="50px">&nbsp<strong>NickName</strong>
 		</div>
 		<br>
 		<div id="center">
 			<textarea name="content" class="form-control" rows="7" id="comment"
								placeholder="우리들의 핫 플레이스.."></textarea>
 		</div>
 		<br>
 		<div id="bottom" align="right"> 
 			<img src="/images/comment.png" width="30px">
 			<img src="/images/cam.png" width="30px">
 			<img	src="/images/movie.png" width="30px">
			<button type="button" class="btn btn-primary" onClick="regist()">post</button>
 		</div>
 	</div>
</div>
</form>
<div id="main">
  <h2>Sidenav Push Example</h2>
  <p>Click on the element below to open the side navigation menu, and push this content to the right.</p>
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
</div>


</body>
</html>

