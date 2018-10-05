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
				style="background-image:url(${path}/resources/images/service.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Service</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div1">
			<h2>이메일(기타문의사항) 보내기</h2>
			<form method="post" action="${path}/email/send.do">

				<table>
					<tr>
						<td>발신자 이름</td>
						<td><input name="senderName"></td>
					</tr>
					<tr>
						<td>발신자 이메일</td>
						<td><input name="senderMail"></td>
					</tr>
					<tr>
						<td>관리자 이메일(jws5709@gmail.com)</td>
						<td><input name="receiveMail"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input name="subject"></td>
					</tr>
				</table>

				내용 :
				<textarea rows="5" cols="70" name="message"></textarea>
				<br> <input type="submit" id="btn" value="전송">
			</form>
			<span style="color: red;">${message}</span>

			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>
</body>
</html>