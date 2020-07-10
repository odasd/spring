<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>[게시글 보기]</h1>
	<form name="frm" action="update" method="post">
	<input type="hidden" name="page" value="${param.page}">
	<table border=1>
		<tr>
			<td>NO.</td>
			<td><input type="text" name="bno" value="${vo.bno}" readonly></td>
		</tr>
		<tr>
			<td>Title</td>
			<td><input type="text" name="title" value="${vo.title}"></td>
		</tr>
		<tr>
			<td>Writer</td>
			<td><input type="text" name="writer" value="${vo.writer}" readonly></td>
		</tr>
		<tr>
			<td>RegDate</td>
			<td><input type="text" name="regdate" value="${vo.regdate}" readonly></td>
		</tr>
		<tr>
			<td>Updatedate</td>
			<td><input type="text" name="updatedate" value="${vo.updatedate}" readonly></td>
		</tr>
		<tr>
			<td colspan=2><textarea cols="80" rows="10" name="content">${vo.content}</textarea></td>
		</tr>
	</table>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
	<input type="button" value="삭제" id="btnDel">
	<input type="button" value="목록" id="btnList">
	</form>
	<br>
	<hr>
	<jsp:include page="../reply/reply.jsp"/>
</body>
<script>

	var page;
	//목록
	$("#btnList").on("click", function(){
		page=$(frm.page).val();
		location.href="list?page="+page;
	});

	//삭제
	$("#btnDel").on("click", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		var bno=$(frm.bno).val();
		page=$(frm.page).val();
		$.ajax({
			type:"post",
			url:"/board/delete",
			data:{"page":page, "bno":bno},
			success:function(count){
				if(count==0) {
					alert("삭제되었습니다.");
					location.href="list?page="+page;
				} else {
					alert("똑바로 보쇼!");
				}
			}
		});
	});
	/*
	$("#btnDel").on("click", function(){
	
	if(!confirm("삭제하시겠습니까?")) return;
	frm.method="post";
	frm.action="delete";
	frm.submit();
	
	});
	*/
	
	//수정
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	});
		
	
</script>
</html>