<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>회원 정보 조회</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th>Email</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 1; i < 32; i++) {
				%>
				<tr>
					<td><input type ="checkbox" value=""></td>
					<td>user<%=i%>@naver.com	</td>
					<td>유저<%=i%></td>
					<td>user<%=i%></td>
					<td>2016/10/20</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
