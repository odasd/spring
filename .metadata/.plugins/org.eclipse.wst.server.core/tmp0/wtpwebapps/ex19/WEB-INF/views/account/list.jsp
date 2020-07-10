<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>계좌목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<hr>
	<h1>[계좌목록]</h1>
	<table border=1>
		<tr>
			<th width=100>계정</th>
			<th width=100>계좌번호</th>
			<th width=150>계좌개설일</th>
			<th width=100>잔액</th>
			<th width=100>성명</th>
			<th>거래내역</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.id}</td>
				<td>${vo.ano}</td>
				<td><fmt:formatDate value="${vo.openDate}" pattern="yyyy년MM월dd일"/></td>
				<td><fmt:formatNumber value="${vo.balance}" pattern="#,###원"/></td>
				<td>${vo.name}</td>
				<td><button onClick="location.href='read?ano=${vo.ano}'">거래내역</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>