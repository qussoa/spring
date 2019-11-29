<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${ pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${rootPath}/css/list-table.css?ver=2019-11-28-003">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	$(function() {
		$(".content-body").click(function() {
			let mTd = $(this).children();
			let strNo = mTd.eq(0).text();
			let strCode = mTd.eq(1).text();
			let strName = mTd.eq(2).text();
			let strIPrice = mTd.eq(3).text();
			let strOPrice = mTd.eq(4).text();

			/* alert(strNo + "\n"
				+ strCode + "\n"
				+ strName + "\n"
				+ strIPrice + "\n"
				+ strOPrice + "\n"		) */
			$("#io_pcode", opener.document).val(strCode);
			$("#io_pname", opener.document).text(strName);

			/* let strInput = $("#io_inout",opener.document).val() */
			let strInout = $(opener.document).find("#io_inout").val()
			if (strInout == "1") {
				$("#io_price", opener.document).val(strIPrice)
			} else {
				$("#io_price", opener.document).val(strOPrice)
			}
			
			let price = $("#io_price", opener.document).val()
			let qty = $("#io_qty", opener.document).val()
			$("#io_total", opener.document).val(
				parseInt(price)* parseInt(qty)	
				
			)
			
			window.close()
			//IE 때문에 쓸때없이 쓰는 코드
			window.open("about:blank", "_self").self.close()
		})
	})
</script>
<style>
div.s-box {
	width: 95%;
	margin: 0 auto;
}

div.s-box input {
	padding: 8px;
	width: 100%;
}
</style>
<article>
	<div class="s-box">
		<form>
			<input name="strText">
		</form>
	</div>
	<table>
		<tr>
			<th>NO</th>
			<th>상품코드</th>
			<th>상품명</th>
			<th>매입단가</th>
			<th>매출단가</th>
			<th>부가세</th>
		</tr>
		<c:choose>
			<c:when test="${empty PROLIST}">
				<tr>
					<td colspan="5">데이터가 없음</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${PROLIST}" var="dto" varStatus="info">
					<tr class="content-body" id="${dto.p_code}">
						<td>${info.count}</td>
						<td>${dto.p_code}</td>
						<td>${dto.p_name}</td>
						<td>${dto.p_iprice}</td>
						<td>${dto.p_oprice}</td>
						<td>${dto.p_vat}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</article>
