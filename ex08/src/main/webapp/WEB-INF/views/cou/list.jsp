<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>강좌목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		a{text-decoration:none; color:green;}
		.active {color:red; font-size: 20px; font-style: bold;}
	</style>
</head>
<body>
	<h1>[강좌목록]</h1>
	<table border=1 id="tbl2">
		<tr>
			<th width=100>강좌코드</th>
			<th width=250>강좌이름</th>
			<th width=100>담당교수</th>
			<th>수강학생</th>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="row">
			<td class="lcode">${vo.lcode}</td>
			<td class="lname">${vo.lname}</td>
			<td>${vo.pname}</td>
			<td><button>수강학생</button></td>
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
    <div id="courses">
    	<span id="lcode"></span>&nbsp;:
    	<span id="lname"></span>
   
    <hr>
    <table id="tbl" border=1></table>    
	<script id="temp" type="text/x-handlebars-template"> 
		<tr>
			<th width=100>학생번호</th>
			<th width=200>학생이름</th>
			<th width=100>수강신청일</th>
			<th width=40>점수</th>
			<th>점수수정</th>
		</tr>
		{{#each .}}
			<tr class="row">
				<td class="scode">{{scode}}</td>
				<td>{{sname}}</td>
				<td>{{edate}}</td>
				<td><input type="text" value="{{grade}}" size=1 class="grade"></td>
				<td><button>점수수정</button></td>
			</tr>
		{{/each}}
	</script>
	 </div>
</body>
<script>

var lcode;
$("#courses").hide();

$("#tbl2").on("click", ".row button", function(){
	var row=$(this).parent().parent();
	lcode=row.find(".lcode").html();
	var lname=$(this).parent().parent().find(".lname").html();
	
	$("#lcode").html(lcode);
	$("#lname").html(lname);
	$("#courses").show();
	getList();
});


$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="list?page="+page;
});


function getList() {
	
	$.ajax({
		type : "get",
		url : "/cou/rest/slist",
		data:{"lcode":lcode},
		dataType : "json",
		success : function(data) {
			var temp = Handlebars.compile($("#temp").html());
			$("#tbl").html(temp(data));
			}
		});
	}
	
$("#tbl").on("click", ".row button", function(){
	var scode=$(this).parent().parent().find(".scode").html();
	var grade=$(this).parent().parent().find(".grade").val();
	
	if(!confirm(grade+" 수정하시겠습니까?")) return;
	
	if(grade>100 || grade<0) {
		alert("올바른 점수를 입력하세요!");
	} else {
		$.ajax({
			type : "post",
			url : "/enroll/update",
			data:{"scode":scode, "lcode":lcode, "grade":grade},
			success : function() {
				alert(grade+" 점수가 수정되었습니다.");
				getList();
				}
			});
	}
});
/* 꿀-꺽
$("#tbl").on("click", ".row button", function(){
      if(!confirm("수정하시겠습니까?"))return;
      scode=$(this).parent().parent().find(".scode").html();
      grade=$(this).parent().parent().find(".grade").val();
      
      if(grade<0 || grade>100){
         alert("점수를 0~100 사이의 값을 입력하세요.");
         $(this).parent().parent().find(".grade").focus();
         preGrade=$(this).parent().parent().find(".grade").attr("pre");
         $(this).parent().parent().find(".grade").val(preGrade);
      }else{
         $.ajax({
            type:"post",
            url:"/enroll/update",
            data:{"lcode":lcode, "scode":scode, "grade":grade},
            success:function(){
               alert("수정되었습니다.");
            }
         });
      }
   });
   */
</script>
</html>