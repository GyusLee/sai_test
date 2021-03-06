<%@page import="com.sai.model.domain.Board"%>
<%@page import="com.sai.model.domain.Member"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	Board board = (Board) request.getAttribute("board");
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
		form1.action = "Bdelete.do"
		form1.submit();
	}
	function back(){
		form1.action="boardList.do"
		form1.submit();
	}
</script>
<body>
<input type="hidden" name="board_id" value="<%=board.getBoard_id()%>">
	<form name="form1" method="post">
		<div class="container">
			<h2>
				게시물 정보 디테일
				<p>
				<input type="button" class="btn btn-primary" onClick="back()"
						value="뒤로가기">
					<input type="button" class="btn btn-danger" onClick="del()"
						value="게시물 삭제">
				</p>
			</h2>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						<thead>
							<tr>
								<div class="thumbnail">
									<img src="/data/<%=board.getImg() %>" width="30%">
								</div>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>board_id</td>
								<td><%=board.getBoard_id()%></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><%=board.getM_email()%></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><%=board.getContent()%></td>
							</tr>
							<tr>
								<td>등록일</td>
								<td><%=board.getRegdate()%></td>
							</tr>
							<tr>
								<td>s_id</td>
								<td><%=board.getS_id()%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>