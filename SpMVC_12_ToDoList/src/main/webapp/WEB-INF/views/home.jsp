<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>□□□ 나의 JSP page □□□</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

header {
	padding: 2rem 1rem;
	margin-bottom: 2rem;
	background-color: #E9ECEF;
	border-radius: 0.3rem;
}

table {
	border-collapse: collapse;
	border: 1px solid gray;
	width: 95%;
	margin: 0 auto;
}

table.input tr, table.input td, table.input th {
	padding: 10px;
}

table.list tr, table.list td, table.list th {
	border: 1px solid gray;
	padding: 5px;
}
/* 취소선 */
.line-through{
text-decoration: line-through;
}
</style>
</head>
<body>
	<header>
		<h3>TO-DO LIST</h3>
	</header>
	<section>
		<article id="input">
			<form method="POST">
				<table class="input">
					<tr>
						<th>할일</th>
						<td><label for="tdFlag">중요도</label> <input id="tdFlag"
							type="number" value="1" min="1" max="5" name="tdFlag"></td>
						<td><input type="text" name="tdSubject"></td>
						<td><input type="checkbox" id="tdAlarm" name="tdAlarm"
							value="Y"></td>
						<td><label for="tdAlarm">알림설정</label></td>
						<td>
							<button>저장</button>
						</td>
					</tr>
				</table>
			</form>
		</article>
		<article id="list">
			<c:if test="${!empty todoList}">
				<table class="list">
					<tr>
						<th>NO</th>
						<th>Flag</th>
						<th>제목</th>
						<th>완성</th>
						<th>알람</th>
						<th>명령</th>
					</tr>
					<c:forEach items="${todoList}" var="todo" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${todo.tdFlag}</td>
							<td <c:if test="${todo.tdComplete == 'Y'}"> class="line-through"</c:if>>${todo.tdSubject}</td>
							<td>
							<a href="${rootPath}/complete?tdSeq=${todo.tdSeq}&tdComplete=${todo.tdComplete}">
							${todo.tdComplete}
							</a>
							</td>
							<td>
							<a href="${rootPath}/alarm?tdSeq=${todo.tdSeq}&tdAlarm=${todo.tdAlarm}">
									${todo.tdAlarm}
							</a>
							</td>
			
							<td><a href="${rootPath}/update?tdSeq=${todo.tdSeq}">수정</a>
								<a href="${rootPath}/delete?tdSeq=${todo.tdSeq}">삭제</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</article>
	</section>
</body>
</html>