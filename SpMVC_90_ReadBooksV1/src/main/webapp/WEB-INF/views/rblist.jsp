<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>

	<a href="#">도서정보 수정</a>
	<c:choose>
		<c:when test="${empty READLIST}">
			<tr>
				<td colspan="8">독후감 작성하기</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${READLIST}" var="readBookDTO" varStatus="info">
				<tr class="content-detail" id="${readBookDTO.rb_seq}">
					<td>${readBookDTO.rb_seq}</td>
					<td>${readBookDTO.rb_bcode}</td>
					<td>${readBookDTO.rb_date}</td>
					<td>${readBookDTO.rb_stime}</td>
					<td>${readBookDTO.rb_rtime}</td>
					<td>${readBookDTO.rb_subject}</td>
					<td>${readBookDTO.rb_text}</td>
					<td>${readBookDTO.rb_star}</td>
				</tr>
				<button>수정</button>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</table>