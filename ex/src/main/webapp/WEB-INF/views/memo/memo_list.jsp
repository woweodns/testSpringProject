<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link href="${path}/summernote/summernote.css" rel="stylesheet">
<script src="${path}/summernote/summernote.js"></script>

<script type="text/javascript">
	$(function() {
		$("#memo").summernote({
			height : 150,
			width : 600
		});
	});

	function memo_view(idx) {
		location.href = "${path}/memo/view/" + idx;
	}
</script>


</head>
<body>
	<div id="page">
		<div>
			<%@ include file="../include/menu.jsp"%>
			<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
				role="banner"
				style="background-image:url(${path}/resources/images/buyer.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Buyer_List</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div1">
			<c:if test="${sessionScope.admin_userid == null }">
				<h2>구매완료 되었습니다.</h2>
				<a href="${path}"><input type="button" value="Home"></a>
			</c:if>

			<c:if test="${sessionScope.admin_userid != null }">
				<h2>구매자 목록</h2>


				<table>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>주소</th>
						<th>구매상품정보</th>
						<th>날짜</th>
					</tr>
					<c:forEach var="row" items="${list}">
						<tr>
							<td>${row.idx}</td>
							<td>${row.writer}</td>
							<td>${row.hp}</td>
							<td>${row.ad}</td>
							<td><a href="#" onclick="memo_view('${row.idx}')">상품정보</a></td>
							<td><fmt:formatDate value="${row.post_date}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>

</body>
</html>