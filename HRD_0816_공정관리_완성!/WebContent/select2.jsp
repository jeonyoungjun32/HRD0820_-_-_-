<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업공정조회</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<h1 class="제품조회">작업공정조회</h1>
	<table id="제품조회1" style="width: 800px;">
		<tr>
			<th>작업지시번호</th>
			<th>제품코드</th>
			<th>제품명</th>
			<th>제품규격</th>
			<th>제품구분</th>
			<th>작업시작일</th>

		</tr>

		<%
		sql = "select substr(w_workno,1,4)||'-'||substr(w_workno,5,4), p_code, p_name, p_size, p_type, w_quantity, to_char(w_workdate,'yyyy-mm-dd')";
		sql +=" from tbl_product natural join tbl_worklist";


		rs = stmt.executeQuery(sql);
		while (rs.next()) {
		%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
			</tr>


		<%
			}
		%>

	</table>

</body>
</html>
