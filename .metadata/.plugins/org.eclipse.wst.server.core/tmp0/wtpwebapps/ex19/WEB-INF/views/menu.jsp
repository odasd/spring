<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<style>
		.item {text-decoration:none; margin-left:50px;}
	</style>


<div id="divMenu">
	
	<c:if test="${id!=null}">
		<span class="item"><a href="/account/list?id=${id}">나의통장</a></span>
		<span class="item"><a href="/user/receive?id=${id}">받은 메세지함</a></span>
		<span class="item"><a href="/user/send?id=${id}">보낸 메세지함</a></span>
		${id}님
		<span class="item"><a href="/user/logout">로그아웃</a></span>
	</c:if>
	
	<c:if test="${id==null}">
		<span class="item"><a href="/user/login">로그인</a></span>
	</c:if>
</div>