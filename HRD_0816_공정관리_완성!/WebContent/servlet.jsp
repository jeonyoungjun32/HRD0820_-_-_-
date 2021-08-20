<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP책 99p servlet작동순서</h2>
	
	<h4>클라이언트에서 servlet요청이 들어오면 서버에서는 servlet컨테이너를 만들고, 요청이 있을 때마다 스레드가 생성 됩니다.</h4>
	<li>웹브라우저 ↓</li>
	<li>웹서버 ↓</li>
	<li>웹어플리케이션 서버 ↓</li>
	<li>servlet 컨테이너 ①멀티스레드생성하고 ⑵스레드 생성  ③Servlet객체 생성</li>
	<li>service(), doGet(), doPost()호출    doget,dopost둘중 쓰고 없을때 service쓴다</li>
</body>
</html>