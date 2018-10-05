<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDTO" %>
<%@ page import="bbs.BbsDAO" %>
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
		if(userID==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int bbsID=0;
		if(request.getParameter("bbsID") !=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		BbsDTO bbs=new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
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
			<li><a href="main.jsp">Main</a></li>
			<li class="active"><a href="bbs.jsp">Board</a></li>
		</ul>
		
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
	</div>
</nav>
	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
			 <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			 	<thead>
			 			<tr>
			 				<th colspan="2" style="background-color: #eeeeee; text-align: center;">Board Edit Form</th>
			 			</tr>
				 </thead>
				 <tbody>
				 		<tr>
				 			<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
				 		</tr>
				 		<tr>
				 			<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="50" maxlength="2050" style="height: 350px;"><%=bbs.getBbsContent()%></textarea></td>
				 		</tr>
				 </tbody>
			 </table>
			 <input type="submit" class="btn btn-primary pull-right" value="글수정">
			</form>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../include/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>