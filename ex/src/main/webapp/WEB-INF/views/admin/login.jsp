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
			document.form1.action = "${path}/admin/login_check.do";
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
				style="background-image:url(${path}/resources/images/admin.jpg);">
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
				<h2 id="loginH2">관리자 로그인</h2>
				<form name="form1" method="post">
					<table border="1" width="400px">
						<input type="text" id="userid" name="userid"
							placeholder="Username" required="required">

						<input type="password" id="passwd" name="passwd"
							placeholder="Password" required="required">

						<input type="button" id="btnLogin" value="로그인">
						<a href="${path}"><input type="button"
							class="btn btn-primary btn-block btn-large" value="home"></a>
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

</body>
</html>