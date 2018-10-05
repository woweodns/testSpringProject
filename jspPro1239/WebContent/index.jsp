<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/custom.css">
<title>JSP Board WebSite</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
</head>
<!-- index 페이지를 자동실행하면서 script에서 longin.jsp로 자동이동 -->
<body>
 	<script>
		location.href = "main.jsp"; 	
 	</script>
</body>
</html>