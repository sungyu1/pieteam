<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>안.길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
<body class="is-preload">
<%
	Member joinMember = (Member)request.getAttribute("joinMember");
%>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Menu -->
			<nav id="Update"> <font size="8">회원가입성공</font>
				<br>
				정보를 확인하세요<br>
				<br>
				
				<table>
					<tr>
						<td>ID</td>
						<td><%=joinMember.getM_id() %></td>	
					</tr>
					<tr>
						<td>NAME</td>
						<td><%=joinMember.getM_name() %></td>	
					</tr>
				</table>
			<a href="main.jsp"><input type="button" value="Main"></a> </nav>

			<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; 안.길</p>
		</footer>
	</div>
	
				<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>