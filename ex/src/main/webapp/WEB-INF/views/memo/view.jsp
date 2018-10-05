<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link href="${path}/summernote/summernote.css" rel="stylesheet">
<script src="${path}/summernote/summernote.js"></script>

<script type="text/javascript">
	$(function() {
		$("#memo").summernote({
			height : 300,
			width : 800
		});

		$("#btnUpdate").click(function() {
			document.form1.action = "${path}/memo/update/${dto.idx}";
			document.form1.submit();
		});
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/memo/delete/${dto.idx}";
				document.form1.submit();
			}
		});

	});
</script>
</head>
<body>
	<div id="page">
		<div>
			<%@ include file="../include/menu.jsp"%>
			<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
				role="banner"
				style="background-image:url(${path}/resources/images/BuyerInfo.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Buyer_List</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div1">
			<h2>상세정보</h2>
			<form name="form1" method="post">

				번호 : ${dto.idx}<br> 이름 : <input name="writer"
					value="${dto.writer}"><br> 연락처 : <input name="hp"
					value="${dto.hp}"><br> 주소 : <input name="ad" size="60"
					value="${dto.ad}"><br> 구매상품 :
				<textarea rows="3" cols="50" name="memo" id="memo">${dto.memo}</textarea>
				<br> <input type="hidden" name="idx" value="${dto.idx}">
				<input type="button" value="수정" id="btnUpdate"> <input
					type="button" value="삭제" id="btnDelete">

			</form>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>

</body>
</html>