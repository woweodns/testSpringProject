<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="fh5co-hero" class="js-fullheight">
			<div class="flexslider js-fullheight">
				<ul class="slides">
					<li style="background-image: url(${pageContext.request.contextPath}/images/monster.jpg);">
		
						<div class="overlay-gradient"></div>
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner"></div>
							</div>
						</div>
					</li>
					<li style="background-image: url(${pageContext.request.contextPath}/images/p1.jpg);">
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner">
									<div class="desc">
										<span class="price">30,000원~</span>
										<h2>프로틴</h2>
										<p>-</p>
										<p>
											<a href="${path}/shop/product/list.do"
												class="btn btn-primary btn-outline btn-lg">구매하러가기</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li style="background-image: url(${pageContext.request.contextPath}/images/p2.jpg);">
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner">
									<div class="desc">
										<span class="price">40,000원~</span>
										<h2>부스터</h2>
										<p>-</p>
										<p>
											<a href="${path}/shop/product/list2.do"
												class="btn btn-primary btn-outline btn-lg">구매하러가기</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li style="background-image: url(${pageContext.request.contextPath}/images/p3.png);">
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner">
									<div class="desc">
										<span class="price">30,000원~</span>
										<h2>영양제</h2>
										<p>다이어트로 인해 부족해진 영양분을 보충하세요</p>
										<p>
											<a href="${path}/shop/product/list3.do"
												class="btn btn-primary btn-outline btn-lg">구매하러가기</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>