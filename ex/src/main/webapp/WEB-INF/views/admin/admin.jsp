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
		</div>
		<aside id="fh5co-hero" class="js-fullheight">
			<div class="flexslider js-fullheight">
				<ul class="slides">
					<li
						style="background-image: url(${path}/resources/images/monster.jpg);">
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner">
									<div class="desc">
										<h2>${sessionScope.admin_name}
											(${sessionScope.admin_userid})님 환영합니다.</h2>
										<p>
											<a href="${path}" class="btn btn-primary btn-outline btn-lg">home</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>