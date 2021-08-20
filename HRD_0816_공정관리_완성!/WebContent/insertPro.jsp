<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>

<%
try{
	sql = "insert into tbl_product values(?,?,?,?,?,?,?,?,?)";
	ps = con.prepareStatement(sql);
	
	ps.setString(1, request.getParameter("w_workno"));
	ps.setString(2, request.getParameter("p_p1"));
	ps.setString(3, request.getParameter("p_p2"));
	ps.setString(4, request.getParameter("p_p3"));
	ps.setString(5, request.getParameter("p_p4"));
	ps.setString(6, request.getParameter("p_p5"));
	ps.setString(7, request.getParameter("p_p6"));
	ps.setString(8, request.getParameter("w_lastdate"));
	ps.setString(9, request.getParameter("w_lasttime"));

ps.executeUpdate();//성공
%>
	<script>
		alert("회원등록이 완료되었습니다.");
		location.href="select.jsp";//location.href("insert.jsp");
	</script>
<%
}
catch(Exception e){//실패하여 예외객체가 생성되면 이것을 잡아서 알림창 띄움
%>
	<script>
		alert("회원등록이 실패 됬습니다..");
		//location="insert.jsp";//location.href("insert.jsp");
		history.back(); //history.go(-1);
	</script>
<%
}finally{//finally:예외발생여부에 관계없이 무조건 실행
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>