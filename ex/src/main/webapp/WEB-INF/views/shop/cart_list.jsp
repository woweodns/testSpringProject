<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--views/shop/cart_list.jsp  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>

<link href="${path}/summernote/summernote.css" rel="stylesheet">
<script src="${path}/summernote/summernote.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	function daumZipCode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;

						} else {
							fullAddr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						document.getElementById('zipcode').value = data.zonecode;
						document.getElementById('ad').value = fullAddr;

					}
				}).open();
	}
</script>


<script type="text/javascript">
	$(function() {
		$("#memo").summernote({
			height : 150,
			width : 800
		});
	});

	function memo_view(idx) {
		location.href = "${path}/memo/view/" + idx;
	}
</script>


<script type="text/javascript">
	$(function() {
		$("#btnList").click(function() {
			location.href = "${path}/shop/product/list.do";
		});
		$("#btnDelete").click(function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				location.href = "${path}/shop/cart/deleteAll.do";
			}
		});
	});
</script>

<script>
	$(function() {
		$("#btnBuy").click(function() {
			var userid = $("#writer").val(); 
			var memo = $("#memo").val();
			var hp = $("#hp").val();
			var ad = $("#ad").val();
			if (writer == "") {
				alert("이름 입력하세요.");
				$("#writer").focus(); 
				return; 
			}
			if (hp == "") {
				alert("연락처를 입력하세요.");
				$("#hp").focus();
				return;
			}
			if (ad == "") {
				alert("주소를 입력하세요.");
				$("#ad").focus();
				return;
			}
			document.form3.action = "${path}/memo/insert.do";
			document.form3.submit();
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
				style="background-image:url(${path}/resources/images/cart.jpg);">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<div class="display-t">
								<div class="display-tc animate-box" data-animate-effect="fadeIn">
									<h1>Cart_List</h1>

								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<div id="div1">
			<br>
			<h2>장바구니</h2>
			<c:choose>
				<c:when test="${map.count == 0}">
                 장바구니가 비었습니다.
                </c:when>
				<c:otherwise>
					<form name="form1" method="post"
						action="${path}/shop/cart/update.do">
						<table>
							<tr>
								<th>상품명</th>
								<th>단가</th>
								<th>수량</th>
								<th>금액</th>
								<th>&nbsp;</th>
							</tr>
							<c:forEach var="row" items="${map.list}">
								<tr>
									<td>${row.product_name}</td>
									<td>${row.price}</td>
									<td><input type="number" name="amount"
										value="${row.amount}"> <input type="hidden"
										name="cart_id" value="${row.cart_id}"></td>
									<td>${row.money}</td>
									<td><c:if test="${sessionScope.userid != null }">
											<a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">삭제</a>
										</c:if></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" align="center">장바구니 금액 합계 : ${map.sumMoney}<br>
									배송료 : ${map.fee}<br> 총합계 : ${map.sum}
								</td>
							</tr>
						</table>
						<button id="btnUpdate">수정</button>
						<button type="button" id="btnDelete">장바구니 비우기</button>
					</form>
				</c:otherwise>
			</c:choose>
			<br>
			<button type="button" id="btnList">상품목록</button>
			<br> <br>

			<h2>구매자 정보</h2>
			<form name="form2" method="post">
				우편번호 : <input name="zipcode" id="zipcode" readonly size="10">
				<input type="button" id="btn" onclick="daumZipCode()"
					value="우편번호 찾기">
			</form>
			<br>
			<form method="post" name="form3" action="${path}/memo/insert.do">
				<div id="div2">
					이름 : <input name="writer" id="writer" size="10"><br> <br>
					H P : <input name="hp" id="hp" size="20"><br> <br>
					주소 : <input name="ad" id="ad" size="60">
				</div>
				상품 정보 <br>
				<textarea rows="3" cols="50" name="memo" id="memo">
			          <table>
							<c:forEach var="row" items="${map.list}">
								<tr>
									<td>${row.product_name}</td>
									<td>${row.price}</td>
									<td><input type="number" name="amount"
									value="${row.amount}"> <input type="hidden"
									name="cart_id" value="${row.cart_id}"></td>
									<td>${row.money}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" align="center">장바구니 금액 합계 : ${map.sumMoney}<br>
									배송료 : ${map.fee}<br> 총합계 : ${map.sum}
								</td>
							</tr>
						</table>
			    </textarea>

				<input type="submit" id="btn" value="구매하기">
			</form>
			<%@ include file="../include/footer.jsp"%>
		</div>
	</div>
</body>
</html>