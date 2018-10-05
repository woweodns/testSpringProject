<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/board/view.jsp -->
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
		listReply2();

		$("#btnReply").click(function() {
			var replytext = $("#replytext").val(); 
			var bno = "${dto.bno}"; 
			var param = {
				"replytext" : replytext,
				"bno" : bno
			};
			$.ajax({
				type : "post",
				url : "${path}/reply/insert.do",
				data : param,
				success : function() {
					alert("댓글이 등록되었습니다.");
					listReply2(); 
				}
			});
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

		$("#btnList").click(function() {
			location.href = "${path}/board/list.do";
		});
		$("#btnUpdate").click(
				function() {
					var str = "";
					$("#uploadedList .file").each(
							function(i) {
								str += "<input type='hidden' name='files[" + i
										+ "]' value='" + $(this).val() + "'>";
							});
					$("#form1").append(str);
					document.form1.action = "${path}/board/update.do";
					document.form1.submit();
				});
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/board/delete.do";
				document.form1.submit();
			}
		});

		listAttach();

		$("#uploadedList").on("click", ".file_del", function(e) {
			var that = $(this); 
			$.ajax({
				type : "post",
				url : "${path}/upload/deleteFile",
				data : "fileName=" + $(this).attr("data-src"),
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						that.parent("div").remove();
					}
				}
			});
		});
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

	});
	function listReply() {
		$.ajax({
			type : "get",
			url : "${path}/reply/list.do?bno=${dto.bno}",
			success : function(result) {
				$("#listReply").html(result);
			}
		});
	}
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute
				+ ":" + second;
		return strDate;
	}
	function listReply2() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "${path}/reply/list_json.do?bno=${dto.bno}",
			success : function(result) {
				console.log(result);
				var output = "<table>";
				for ( var i in result) {
					var repl = result[i].replytext;
					repl = repl.replace(/  /gi, "&nbsp;&nbsp;");
					repl = repl.replace(/</gi, "&lt;"); 
					repl = repl.replace(/>/gi, "&gt;");
					repl = repl.replace(/\n/gi, "<br>"); 

					output += "<tr><td>" + result[i].name;
					date = changeDate(result[i].regdate);
					output += "(" + date + ")";
					output += "<br>" + repl + "</td></tr>";
				}
				output += "</table>";
				$("#listReply").html(output);
			}
		});
	}
	
	function listAttach() {
		$
				.ajax({
					type : "post",
					url : "${path}/board/getAttach/${dto.bno}",
					success : function(list) {
						$(list)
								.each(
										function() {
											var fileInfo = getFileInfo(this);
											var html = "<div><a href='"+fileInfo.getLink+"'>"
													+ fileInfo.fileName
													+ "</a>&nbsp;&nbsp;";
											<c:if test="${sessionScope.userid == dto.writer}">
											html += "<a href='#' class='file_del' data-src='"
					+this+"'>[삭제]</a></div>";
											</c:if>
											$("#uploadedList").append(html);
										});
					}
				});
	}
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
			<h2>후기</h2>
			<form id="form1" name="form1" method="post"
				action="${path}/board/insert.do">
				<div>
					제목 <input name="title" id="title" size="80" value="${dto.title}"
						placeholder="제목을 입력하세요">
				</div>
				<div>조회수 : ${dto.viewcnt}</div>
				<div style="width: 800px;">
					내용
					<textarea id="content" name="content" rows="3" cols="80"
						placeholder="내용을 입력하세요">${dto.content}</textarea>
					<script>
						//ckeditor 적용
						CKEDITOR.replace("content", {
							filebrowserUploadUrl : "${path}/imageUpload.do",
							height : "300px"
						});
					</script>
				</div>
				<div>
					첨부파일을 등록하세요
					<div class="fileDrop"></div>
					<div id="uploadedList"></div>
				</div>
				<div style="width: 700px; text-align: center;">
					<input type="hidden" name="bno" value="${dto.bno}">

					<c:if test="${sessionScope.userid == dto.writer}">
						<button type="button" id="btnUpdate">수정</button>
						<button type="button" id="btnDelete">삭제</button>
					</c:if>

					<c:if test="${sessionScope.admin_userid != null }">
						<button type="button" id="btnDelete">삭제</button>
					</c:if>

					<button type="button" id="btnList">목록</button>
				</div>
			</form>
			<!-- 댓글 작성 -->
			<div style="width: 700px; text-align: center;">
				<c:if test="${sessionScope.userid != null }">
					<textarea rows="5" cols="70" id="replytext" placeholder="댓글을 작성하세요"></textarea>
					<br>
					<button type="button" id="btnReply">댓글쓰기</button>
				</c:if>
			</div>
			<!-- 댓글 목록 -->
			<div id="listReply"></div>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>

</body>
</html>
