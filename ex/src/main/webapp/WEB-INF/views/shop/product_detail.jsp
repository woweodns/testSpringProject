<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<div id="page">
		<div>
			<%@ include file="../include/menu.jsp"%>
			<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
				role="banner"
				style="background-image:url(${path}/resources/images/view.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Information</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div3">
			<div id="jb-content">
				<br>
				<h2>상세정보</h2>
				<img src="${path}/images/${dto.picture_url}">
			</div>
		</div>
		<div>

			<table>
				<tbody>
					<tr>
						<th>가격 정보</th>
					</tr>

					<tr>
						<td>${dto.product_name}</td>
					</tr>
					<tr>
						<td>${dto.price}원</td>
					</tr>
					<tr>
						<td>${dto.description}</td>
					</tr>
					<tr>
						<td colspan="2">
							<form name="form1" method="post"
								action="${path}/shop/cart/insert.do">
								<input type="hidden" name="product_id" value="${dto.product_id}">
								<select name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select> <input type="submit" value="장바구니에 담기">
							</form>
						</td>
					</tr>
				</tbody>
			</table>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>
</body>
</html>