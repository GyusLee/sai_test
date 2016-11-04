<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ���̹� Api -->
<script type="text/javascript"
	src="../javascript/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<!-- īī��Api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
	var naver_id_login;
	window.addEventListener("load", function() {
		init();
	});
	function init() {

		naver_id_login = new naver_id_login("pqNlMHIsCEOCGmed5SSe",
				"http://localhost:9090/main/regist.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3, 50);
		naver_id_login.setDomain(".service.com");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
	}
</script>
<style>
#jumbotron_color {
	background: #FFC4B2;
	border: none;
}

#jubotron_btn:hover {
	border: 1px solid #FFA389;
	background: #FFA389;
}

#jubotron_btn {
	border: 1px solid #FFACA6;
	background: #FFACA6;
}

#panel_main {
	border: 1px solid #FFC4B2;
	background: #FFC4B2;
}

#accordion {
	border: 1px solid #FFC4B2;
	background: #FFC4B2;
}

#collapseOne {
	border: 0px;
	background: #FFC4B2;
}

#jumbotron_con {
	border: 0px;
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
</style>
</head>
<body>
	<nav class="navbar navbar-default">
	<div id="topWrapper">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">����(SAI)</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<form class="navbar-form navbar-left">
						<button type="submit" class="btn btn-default">ȸ������</button>
						<button type="button" class="btn btn-default"
							data-target="#login_modal" data-toggle="modal">�α���</button>
					</form>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</div>
	<!-- /.container-fluid --> </nav>

	<div class="jumbotron" id="jumbotron_color">
		<div class="container" id="jumbotron_con">
			<h1 style="color: #FFEBE4; font-weight: bold;">����(4SAI2)</h1>
			<h2 style="color: #FFEBE4;">���ΰ� �Բ� ���ο� ����Ʈ �ڽ��� ���� ������.</h2>
			<br>

			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default" id="panel_main">
					<p>
						<a class="btn btn-primary btn-lg" id="jubotron_btn"
							href="#collapseOne" role="button" data-toggle="collapse"
							aria-controls="collapseOne">Learn more</a>
					</p>
					<div id="collapseOne" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingOne" aria-expanded="true">
						<div class="panel-body">
							<h3 style="color: #FFEBE4;">�� ���α׷��� ��Ƽķ�۽� IoT ������ �缺 ����, ������
								��� �� ���� ������Ʈ �Դϴ�.</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>







	<div class="row-fluid">
		<div class="col-xs-6 col-md-4">
			<div class="thumbnail">
				<img src="/images/img3.jpg" alt="...">
				<div class="caption">
					<h3>�츮�鸸�� �߾�</h3>
					<p>���ΰ��� ������ �߾��� ����� �����ϼ���.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-4">
			<div class="thumbnail">
				<img src="/images/img1.jpg" alt="...">
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Donec id elit non mi porta gravida at eget metus. Nullam id dolor
						id nibh ultricies vehicula ut id elit.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-4">
			<div class="thumbnail">
				<img src="/images/img4.jpg" alt="...">
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
						Donec id elit non mi porta gravida at eget metus. Nullam id dolor
						id nibh ultricies vehicula ut id elit.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>
			</div>
		</div>
	</div>






	<!-- ��� -->
	<div class="modal fade" id="login_modal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title ">�α���</h4>
				</div>
				<div class="modal-body" text-align= "center">
					<p  class="center">
						<!-- ���̹����̵�ηα��� ��ư ���� ���� -->
					<div id="naver_id_login"></div>
					</p>
					

				</div>
				<div class="modal-footer">
					<h6 class="text-info">���̴� ���̹� �α��θ��� �����մϴ�.<br> Only Login With NAVER</h6>
					<!-- <button type="submit" class="btn btn-default " data-dismiss="modal">�ݱ�</button> -->
				</div>
			</div>
		</div>
	</div>
	</div>


</body>
</html>