<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품조회</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<h1>제품조회</h1>
	<table border="1 solid" style="margin: 0 auto; width: 800px;">
		<tr">
			<th>제품코드</th>
			<th>제품명</th>
			<th>제품규격</th>
			<th>제품구분</th>
			<th>제품단가</th>
		</tr>

		<%
			sql = "select p_code, p_name, p_size, p_type, to_char(p_price,'$999,999,999') from tbl_product";

		rs = stmt.executeQuery(sql);

		while (rs.next()) {
		%>
			<tr>
				<td><%=rs.getString(1)%>
				<td><%=rs.getString(2)%>
				<td><%=rs.getString(3)%>
				<td><%=rs.getString(4)%>
				<td><%=rs.getString(5)%>
			</tr>



		<%
			}
		%>


	</table>
</body>
</html>