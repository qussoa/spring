<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${ pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/include/include-header.jsp"%>
<section class="rblist">
	<article class="rbody">
		<header class="header">
			<h3>도서감상록</h3>
		</header>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">SEQ</th>
					<th scope="col">도서코드</th>
					<th scope="col">독서날짜</th>
					<th scope="col">독서시작날짜</th>
					<th scope="col">독서종료시각</th>
					<th scope="col">제목</th>
					<th scope="col">본문</th>
					<th scope="col">별점</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty READLIST}">
						<tr scope="row">
							<td colspan="8"><a href="${rootPath}/rbinsert">독후감 작성하기</td>

						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${READLIST}" var="readBookDTO" varStatus="info">
							<tr scope="row" class="content-detail" id="${readBookDTO.rb_seq}">
								<td>${readBookDTO.rb_seq}</td>
								<td>${readBookDTO.rb_bcode}</td>
								<td>${readBookDTO.rb_date}</td>
								<td>${readBookDTO.rb_stime}</td>
								<td>${readBookDTO.rb_rtime}</td>
								<td>${readBookDTO.rb_subject}</td>
								<td>${readBookDTO.rb_text}</td>
								<td>${readBookDTO.rb_star}</td>
							</tr>
							<td><a class="btn btn-outline-secondary" href="${rootPath}/rbupdate?id=${readBookDTO.rb_seq}">수정</a>
								<a class="btn btn-outline-secondary" href="${rootPath}/rbdelete?id=${readBookDTO.rb_seq}">삭제</a></td>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</article>
</section>
