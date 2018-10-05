<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/login.css">
<script>
	$(function() {
		$("#btnLogin").click(function() {
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return;
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			document.form1.action = "${path}/member/login_check.do";
			document.form1.submit();
		});
	});
</script>
</head>
<body id="bdy">
	<div id="page">
		<div>
			<%@ include file="../include/menu.jsp"%>
			<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
				role="banner"
				style="background-image:url(${path}/resources/images/login.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">


								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div1">
			<br>
			<div class="login">
				<h2 id="loginH2">로그인</h2>
				<form name="form1" method="post">
					<table border="1" width="400px">
						<input type="text" id="userid" name="userid"
							placeholder="Username" required="required">

						<input type="password" id="passwd" name="passwd"
							placeholder="Password" required="required">

						<input type="button" id="btnLogin" value="로그인">
						<input type="button" id="btnlogin"
							class="btn btn-primary btn-block btn-large" value="회원가입">
						<c:if test="${param.message == 'nologin' }">
							<div style="color: red;">로그인 하신 후 사용하세요.</div>
						</c:if>
						<c:if test="${message == 'error' }">
							<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
						</c:if>
						<c:if test="${message == 'logout' }">
							<div style="color: blue;">로그아웃 처리되었습니다.</div>
						</c:if>
					</table>
				</form>
			</div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>
	<div id="two" style="border: 2px solid;">
		<img src="${path}/resources/images/side.jpg" usemap="map1">
		<map name="map1">
			<area shape="rect" coords="4,3,137,75"
				href="https://www.cjlogistics.com/ko/tool/parcel/tracking"
				target="_blank">
			<area shape="rect" coords="5,81,137,154"
				href="https://parcel.epost.go.kr/auth.EpostLogin.parcel"
				target="_blank">
			<area shape="rect" coords="11,164,69,223"
				href="https://section.blog.naver.com/BlogHome.nhn?directoryNo=0&currentPage=1&groupId=0"
				target="_blank">
			<area shape="rect" coords="72,163,130,221"
				href="https://www.instagram.com/?hl=ko" target="_blank">
			<area shape="rect" coords="10,226,68,284"
				href="https://www.youtube.com/" target="_blank">
			<area shape="rect" coords="70,227,131,282"
				href="https://ko-kr.facebook.com/" target="_blank">
			<area shape="rect" coords="17,311,124,440"
				href="${path}/shop/product/list.do" target="_blank">
		</map>
	</div>

</body>
</html>