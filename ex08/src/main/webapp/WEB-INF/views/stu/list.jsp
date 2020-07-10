<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>학생목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		a{text-decoration:none; color:green;}
		.active {color:red; font-size: 20px; font-style: bold;}
	</style>
</head>
<body>
	<h1>[학생목록]</h1>
	<table border=1 id="tbl2">
		<tr>
			<th width=100>학생코드</th>
			<th width=100>학생이름</th>
			<th width=100>학생학과</th>
			<th>수강신청</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="scode">${vo.scode}</td>
			<td class="sname">${vo.sname}</td>
			<td>${vo.dept}</td>
			<td><button>수강신청</button></td>
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
    <hr>
    <div id="courses">
    	<span id="scode"></span>&nbsp;:
    	<span id="sname"></span>
    	<select id="lcode">
    		<c:forEach items="${clist}" var="vo">
    			<option value="${vo.lcode}">${vo.lcode} : ${vo.lname}</option>
    		</c:forEach>
    	</select>
    	<input type="button" value="신청" id="btnInsert">
    </div>
    <table id="tbl" border=1></table>    
	<script id="temp" type="text/x-handlebars-template"> 
		<tr>
			<th width=100>강좌번호</th>
			<th width=200>강좌이름</th>
			<th width=100>수강신청일</th>
			<th width=40>점수</th>
			<th>수강취소</th>
		</tr>
		{{#each .}}
			<tr class="row">
				<td class="lcode">{{lcode}}</td>
				<td>{{lname}}</td>
				<td>{{edate}}</td>
				<td>{{grade}}</td>
				<td><button>수강취소</button></td>
			</tr>
		{{/each}}
	</script>
</body>
<script>
var scode, sname;

$("#courses").hide();

$("#tbl").on("click", ".row button", function(){
	var lcode=$(this).parent().parent().find(".lcode").html();
	if(!confirm(scode+lcode+" 강좌를 수강취소하시겠습니까?")) return;
	
	$.ajax({
		type : "post",
		url : "/enroll/delete",
		data:{"scode":scode, "lcode":lcode},
		success : function() {
			alert(lcode+" 강좌가 삭제되었습니다.");
			getList();
			}
		});
});

$("#btnInsert").click(function(){
	lcode=$("#lcode").val();
	if(!confirm(scode+lcode+" 강좌를 수강신청하시겠습니까?")) return;
	
	
	$.ajax({
		type : "post",
		url : "/enroll/insert",
		data:{"scode":scode,"lcode":lcode},
		success : function(count) {
			if(count==0) {
			alert("수강신청 되었습니다.");
			getList();
			} else {
				alert("중복된 신청입니다.");
			}
		}
	});
});

$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="list?page="+page;
});


$("#tbl2").on("click", ".row button", function(){
	var row=$(this).parent().parent();
	scode=row.find(".scode").html();
	sname=row.find(".sname").html();
	$("#scode").html(scode);
	$("#sname").html(sname);
	$("#courses").show();
	getList();
});

function getList() {
	
$.ajax({
	type : "get",
	url : "/stu/rest/elist",
	data:{"scode":scode},
	dataType : "json",
	success : function(data) {
		var temp = Handlebars.compile($("#temp").html());
		$("#tbl").html(temp(data));
		}
	});
}
</script>
</html>