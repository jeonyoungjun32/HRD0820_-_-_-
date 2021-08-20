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

	<h1 class="h1">작업공정조회</h1>

	<table style="border: 1px solid; margin: 0 auto; width: 800px;">
		<tr>
			<th>작업지시번호</th>
			<th>제품코드</th>
			<th>제품명</th>
			<th>준비</th>
			<th>인쇄</th>
			<th>코딩</th>
			<th>합지</th>
			<th>집합</th>
			<th>포장</th>
			<th>최종공정일지</th>
			<th>최종공정시간</th>
		</tr>

		<%
			sql = "select substr(w_workno,1,4)||'-'||substr(w_workno,5,4),";
		sql += " p_code, p_name,";
		sql += " decode(p_p1,'Y','완료','N','~'),";
		sql += " decode(p_p2,'Y','완료','N','~'),";
		sql += " decode(p_p3,'Y','완료','N','~'),";
		sql += " decode(p_p4,'Y','완료','N','~'),";
		sql += " decode(p_p5,'Y','완료','N','~'),";
		sql += "decode(p_p6,'Y','완료','N','~'),";
		sql += " to_char(to_date(w_lastdate),'yyyy-mm-dd'),";
		sql += " substr(w_lasttime,1,2)||':'||substr(w_lasttime,3,2)";
		sql += " from tbl_process natural join (select w_workno, p_code, p_name";
		sql += " from tbl_product natural join tbl_worklist)";
		sql += " order by 1";

		rs = stmt.executeQuery(sql);

		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><%=rs.getString(8) %></td>
			<td><%=rs.getString(9) %></td>
			<td><%=rs.getString(10) %></td>
			<td><%=rs.getString(11) %></td>
		</tr>

		<%
			}
		%>


	</table>
</body>
</html>