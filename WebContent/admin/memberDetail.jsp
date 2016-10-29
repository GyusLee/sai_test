<%@page import="com.sai.model.domain.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	Member member = (Member) request.getAttribute("member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
	function del() {
		form1.action = "/admin/delete.do"
		form1.submit();
	}
</script>
<body>
	<form name="form1" method="post">
		<div class="container">
			<h2>
				회원 정보 디테일
				<p>
					<input type="button" class="btn btn-danger" onClick="del()"
						value="회원 삭제">
				</p>
			</h2>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						<thead>
							<tr>
								<div class="thumbnail">
									<img src="/sai/images/img4.jpg" alt="...">
								</div>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Email</td>
								<td><%=member.getMember_email()%></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><%=member.getMember_name()%></td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td><%=member.getMember_nickname()%></td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><%=member.getMember_regdate()%></td>
							</tr>
							<tr>
								<td>상대 Email</td>
								<td>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>