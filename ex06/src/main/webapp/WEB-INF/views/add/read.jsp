<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주소 보기</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		.row {cursor:pointer;}
	</style>
</head>
<body>
	<h1>[주소 보기]</h1>
	<form action="update" method="post" name="frm">
	<table border=1>
		<input type="hidden" name="id" value="${vo.id}">
		<tr>
			<td width=100>Name : </td>
			<td width=400><input type="text" name="name" value="${vo.name}"></td>
		</tr>
		<tr>
			<td width=100>Address : </td>
			<td width=400><input type="text" name="address" size=53 value="${vo.address}"></td>
		</tr>
		<tr>
			<td width=100>Telephone : </td>
			<td width=400><input type="text" name="tel" value="${vo.tel}"></td>
		</tr>
	</table>
	<input type="submit" value="수정">
	<input type="button" value="삭제" id="btnDelete">
	<input type="reset" value="취소">
	<input type="button" value="목록" onClick="location.href='list'">
	</form>
</body>
<script>
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	});
	
	$("#btnDelete").on("click", function(e){
		e.preventDefault();
		if(!confirm("삭제하시겠습니까?")) return;
		frm.action="delete";
		frm.submit();
	});
</script>
</html>