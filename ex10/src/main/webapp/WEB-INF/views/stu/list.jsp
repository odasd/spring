<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>학생목록</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<style>
		a{text-decoration:none; color:green;}
		.active{color:red; font-size:25px;}
		.row{cursor:pointer;}
		.row:hover{background:gray; color:white;}
	</style>
</head>
<body>
	<h1>[학생목록]</h1>
	학생수 : ${pm.totalCount}
	<table border=1 id="tbl">
		<tr>
			<th width=100>학생번호</th>
			<th width=100>학생이름</th>
			<th width=100>학생학과</th>
			<th width=100>학생학년</th>
			<th width=150>생년월일</th>
			<th width=100>지도교수</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="scode">${vo.scode}</td>
			<td>${vo.sname}</td>
			<td>${vo.dept}</td>
			<td>${vo.year}</td>
			<td>${vo.birthday}</td>
			<td>${vo.pname}(${vo.advisor})</td>
		</tr>
		</c:forEach>
	</table>
	<div id="pagination">
        <c:if test="${pm.prev}">
            <a href="${pm.startPage-1}">◀</a>
        </c:if>
        <c:forEach begin="${pm.startPage}"  end="${pm.endPage}" var="i">
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
$("#pagination").on("click", "a", function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="list?page="+page;
});

$("#tbl").on("click", ".row", function(){
	
	var scode=$(this).find(".scode").html();
	var page=$(".active").html();
	location.href="read?scode="+scode+"&page="+page;
});
</script>
</html>