<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
					<li class="has-dropdown"><a href="${path}">Shop</a>
						<ul class="dropdown">
							<li><a href="${path}/shop/product/list.do">프로틴</a></li>
							<li><a href="${path}/shop/product/list2.do">부스터</a></li>
							<li><a href="${path}/shop/product/list3.do">영양제</a></li>
						</ul></li>
					<li><a href="${path}/board/list.do">제품리뷰</a></li>
						<li><a href="${path}/email/write.do">Question</a></li>
						<c:if test="${sessionScope.userid != null }">
						<li><a href="${path}/shop/cart/list.do">장바구니</a></li>
					</c:if>
					<c:if test="${sessionScope.admin_userid != null }">
						<li class="has-dropdown"><a href="#">관리자</a>
							<ul class="dropdown">

								<li><a href="${path}/shop/product/write.do">상품등록</a></li>
								<li><a href="${path}/memo/list.do">구매자 목록</a></li>
								<li><a href="${path}/chart/chart2.do">판매량 차트</a></li>

							</ul></li>
					</c:if>
				</ul>
			</div>
			<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
				<ul>
					<div style="text-align: right;">
						<c:choose>
							<c:when test="${sessionScope.userid == null }">
								<li><a href="${path}/member/login.do">로그인</a></li>
								<li><a href="${path}/member/join.do">회원가입</a></li>
								<li><a href="${path}/admin/login.do">관리자 로그인</a></li>
							</c:when>
							<c:otherwise>
								<li>${sessionScope.name}님이로그인중입니다.<br> <a
									href="${path}/member/logout.do">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</div>
				</ul>
			</div>
		</div>

	</div>
</nav>
