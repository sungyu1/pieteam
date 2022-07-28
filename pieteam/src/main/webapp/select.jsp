<%@page import="com.smhrd.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Dimension by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://kit.fontawesome.com/b163195086.js" crossorigin="anonymous"></script>
	</head>
<body>
	<%
		MemberDAO dao = new MemberDAO();
		List<Member> list = dao.selectAllMember();
		System.out.print(list.size());
	%>
	<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>회원관리페이지</h2></caption>
							<tr>
								<td>ID</td>
								<td>Name</td>
								<td>NickName</td>							
								<td>Gender</td>							
								<td>Age</td>							
							</tr>
							<%for(Member m:list){ // forEach문%>
							<tr>
								<td><%=m.getM_id()%></td>
								<td><%=m.getM_name()%></td>
								<td><%=m.getM_nick()%></td>
								<td><%=m.getM_gender()%></td>
								<td><%=m.getM_age()%></td>
								<td><a href="DeleteCon?id=<%=m.getM_id()%>">삭제</a></td>
							</tr>
							<%} %>
						</table>
					</nav>		
					<a href="main.jsp" class="button next scrolly">되돌아가기</a>	
					
					
									<!-- Footer -->
					<footer id="footer">
						<p &copy; class="copyright"style="color:#FFAF00 ">&copy; 안.길</p>
					</footer>
			</div>
			
				<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>