<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		a {color:green; text-decoration:none;}
		.active {color:red; font-size:25px;}
	</style>
</head>
<body>
	<h1>[Board List]</h1>
	전체글수 : ${pm.totalCount}
	<table border=1 id="tbl">
		<tr>
			<th width=50>No.</th>
			<th width=200>Title</th>
			<th width=300>Content</th>
			<th width=100>Writer</th>
			<th width=250>Regdate</th>
			<th width=250>Updatedate</th>
			<th>글읽기</th>
		</tr>
	<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="bno">${vo.bno}</td>
			<td>${vo.title}</td>
			<td>${vo.content}</td>
			<td>${vo.writer}</td>
			<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy년MM월dd일 kk시mm분ss초"/></td>
			<td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy년MM월dd일 kk시mm분ss초"/></td>
			<td><button>글읽기</button></td>
		</tr>
	</c:forEach>
	</table>
	<div id="pagination">
        <c:if test="${pm.prev}">
            <a href="${pm.startPage-1}">◀</a>
        </c:if>
        <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
            <c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active'>${i}</a>]
            </c:if>
            <c:if test="${pm.cri.page != i }">
                [<a href="${i}">${i}</a>]
            </c:if>
        </c:forEach>
        <c:if test="${pm.next}">
            <a href="${pm.endPage+1}">▶</a>
        </c:if>
    </div>
</body>
<script>



$("#tbl").on("click", ".row button", function(){
	var bno=$(this).parent().parent().find(".bno").html();
	var page=$("#pagination .active").attr("href");
	
	location.href="read?bno="+bno+"&page="+page;
});

$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="list?page="+page;
});




</script>
</html>