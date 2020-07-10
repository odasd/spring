<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생목록</title>
</head>
<body>
	
	<h1>[학생 목록]</h1>
	<a href="insert">입력</a>
	<a href="/pro/list">교수목록</a>
	<table border=1>
			<tr>
				<td width=100>학생번호</td>
				<td width=100>학생이름</td>
				<td width=100>학생학과</td>
				<td width=100>학생학년</td>
				<td width=100>학생생일</td>
				<td width=100>담당교수</td>
				<td width=100>담당교수명</td>
			</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td width=100>${vo.scode}</td>
				<td width=100>${vo.sname}</td>
				<td width=100>${vo.dept}</td>
				<td width=100>${vo.year}</td>
				<td width=100>${vo.birthday}</td>
				<td width=100>${vo.advisor} : ${vo.pname}</td>
				<td width=100>${vo.pname}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>