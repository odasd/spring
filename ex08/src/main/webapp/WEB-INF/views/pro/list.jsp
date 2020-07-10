<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>교수목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>[교수목록]</h1>
	<table border=1 id="tbl2">
		<tr>
			<th width=100>교수번호</th>
			<th width=100>교수이름</th>
			<th width=100>교수학과</th>
			<th>담당학생</th>
		</tr>
	<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="pcode">${vo.pcode}</td>
			<td>${vo.pname}</td>
			<td>${vo.dept}</td>
			<td><button>담당학생</button></td>
		</tr>
	</c:forEach>
	</table>
	
	<div id="info">
	<hr>
	<h1>[학생정보]</h1>
	<table id="tbl" border=1></table>    
	<script id="temp" type="text/x-handlebars-template">
	<tr>
		<td>학생번호</td>
		<td>학생이름</td>
		<td>학생학과</td>
		<td>수강정보</td>
	</tr>
	{{#each slist}}
	<tr class="row">
		<td>{{scode}}</td>
		<td>{{sname}}</td>
		<td>{{dept}}</td>
		<td><button>수강정보</button></td>
	</tr>
	{{/each}}
	</script>
	<br>
	<h1>[강좌정보]</h1>
	<table id="tbl3" border=1></table>    
	<script id="temp3" type="text/x-handlebars-template">
	<tr>
		<td>강좌번호</td>
		<td>강좌이름</td>
		<td>강의실</td>
	</tr>
	{{#each clist}}
	<tr>
		<td>{{lcode}}</td>
		<td>{{lname}}</td>
		<td>{{room}}</td>
	</tr>
	{{/each}}
	</script>
	</div>
</body>
<script>


$("#info").hide();

$("#tbl2").on("click", ".row button", function(){
	var pcode=$(this).parent().parent().find(".pcode").html();
	
$.ajax({
	type : "get",
	url : "/pro/plist",
	data:{"pcode":pcode},
	dataType : "json",
	success : function(data) {
		var temp = Handlebars.compile($("#temp").html());
		$("#tbl").html(temp(data));
		
		var temp = Handlebars.compile($("#temp3").html());
		$("#tbl3").html(temp(data));
		
		$("#info").show();
		}
	});
	
	
});
</script>
</html>