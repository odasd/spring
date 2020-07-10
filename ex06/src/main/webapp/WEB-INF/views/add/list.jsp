<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주소목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
</head>
<body>
	<h1>[주소 목록]</h1>
	<button onClick="location.href='insert'">주소등록</button>
	<table border=1>
		<tr>
			<th width=50>NO.</th>
			<th width=100>Name</th>
			<th width=300>Address</th>
			<th width=150>Tel</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="id">${vo.id}</td>
			<td>${vo.name}</td>
			<td>${vo.address}</td>
			<td>${vo.tel}</td>
		</tr>
		</c:forEach>
	</table>
</body>
<script>
	
	$(".row").on("click", function(){
		var id=$(this).find(".id").html();
		location.href="read?id="+id;
	});
</script>
</html>