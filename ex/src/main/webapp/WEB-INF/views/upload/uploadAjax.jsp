<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
<script>
	$(function() {
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
		$(".fileDrop")
				.on(
						"drop",
						function(event) {
							event.preventDefault();
							var files = event.originalEvent.dataTransfer.files;
							var file = files[0];
							var formData = new FormData();
							formData.append("file", file);
							$
									.ajax({
										type : "post",
										url : "${path}/upload/uploadAjax",
										data : formData,
										dataType : "text",
										processData : false,
										contentType : false,
										success : function(data, status, req) {
											console.log("data:" + data);
											console.log("status:" + status);
											console.log("req:" + req.status);

											var str = "";
											if (checkImageType(data)) {
												str = "<div><a href='${path}/upload/displayFile?fileName="
														+ getImageLink(data)
														+ "'>";
												str += "<img src='${path}/upload/displayFile?fileName="
														+ data + "'></a>";
											} else {
												str = "<div>";
												str += "<a href='${path}/upload/displayFile?fileName="
														+ data
														+ "'>"
														+ getOriginalName(data)
														+ "</a>";
											}
											str += "<span data-src="+data+">[삭제]</span></div>";
											$(".uploadedList").append(str);
										}
									});
						});

		$(".uploadedList").on("click", "span", function(event) {
			var that = $(this);
			$.ajax({
				url : "${path}/upload/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						that.parent("div").remove();
					}
				}
			});
		});
		function getOriginalName(fileName) {
			if (checkImageType(fileName)) {
				return;
			}
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
		function getImageLink(fileName) {
			if (!checkImageType(fileName)) {
				return;
			}
			var front = fileName.substr(0, 12);
			var end = fileName.substr(14);
			return front + end;
		}
		function checkImageType(fileName) {
			var pattern = /jpg|png|jpeg/i;
			return fileName.match(pattern);
		}
	});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>Ajax File Upload</h2>
	<div class="fileDrop"></div>
	<div class="uploadedList"></div>

</body>
</html>