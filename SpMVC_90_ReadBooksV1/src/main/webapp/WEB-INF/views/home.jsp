<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() { // <input>요소에 문자가 입력될 때마다 호출됨.

		$("#btn-search").click(function() {
			let book = $("#search-box").val()
			document.location.href = "${rootPath}/book/list?b_name=" + book
		})

	})
</script>
<style>

</style>
<title>bookproject</title>
</head>
<body>
	<header>
		<h3>도서검색</h3>
	</header>
	<article>
		<div class="s-box">
			<form>
				<input type="text" name="book" id="search-box">
			</form>
		</div>

		<div class="b-box">
			<button type="button" id="btn-search">검색</button>
		</div>
	</article>
	<div>
		<a href="#">로그인</a><span></span> <a href="#">회원등록</a>
	</div>
</body>
</html>