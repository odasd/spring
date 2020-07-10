<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
	<h1>[회원목록]</h1>
	<table border=1 id="tbl">
		<tr>
			<th width=100>아이디</th>
			<th width=100>비밀번호</th>
			<th width=100>이름</th>
			<th width=25>Point</th>
			<th>Send</th>
			<th>Receive</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="id">${vo.id}</td>
			<td>${vo.pass}</td>
			<td>${vo.name}</td>
			<td>${vo.point}</td>
			<td><button class="btnSend">Send</button></td>
			<td><button class="btnReceive">Receive</button></td>
		</tr>
		</c:forEach>
	</table>
</body>
<script>
	$("#tbl").on("click", ".row .btnSend",function(){
		var row=$(this).parent().parent();
		var id=row.find(".id").html();
		
		location.href="send?id="+id;
	});
	
	$("#tbl").on("click", ".row .btnReceive",function(){
		var row=$(this).parent().parent();
		var id=row.find(".id").html();
		
		location.href="receive?id="+id;
	});
</script>
</html>