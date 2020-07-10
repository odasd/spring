<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
.box {	width: 200px;	height: 400px;	padding: 5px;	margin: 5px;	background: gray;	color: white;	float: left;	font-size: 15px;}
a {	color: black; text-decoration:none;}
.active {color:red; font-size:23px;}
select {height:23px;}
</style>
</head>
<body>
	<h1>[숙소목록]</h1>
	<button onclick="location.href='airbnb'">숙소보기</button>
	<table border=1>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>
					<img src="/display?fileName=${vo.image}" width=150>
				</td>
				<td>
					<div>${vo.title}</div>
					<div>${vo.rating}</div>
					<div>${vo.city}</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!--  
	<div style="width: 480px; background: skyblue; overflow: hidden;">
		<c:forEach items="${list}" var="vo">
			<div class="box">
				<c:if test="${vo.image!=null && vo.image!=''}">
					<img src="/display?fileName=${vo.image}" width=200 height=150>
				</c:if>
				<c:if test="${vo.image==null || vo.image==''}">
					<img src="http://placehold.it/100x120" width=200 height=150>
				</c:if>
				<div>${vo.title}</div><hr>
				<div>${vo.info}</div><hr>
				<div>${vo.rating}</div><hr>
				<div>${vo.city}</div>
			</div>
		</c:forEach>
	</div>
	<button onclick="location.href='airbnb'">숙소보기</button>
	-->
</body>
<script>

</script>
</html>