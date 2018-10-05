<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	google.load("visualization", "1", {
		"packages" : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var jsonData = $.ajax({
			url : "${path}/chart/cart_money_list.do",
			dataType : "json",
			async : false
		}).responseText;
		console.log(jsonData);
		var data = new google.visualization.DataTable(jsonData);
		console.log("데이터 테이블:" + data);
		var chart = new google.visualization.ColumnChart(document
				.getElementById("chart_div"));
		chart.draw(data, {
			title : "판매량 차트",
			width : 600,
			height : 440
		});
	}
</script>
</head>
<body>
	<div id="page">
		<div>
			<%@ include file="../include/menu.jsp"%>
			<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm"
				role="banner"
				style="background-image:url(${path}/resources/images/chart2.jpg);">
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

		<div id="div3">
		    <br><br><br><br><br>
			<div id="chart_div"></div>
			<button id="btn" type="button" onclick="drawChart">refresh</button>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>
</body>
</html>