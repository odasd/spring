<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
.box {	width: 100px;	height: 150px;	padding: 5px;	margin: 5px;	background: gray;	color: white;	float: left;	font-size: 15px;}
a {	color: black; text-decoration:none;}
.active {color:red; font-size:23px;}
select {height:23px;}
</style>
</head>
<body>
	<h1>[상품목록]</h1>
	상품갯수 : <span id="total">${pm.totalCount}</span>
	<div>
		<form name="frm" action="list">
			<select name="searchType">
				<option value="pcode" <c:out value="${cri.searchType=='pcode'?'selected':''}"/>>상품코드</option>
				<option value="pname" <c:out value="${cri.searchType=='pname'?'selected':''}"/>>상품이름</option>
				<option value="price" <c:out value="${cri.searchType=='price'?'selected':''}"/>>상품가격</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="검색">
		</form>
	</div>
	<div style="width: 480px; background: skyblue; overflow: hidden;">
		<c:forEach items="${list}" var="vo">
			<div class="box">
				<c:if test="${vo.image!=null && vo.image!=''}">
					<img src="/display?fileName=${vo.image}" width=100 height=80>
				</c:if>
				<c:if test="${vo.image==null || vo.image==''}">
					<img src="http://placehold.it/100x80" width=100 height=80>
				</c:if>
				<div>
					<a href="read?pcode=${vo.pcode}">${vo.pcode}</a>
				</div>
				<div>${vo.pname}</div>
				<div>${vo.price}원</div>
			</div>
		</c:forEach>
	</div>
	<button onclick="location.href='insert'">상품등록</button>
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
$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="list?page="+page;
});
</script>
</html>