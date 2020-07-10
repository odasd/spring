<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교수목록</title>
</head>
<body>
	<h1>[교수 목록]</h1>
	<table border=1>
			<tr>
				<td width=100>교수번호</td>
				<td width=100>교수이름</td>
				<td width=100>교수학과</td>
				<td width=100>교수직급</td>
				<td width=100>임용일자</td>
				<td width=100>교수급여</td>
			</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td width=100>${vo.pcode}</td>
				<td width=100>${vo.pname}</td>
				<td width=100>${vo.dept}</td>
				<td width=100>${vo.title}</td>
				<td width=100>${vo.hiredate}</td>
				<td width=100>${vo.salary}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>