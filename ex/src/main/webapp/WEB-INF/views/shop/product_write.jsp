<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<!-- ckeditor 사용을 위해 js 파일 연결 -->
<script src="${path}/ckeditor/ckeditor.js"></script>

</head>
<body>
	<script type="text/javascript">
		function product_write() {
			var product_type = $("#product_type").val();
			var product_name = $("#product_name").val();
			var price = $("#price").val();
			var description = $("#description").val();
			if (price = "") {
				alert("타입번호를 입력하세요");
				$("#product_type").focus();
				return;
			}
			if (product_name == "") {
				alert("상품이름을 입력하세요");
				$("#product_name").focus(); 
				return; 
			}
			if (price = "") {
				alert("가격을 입력하세요");
				$("#price").focus();
				return;
			}
			document.form1.action = "${path}/shop/product/insert.do";
			document.form1.submit();
		}
	</script>
	<div id="page">
		<div>
			<%@ include file="../include/menu.jsp"%>
			<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
				role="banner"
				style="background-image:url(${path}/resources/images/add.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Add_Product</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div1">
			<br>
			<h2>상품 등록</h2>
			<form name="form1" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>타입번호</td>
						<td><input name="product_type" id="product_type"></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td><input name="product_name" id="product_name"></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input name="price" id="price"></td>
					</tr>
					<tr>
						<td>상품설명</td>
						<td><textarea rows="5" cols="60" name="description"
								id="description"></textarea> <script>

									CKEDITOR
											.replace(
													"description",
													{
														filebrowserUploadUrl : "${path}/imageUpload.do"
													});
								</script></td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td><input type="file" name="file1" id="file1"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
							value="등록" onclick="product_write()"> <input
							type="button" value="목록"
							onclick="location.href='${path}/shop/product/list.do'"></td>
					</tr>
				</table>
			</form>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>

</body>
</html>