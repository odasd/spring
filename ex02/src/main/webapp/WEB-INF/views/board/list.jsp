<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		.row:hover{background:gray; color:white;}
		.row{cursor:pointer;}
	</style>
</head>
<body>
	<h1>게시판 목록</h1>
	<a href="insert">글쓰기</a>
	<table border=1 id="tbl">
		<tr>
			<td width=100>글번호</td>
			<td width=150>제목</td>
			<td width=150>내용</td>
			<td width=150>작성자</td>
			<td width=150>게시일</td>
			<td width=150>수정일</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="bno">${vo.bno}</td>
			<td>${vo.title}</td>
			<td>${vo.content}</td>
			<td>${vo.writer}</td>
			<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy년MM월dd일"/></td>
			<td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy년MM월dd일"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
<script>
	$(".row").on("click", function(){
		var bno=$(this).find(".bno").html();
		location.href="read?bno=" + bno;
	});
</script>
</html>