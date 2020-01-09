<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${ pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="rootPath" value="${ pageContext.request.contextPath}" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>□□□ 나의 JSP page □□□</title>
<script>
$(function() {
	$(".content-body").click(function() {
		// td들의 목록을 추출하기
		let td = $(this).children()
		let strBCode = td.eq(0).text()
		let strBName = td.eq(1).text()
//		$(opener.document).find("#b_code").val(strBCode)
//		$(opener.document).find("#b_name").val(strBName)
//		window.close()
		window.open("about:blank", "_new").self.close()
	})
})
</script>
</head>
<body>
	<header>
		<h3>도서정보</h3>
	</header>
	<section class="list">
		<article class="body">
			<table>
				<tr>
					<th>ISBN</th>
					<th>도서명</th>
					<th>출판사</th>
					<th>저자</th>
					<th>구입일자</th>
					<th>구입가격</th>
				</tr>
				<c:choose>
					<c:when test="${empty BOOKLIST}">
						<tr>
							<td colspan="6">도서정보없음</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${BOOKLIST}" var="bookDTO" varStatus="info">
							<tr class="content-body" id="${bookDTO.b_code}">
								<td>${bookDTO.b_code}</td>
								<td>${bookDTO.b_name}</td>
								<td>${bookDTO.b_auther}</td>
								<td>${bookDTO.b_comp}</td>
								<td>${bookDTO.b_year}</td>
								<td>${bookDTO.b_iprice}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</article>
	</section>
</body>
</html>