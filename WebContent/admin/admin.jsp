<%@page import="com.sai.model.domain.MasterCate"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	List<MasterCate> masterCateList=(List)request.getAttribute("masterCateList");
	out.print("마스터 카테고리 사이즈는 ? ="+masterCateList.size());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
</head>
<body>
   <nav class="navbar navbar-default" >
   <div class="container-fluid" id="top">

      <!-- 숨겨진 우측 네비게이션 -->
      <div class="navbar-header"  id="topNav">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#here" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <!-- 로고 및 프로젝트 명 -->
         <a class="navbar-brand" href="#">관리페이지</a>
      </div>

      <div class="collapse navbar-collapse" id="here">
         <ul class="nav navbar-nav navbar-right">
            <li><a href="#">표시 1</a></li>
            <li><a href="#">표시 2</a></li>
            <li><a href="#">표시 3</a></li>

            <!-- 알림 목록 -->
             <!--  <li><button class="btn btn-danger" type="button" id="badge1">
                  Messages <span class="badge">12</span>
               </button></li>-->
            <!-- NickName 및 Icon Image-->
            <li><button type="button" class="btn btn-primary btn-lg">
                  <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                  	관리자
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
   <!-- /.container-fluid --> </nav>
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
         <div class="col-md-1" id="right"></div>
      </div>
   </div>

</body>
</html>