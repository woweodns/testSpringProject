<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>

</head>
<body>
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo">
						<a href="${path}">Monster</a>
					</div>
				</div>
				<div class="col-md-6 col-xs-6 text-center menu-1">
					<ul>
						<li class="has-dropdown"><a href="#">Shop</a>
							<ul class="dropdown">
								<li><a href="${path}/shop/product/list.do">단백질 보충제</a></li>
								<li><a href="#">영양제</a></li>
								<li><a href="#">다이어트 보조제</a></li>
							</ul></li>
						<li class="has-dropdown"><a href="#">Services</a>
							<ul class="dropdown">
								<li><a href="${path}/board/list.do">게시판</a></li>
								<li><a href="${path}/memo/list.do">게시판2</a></li>
							</ul></li>
						<c:if test="${sessionScope.userid != null }">
							<li><a href="${path}/shop/cart/list.do">장바구니</a></li>
						</c:if>
						<c:if test="${sessionScope.admin_userid != null }">
							<li><a href="${path}/shop/product/write.do">상품등록</a></li>
						</c:if>
						<li><a href="${path}/email/write.do">상품문의</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
						<div style="text-align: right;">
							<c:choose>
								<c:when test="${sessionScope.userid == null }">
									<li><a href="${path}/member/login.do">로그인</a></li>
									<li><a href="#">회원가입</a></li>
									<li><a href="${path}/admin/login.do">관리자 로그인</a></li>
								</c:when>
								<c:otherwise>
									<li>${sessionScope.name}님이 로그인중입니다. <a
										href="${path}/member/logout.do">로그아웃</a></li>
								</c:otherwise>
							</c:choose>
						</div>
					</ul>
				</div>
			</div>

		</div>
	</nav>

	<div class="fh5co-loader"></div>

	<div id="page">


		<div class="fh5co-loader"></div>

		<div id="page">


			<div id="fh5co-testimonial" class="fh5co-bg-section">
				<div class="container">
					<div class="row animate-box">
						<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
							<span>=</span>
							<h2>결과...</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="row animate-box">
								<div class="owl-carousel owl-carousel-fullwidth">
									<div class="item">
										파일이 업로드되었습니다.<br> 파일명 : ${savedName}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer id="fh5co-footer" role="contentinfo">
			<div class="container">
				<div class="row row-pb-md">
					<div class="col-md-4 fh5co-widget">
						<h3>Monster.</h3>
						<p>주소 : 서울시 강남구 000</p>
						<p>전화번호 : 000-0000-0000</p>
						<p>(주)몬스터짐</p>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<ul class="fh5co-footer-links">
							<li>(주)사이버결제</li>
							<li>히든상품선정업체</li>
						</ul>
					</div>

					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<ul class="fh5co-footer-links">
							<li>건강식품협회</li>
							<li>표준약관준수</li>
						</ul>
					</div>

					<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
						<ul class="fh5co-footer-links">
							<li>보헙가입 업체</li>
							<li>유망브랜드 대상</li>
						</ul>
					</div>
				</div>

				<div class="row copyright">
					<div class="col-md-12 text-center">
						<p>
							<small class="block">&copy; 2018 MonsterGym.</small>
						</p>

					</div>
				</div>

			</div>
		</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	</div>
</body>
</html>