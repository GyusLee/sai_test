<%@page import="com.sai.model.domain.Board"%>
<%@page import="com.sai.common.page.PagingManager"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%
	List<Board> list=(List)request.getAttribute("list");
	PagingManager pm = (PagingManager)request.getAttribute("pm");
%>
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
					<th>내용</th>
					<th>사진</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					int curPos = pm.getCurPos();
					int num = pm.getNum();
				%>
				<%
					for (int i = 1; i < pm.getPageSize(); i++) {
				%>
				<%
					if (num < 1)break;
				%>
				<%
					Board board = list.get(curPos++);
				%>
				<td><input type="checkbox" value=""><%=num--%></td>
				<td><a
					href="/admin/BoardDetail.do?Board_id=<%=board.getBoard_id()%>"><%=board.getContent() %></a></td>
				<td><%=board.getMember_id()- %></td>
				<td><%=board.getImg() %></td>
				<td><%=board.getRegdate() %></td>
				<%
					}
				%>
			</tbody>
			<tr>
				<td id="paging" height="20" colspan="5" align="center">
					<%
						if (pm.getFirstPage() - 1 < 1) {
					%> <a href="javascript:alert('이전 페이지가 없습니다.');">◀</a> <%} else { %> <a
					href="admin/BoardList.jsp?currentPage=<%=pm.getFirstPage() - 1%>">◀</a>
					<%} %> <%
						for (int i = pm.getFirstPage(); i <= pm.getLastPage(); i++) {
					%> <%
					if (i > pm.getTotalPage())	break;
					%> <a <%if (pm.getCurrentPage() == i) {%> class="pageNum" <%}%>
					href="admin/BoardList.jsp?currentPage=<%=i%>">[<%=i%>]
				</a> <%} %> <%
					if (pm.getLastPage() + 1 >= pm.getTotalPage()) {
 					%> <a href="javascript:alert('다음 페이지가 없습니다.');">▶</a> <%} else { %>
					<a href="admin/BoardList.jsp?currentPage=<%=pm.getLastPage() + 1%>">▶</a>
					<%}%>

				</td>
			</tr>
		</table>

	</div>
</body>
</html>