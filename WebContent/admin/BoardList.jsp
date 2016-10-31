<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BoardList for Admin</title>
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
		<h2>
			회원 정보 조회
			<div class="input-group">
				<input type="text" class="form-control" placeholder="email 검색"
					id="txt"> <span class="input-group-btn">
					<button class="btn btn-default" type="button" id="search">
						<span class="glyphicon glyphicon-search" aria-hidden="true"
							style="font-size: 20px"></span>
					</button>
				</span>
			</div>
		</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th>제목</th>
					<th>내용</th>
					<th>사진</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>			
				<td><input type="checkbox" value=""></td>
				<td>제목ㅇㅇ</td>
				<td>내용ㅇㅇ</td>
				<td>aasdfasdf.jpg</td>
				<td>작성장ㅇㅇ</td>
				<td>2021/21/21</td>			
			</tbody>		
				</td>
			</tr>
		</table>

	</div>
</body>
</html>