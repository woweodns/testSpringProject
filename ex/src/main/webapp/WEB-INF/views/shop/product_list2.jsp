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
				style="background-image:url(${path}/resources/images/booster.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Booster</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
		<h1></h1>
		</div>

		<div id="div1">
			<table>			
				<c:forEach var="row" items="${list2}">


						<div class="col-md-4 text-center animate-box">
					<div class="product">
						<div class="product-grid" style="background-image:url(${path}/images/${row.picture_url};">
							<div class="inner">
								<p>
									<a href="${path}/shop/product/detail/${row.product_id}" class="icon"><i class="icon-eye"></i></a>
								</p>
							</div>
						</div>
						<div class="desc">
							<h3><a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a></h3>
							<c:if test="${sessionScope.admin_userid != null }">
								<a href="${path}/shop/product/edit/${row.product_id}">[편집]</a>
							</c:if>
							
							<span class="price"><fmt:formatNumber value="${row.price}" pattern="#,###" /></span>
						</div>
					</div>
				</div>

				</c:forEach>
			</table>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>

</body>
</html>