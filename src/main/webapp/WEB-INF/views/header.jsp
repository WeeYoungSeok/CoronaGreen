<%@page import="com.corona.green.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template</title>
<!-- menubar css -->
<link href="resources/css/header.css" rel="stylesheet" type="text/css" />
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700;900&display=swap"
	rel="stylesheet">
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
%>
<body>
	<!--header_1-->
	<nav class="menubar">
		<div class="menubar__menu">
			<a href="main.do"><p class="menubar__logo">CORONA GREEN</p></a>
			<div class="menubar__category">
				<a href="#"><p>ABOUT</p></a>
				<a href="#"><p>NEWS</p></a>
				<a href="#"><p>POLICY</p></a>
				<a href="#"><p>QnA</p></a>
			</div>
			<%
				if (dto == null) {
			%>
			<a href="loginform.do"><p class="menubar__sign">SIGN IN</p></a>
			<%
				} else {
			%>
			<!-- 현모 마이페이지 부분 -->
			<a href="#"><p class="menubar__sign"><%=dto.getId() %></p></a>
			<%
				}
			%>
		</div>
		<!--user menu-->
		<!--login:visible-->
		<nav class="menubar__user">
			<div class="user__category">
				<a href="#"><span>MY PAGE</span></a>
			</div>
		</nav>
	</nav>
	<!--chat-->
	<section class="chatbot">
		<div class="chatbot__box">
			<p>🙋‍♀ASK</p>
		</div>
	</section>
</body>
</html>