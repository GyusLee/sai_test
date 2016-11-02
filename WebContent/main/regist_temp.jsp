<%@page import="com.sai.model.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<%
	//저장된 결과 꺼내보기 
	Member member = (Member) request.getAttribute("member");
%>
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


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
#jumbo {
	margin: auto;
	margin-top: 100px;
	width: 55%;
	height: 500px;
	background: #FFC4B2;
	border: none;
}

#span_heart {
	color: #FFEBE4;
	font-size: 55px;
}

#input_email {
	border: 0px;
	padding-left: 0px;
}
</style>
<title>Insert title here</title>
<script>
	var p_email;

	window.addEventListener("load", function() {
		init();
	});
	function init() {
		p_email = document.getElementById("p_email");
	}

	function regist() {
		var str = document.getElementById("p_email").value;
		if (str.search('@') == -1) {
			alert("메일 형식이 잘못되었습니다.");
			return;
		}
		;
		alert(str);

		form1.action = "/main/update_regist.do";
		form1.submit();
	};
	function refresh() {

		alert("새로고침");
		form1.action = "/main/refresh.do";
		form1.submit();
		
	}
</script>
</head>
<body>
	<form name="form1" method="post">
		<div class="container-fluid">
			<div class="jumbotron" id="jumbo">

				<p>
				<h1 style="color: #FFEBE4;">
					SAI <span id="span_heart" class="glyphicon glyphicon-heart"
						aria-hidden="true"></span>
				</h1>
				</p>

				<h2 style="color: #FFEBE4;">Dating Application For Couple</h2>
				<%
					if (member.getP_email() == null) {
				%>
				<h4 style="color: #FFEBE4;"><%=member.getM_name()%>님 같이 사용하고 싶은
					사용자의 E-mail을 등록해 주세요.
				</h4>
				<p>
				<div class="col-lg-10" id="input_email">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="상대방의 E-mail을 입력하세요." id="p_email" name="p_email">
						<span class="input-group-btn"> <input type="hidden"
							name="m_email" id="m_email" value="<%=member.getM_email()%>">
							<button class="btn btn-default" type="button" onClick="regist()">전
								송</button>
							<button class="btn btn-default" type="button" onClick="refresh()">
								<span style="font-size: 20px;"
									class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
							</button>
						</span>
					</div>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
				</p>
				<%
					} else {
				%>
				<h4 style="color: #FFEBE4;"><%=member.getM_name()%>님이
					<%=member.getP_email()%>의 연결을 기다리고 있습니다.
				</h4>
				<p>
				<div class="col-lg-10" id="input_email">
					<div class="input-group">
						<input type="hidden"
							name="m_email" id="m_email" value="<%=member.getM_email()%>">
							<input type="hidden"
							name="p_email" id="p_email" value="<%=member.getP_email()%>">
						<button class="btn btn-default" type="button" onClick="refresh()">
							<span style="font-size: 20px;" class="glyphicon glyphicon-repeat"
								aria-hidden="true"></span>
						</button>
					</div>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
				</p>
				<%
					}
				%>

			</div>
		</div>

	</form>
</body>
</html>