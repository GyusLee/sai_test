<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
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
   height: 500px;
   border: 1px solid gray;
}

#right {
   height: 500px;
   border: 1px solid gray;
}

#center {
   height: 500px;
   border: 1px solid gray;
}

#badge1 {
   margin-top: 5px;
}
</style>
</head>
<body>
   <nav class="navbar navbar-default" >
   <div class="container-fluid" id="top">

      <!-- ������ ���� �׺���̼� -->
      <div class="navbar-header"  id="topNav">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#here" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <!-- �ΰ� �� ������Ʈ �� -->
         <a class="navbar-brand" href="#">WWW.SAI.CO.KR</a>
      </div>

      <div class="collapse navbar-collapse" id="here">
         <ul class="nav navbar-nav navbar-right">
            <li><a href="#">ǥ�� 1</a></li>
            <li><a href="#">ǥ�� 2</a></li>
            <li><a href="#">ǥ�� 3</a></li>

            <!-- �˸� ��� -->
            <!-- <li><button class="btn btn-danger" type="button" id="badge1">
                  Messages <span class="badge">12</span>
               </button></li>
            <!-- NickName �� Icon Image -->
            <li><button type="button" class="btn btn-default btn-lg">
                  <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                  NickName
               </button></li>
            <!-- ��� �ڽ� -->

            <li class="dropdown" id="dropdown"><a href="#"
               class="dropdown-toggle" data-toggle="dropdown" role="button"
               aria-haspopup="true" aria-expanded="false">Dropdown <span
                  class="caret"></span></a>
               <ul class="dropdown-menu" id="dropdown-menu">
                  <li><a href="#">�޴�1</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="#">�޴�2</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="#">�޴�3</a></li>
                  <li role="separator" class="divider"></li>
                  <li><a href="#">�޴�4</a></li>
               </ul></li>
         </ul>
      </div>
      <!-- /.navbar-collapse -->
   </div>
   <!-- /.container-fluid --> </nav>
   <div class="container-fluid">
      <div class="row-fluid">
         <div class="col-md-2" id="left">
            <!-- ���� ī�װ� -->
            <br>
            <div class="dropdown">
               <button class="btn btn-default dropdown-toggle" type="button"
                  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="true">
                  ����ī�װ� <span class="caret"></span>
               </button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                  <li><a href="#">�׸�1</a></li>
                  <li><a href="#">�׸�2</a></li>
                  <li><a href="#">�׸�3</a></li>
                  <li><a href="#">�׸�4</a></li>
               </ul>
            </div>
            <!-- ���� ī�װ� -->
            <br> <br> <br> <br>
            <div class="dropdown">
               <button class="btn btn-default dropdown-toggle" type="button"
                  id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="true">
                  ����ī�װ� <span class="caret"></span>
               </button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                  <li><a href="#">�׸�1</a></li>
                  <li><a href="#">�׸�2</a></li>
                  <li><a href="#">�׸�3</a></li>
                  <li><a href="#">�׸�4</a></li>
               </ul>
            </div>

         </div>
         <div class="col-md-8" id="center">

            <!-- ã�� -->
            <br>
            <div class="row">
               <div class="col-lg-6">
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
                        ��/�� <span class="caret"></span>
                     </button>
                     <ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
                        <li><a href="#">����</a></li>
                        <li><a href="#">��õ</a></li>
                        <li><a href="#">����</a></li>
                        <li><a href="#">�뱸</a></li>
                        <li><a href="#">�λ�</a></li>
                     </ul>
                  </div>

               </div>

            </div>

         </div>
         <div class="col-md-2" id="right"></div>
      </div>
   </div>

</body>
</html>