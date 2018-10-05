<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP Board WebSite</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID") !=null){
			userID=(String) session.getAttribute("userID");
		}
	%>
<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
		data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
		aria-expanded="false">
		<!-- 아이콘바는 작은 화면일경우 생성된다. -->
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="main.jsp">JSP Board WebSite</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active"><a href="main.jsp">Main</a></li>
			<li><a href="bbs.jsp">Board</a></li>
		</ul>
		<%//로그인이 되어있지않다면
			if(userID==null){
		%>		
			<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" 
				role="button" aria-haspopup="true" 
				aria-expanded="false">Connect<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
					</ul>
			</li>
		</ul>
		<%
			} else {
		%>
				<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" 
				role="button" aria-haspopup="true" 
				aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
			</li>
		</ul>
		<%		
			}
		%>
	</div>
</nav>
<div class="container">
<div class="jumbotron">
	<div class="container">
		<h1>Introduce WebSite</h1>
		<p>JSPPRO1239 반응형 JSP를 이용한 간단한 로그인 및 게시판입니다.</p>
		<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
	</div>
</div>
</div>
<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
			<li data-target="#myCarousel" data-slide-to="6"></li>
			<li data-target="#myCarousel" data-slide-to="7"></li>
			<li data-target="#myCarousel" data-slide-to="8"></li>
			<li data-target="#myCarousel" data-slide-to="9"></li>
			<li data-target="#myCarousel" data-slide-to="10"></li>
			<li data-target="#myCarousel" data-slide-to="11"></li>
		</ol>
		<div class="carousel-inner">
		  <div class="item active">
			<img src="images/1.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/2.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/3.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/4.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/5.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/6.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/7.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/8.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/9.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/10.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/11.jpg">		  
		  </div>
		  <div class="item">
			<img src="images/12.jpg">		  
		  </div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../include/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>