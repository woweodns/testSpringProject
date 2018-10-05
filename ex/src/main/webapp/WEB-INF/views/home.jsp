<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@ include file="include/header.jsp"%>

</head>

<div id="page">
	<%@ include file="include/menu.jsp"%>
	<%@ include file="include/main.jsp"%>
	
	<div style="position:relative;height:0;padding-bottom:56.27%"><iframe src="https://www.youtube.com/embed/cWvZr6Ju1WM?ecver=2" style="position:absolute;width:100%;height:100%;left:0" width="640" height="360" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>

	<div id="fh5co-testimonial" class="fh5co-bg-section">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<span>best</span>
					<h2>베스트 후기</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="row animate-box">
						<div class="owl-carousel owl-carousel-fullwidth">
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="resources/images/re1.jpg" alt="user">
									</figure>
									<span>박 * *</span>
									<blockquote>
										<p>&ldquo;꾸준히 운동하면서 몸매관리를 한지 벌써 6개월 가까이 되었습니다.
										처음 운동할 때 아무것도  모르고 주문한 단백질 보충제가 6개월째 먹을지는 몰랐습니다.
										맛도 좋고 가격도 적당하고 무엇보다 효과도 너무 좋은것 같습니다. 정말 강력추천합니다.&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="resources/images/re2.jpg" alt="user">
									</figure>
									<span>김 * *</span>
									<blockquote>
										<p>&ldquo;보통 보충제는 인공적인 맛이 강해서 거부감이 있었는데 이건 다른 후기들처럼
										약간 미숫가루 맛이 나서 저한테 잘맞아요. 물에 잘녹고 물이 적어도 탈수 있어 강력 추천합니다.&rdquo;</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="resources/images/re3.jpg" alt="user">
									</figure>
									<span>강 * *</span>
									<blockquote>
										<p>&ldquo;저체중이라 몇년을 여러제품 먹어봤는데 저렴하고 맛도 좋고 근육량도 잘 늘어나고있어요
										앞으로 쭉 이 제품만 이용할 예정입니다.&rdquo;</p>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
