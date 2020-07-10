<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>학생목록</title>
</head>
<body>
	<h1>학생목록</h1>
	<c:forEach items="${slist}" var="vo">
		<div>${vo.scode}:${vo.sname}:${vo.dept}</div>
	</c:forEach>
</body>
</html>