<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="${path}/include/js/common.js"></script>
<!-- ckeditor의 라이브러리 -->
<script src="${path}/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		$("#btnSave").click(
				function() {
					var str = "";
					$("#uploadedList .file").each(
							function(i) {
								console.log(i);
								str += "<input type='hidden' name='files[" + i
										+ "]'	value='" + $(this).val() + "'>";
							});
					$("#form1").append(str);
					document.form1.submit();
				});
		$(".fileDrop").on("dragenter dragover", function(e) {
			e.preventDefault();
		});
		$(".fileDrop")
				.on(
						"drop",
						function(e) {
							e.preventDefault();
							var files = e.originalEvent.dataTransfer.files;
							var file = files[0];
							var formData = new FormData();
							formData.append("file", file);
							$
									.ajax({
										url : "${path}/upload/uploadAjax",
										data : formData,
										dataType : "text",
										processData : false,
										contentType : false,
										type : "post",
										success : function(data) {
											var fileInfo = getFileInfo(data);
											var html = "<a href='"+fileInfo.getLink+"'>"
													+ fileInfo.fileName
													+ "</a><br>";
											html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
											$("#uploadedList").append(html);
										}
									});
						});
	});
</script>

<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>

</head>
<body>
	<div id="page">
		<div>
			<%@ include file="../include/menu.jsp"%>
			<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
				role="banner"
				style="background-image:url(${path}/resources/images/review.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Review</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div1">
			<br>
			<h2>후기작성하기</h2>
			<form id="form1" name="form1" method="post"
				action="${path}/board/insert.do">
				<div>
					제목 <input name="title" id="title" size="80" placeholder="제목을 입력하세요">
				</div>
				<div style="width: 800px;">
					내용
					<textarea id="content" name="content" rows="3" cols="80"
						placeholder="내용을 입력하세요"></textarea>
					<script>
						CKEDITOR.replace("content", {
							filebrowserUploadUrl : "${path}/imageUpload.do"
						});
					</script>
				</div>
				<div>
					첨부파일을 등록하세요
					<div class="fileDrop"></div>
					<div id="uploadedList"></div>
				</div>
				<div style="width: 700px; text-align: center;">
					<button type="button" id="btnSave">확인</button>
				</div>
			</form>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>

</body>
</html>


