<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>안.길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
				<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


	<style>
		.major{
			font-family: 'Noto Sans KR', sans-serif;
		}
		table>tr{
			font-family: 'Noto Sans KR', sans-serif;
		} 
	</style>
		
		
		
		
		
	</head>
<body>

	
		<h2 class="major" style="text-align:center;">리뷰 작성</h2>
<!-- 	 	<form action="RevieWriteCon" method="post">
			<div class="fields">
				<div class="field">
				<input type="text" placeholder="제목 작성" name="name" required oninvalid="this.setCustomValidity('제목을 입력해주세요')" oninput="this.setCustomValidity('')">
				</div>
				<div class="field">
					<label for="review">Review</label>
					<textarea name="review" id="review" rows="10"  required oninvalid="this.setCustomValidity('내용을 입력해주세요')" oninput="this.setCustomValidity('')"></textarea>
				</div>
			</div>
			<ul class="actions">
				<li><input type="submit" value="Upload" class="primary" /></li>
				<li><input type="reset" value="Reset" /></li>
			</ul>
		</form> -->
	 	<form action="RevieWriteCon" method="post">
		<table style="width: 1000px; height: 600px; margin: auto">
		<tr><td><input type="text" placeholder="제목 작성" name="name" required oninvalid="this.setCustomValidity('제목을 입력해주세요')" oninput="this.setCustomValidity('')"></td></tr>
		<tr><td><label for="review">Review</label>
			<textarea name="review" id="review" rows="10"  required oninvalid="this.setCustomValidity('내용을 입력해주세요')" oninput="this.setCustomValidity('')"></textarea></td></tr>
		<tr><td><input type="submit" value="Upload" class="primary" />
				<input type="reset" value="Reset" />
				<a href="reviewList.jsp"><input type="button" value="Cancle" /></a></td></tr>
		</table>
		</form>
	

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>