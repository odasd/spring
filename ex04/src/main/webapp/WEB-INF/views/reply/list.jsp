<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>댓글목록</title>
	<style>
		.content {width:500px; background:gray; color:white; margin:10px; padding:10px; border-radius:5px; text-align:center;}
		.replydate {font-size:8px; font-weight:bold;}
		.active{color:red;}
	</style>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
	<h1>[댓글 목록]${pm.totalCount}</h1>
	<form action="insert" method="post">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="bno" value="201">
		<input type="hidden" name="replyer" value="user01">
		<input type="text" name="reply" size=50>
		<input type="submit" value="입력">
	</form>
	<c:forEach items="${list}" var="vo">
		<div class="content">
			<div class="replydate">
				<span class="rno">${vo.rno}</span>
				<span>
					${vo.replydate}
					<button>삭제</button>
				</span>
			</div>
			<div class="reply">${vo.reply}</div>
		</div>
	</c:forEach>
	<!--  기본구조
	<nav aria-label="...">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active" aria-current="page">
      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
    </li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
-->
<nav aria-label="...">
  <ul class="pagination">
  	<c:if test="${pm.prev}">
	    <li class="page-item"> 
	   	  <a class="page-link" href="${pm.startPage-1}" tabindex="-1" aria-disabled="true">Previous</a>
	    </li>
     </c:if>
    
    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	<c:if test="${cri.page==i}">
    <li class="page-item"><a class="active" href="${i}">${i}</a></li>
    </c:if>
    <c:if test="${cri.page!=i}">
    <li class="page-item"><a class="page-link" href="${i}">${i}</a></li>
    </c:if>
	</c:forEach>
	
    <c:if test="${pm.next}">
    <li class="page-item">
      <a class="page-link" href="${pm.endPage+1}">Next</a>
    </li>
    </c:if>
  </ul>
</nav>
	<!--  기존 페이지버튼
	<div id="pagination">
		<c:if test="${pm.prev}">
			<a href="${pm.startPage-1}">◀</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${cri.page==i}">
				<a href="${i}" class="active">[${i}]</a>
			</c:if>
			<c:if test="${cri.page!=i}">
				<a href="${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="${pm.endPage+1}">▶</a>
		</c:if>
	</div>
	-->
</body>
<script>

	//기존
	$("#pagination").on("click", "a", function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
	//부트스트랩 페이지버튼
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
	
	//삭제
	$(".replydate").on("click", "button", function(){
		var rno=$(this).parent().parent().find(".rno").html();
		var page="${cri.page}";
		if(!confirm(rno+ " 을(를) 삭제하시겠습니까?")) return;
		location.href="delete?rno="+rno+"&page="+page;
	});
</script>
</html>