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
					<li class="has-dropdown"><a href="#">Product</a>
						<ul class="dropdown">
							<li><a href="${path}/shop/product/list.do">단백질 보충제</a></li>
							<li><a href="${path}/shop/product/list2.do">영양제</a></li>
							<li><a href="${path}/shop/product/list3.do">다이어트 보조제</a></li>
						</ul></li>

					<li><a href="${path}/board/list.do">게시판</a></li>


					<c:if test="${sessionScope.admin_userid != null }">
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
				<div style="text-align: right;">
					<c:choose>
						<c:when test="${sessionScope.admin_userid == null }">
							<!-- 로그인하지 않은 상태 -->
							<a href="${path}/admin/login.do">관리자 로그인</a>
						</c:when>
						<c:otherwise>
							<!-- 로그인한 상태 -->
        ${sessionScope.admin_name}님이 로그인중입니다.<br>
							<a href="${path}/admin/logout.do">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</nav>
