<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>학생정보</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		select {height:23px;}
	</style>
</head>
<body>
	<h1>[학생정보]</h1>
	<form name="frm" action="update" method="post">
	<input type="hidden" value="${page}" name="page">
	<table border=1>
		<tr>
			<th width=100>학생번호</th>
			<td width=400><input type="text" name="scode" value="${vo.scode}" readonly></td>
		</tr>
		<tr>
			<th width=100>학생이름</th>
			<td width=400><input type="text" name="sname" value="${vo.sname}"></td>
		</tr>
		<tr>
			<th width=100>학생학과</th>
			<td width=400>
				<select name="dept">
					<option <c:out value="${vo.dept=='전산'?'selected':''}"/>>전산</option>
					<option <c:out value="${vo.dept=='전자'?'selected':''}"/>>전자</option>
					<option <c:out value="${vo.dept=='건축'?'selected':''}"/>>건축</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width=100>학생학년</th>
			<td width=400><input type="text" name="year" value="${vo.year}"></td>
		</tr>
		<tr>
			<th width=100>생년월일</th>
			<td width=400><input type="text" name="birthday" value="${vo.birthday}"></td>
		</tr>
		<tr>
			<th width=100>지도교수</th>
			<td width=400>
				<input type="text" name="advisor" value="${vo.advisor}" readonly size=5>
				<select name="pname">
					<c:forEach items="${plist}" var="vo">
						<option value="${vo.pcode}">${vo.pcode} : ${vo.pname}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
	<input type="button" value="삭제" id="btnDel">
	<input type="button" value="목록" id="btnList">
	</form>
	<br>
	<div style="width:500px; background:gray; padding:10px; border:3px solid black;">
		<select id="lcode">
			<c:forEach items="${clist}" var="vo">
				<option value="${vo.lcode}">${vo.lname}-${vo.pname}</option>
			</c:forEach>
		</select>
		<input type="button" id="btnInsert" value="수강신청">
	</div>
	
	<table id="tbl" border=1></table>    
	<script id="temp" type="text/x-handlebars-template"> 
	<tr>
		<th width=40>Code</th>
		<th width=200>Name</th>
		<th width=100>Date</th>
		<th width=155>Grade</th>
	</tr>
	{{#each elist}}
	<tr class="row">
		<td class="lcode">{{lcode}}</td>
		<td>{{lname}}</td>
		<td>{{edate}}</td>
		<td>
			<input type="text" value="{{grade}}" class="grade" size=1>점
			<button class="btnUp">수정</button>
			<button class="btnDel">삭제</button>
		</td>
	</tr>
	{{/each}}
	</script>
	<div id="chart">
		<jsp:include page="chart.jsp"></jsp:include>
	</div>
</body>
<script>

var page="${page}";
var scode="${vo.scode}";

getList();

$("#tbl").on("click", ".row .btnDel", function(){
	var row=$(this).parent().parent();
	var lcode=row.find(".lcode").html();
	if(!confirm(lcode+" 을(를) 삭제하시겠습니까?")) return;
	
	$.ajax({
		type:"post",
		url:"/enroll/delete",
		data:{"lcode":lcode, "scode":scode},
		success:function(){
			alert("수강취소 되었습니다.");
			getList();
			changeChart();
		}
		
	});
});


$("#tbl").on("click", ".row .btnUp", function(){
	var row=$(this).parent().parent();
	var lcode=row.find(".lcode").html();
	var grade=row.find(".grade").val();
	//var scode=$(frm.scode).val();
	if(!confirm(lcode+" 의 점수 "+grade+" 을(를) 수정하시겠습니까?")) return;
	
	if(grade>100 || grade<0) {
		alert("1~100사이의 점수를 입력하세요.");
	} else {
	$.ajax({
		type:"post",
		url:"/enroll/update",
		data:{"lcode":lcode, "scode":scode, "grade":grade},
		success:function(){
			alert("수정되었습니다.");
			getList();
			changeChart();
		}
		
	});
	}
});

$("#btnInsert").on("click", function(){
	var lcode=$("#lcode").val();
	
	$.ajax({
		type:"get",
		url:"/enroll/read",
		data:{"lcode":lcode, "scode":scode},
		success:function(data){
			if(data==0) {
				$.ajax({
					type:"post",
					url:"/enroll/insert",
					data:{"lcode":lcode, "scode":scode},
					success:function(){
						alert("수강신청 되었습니다.");
						getList();
						changeChart();
					}
					
				});
			} else {
				alert("이미 수강신청중인 강좌입니다.");
			}
		}
	})
});


function getList() {
	
var scode=$(frm.scode).val();
$.ajax({
	type : "get",
	url : "/stu/listEnroll",
	data:{"scode":scode},
	dataType : "json",
	success : function(data) {
		var temp = Handlebars.compile($("#temp").html());
		$("#tbl").html(temp(data));
	}
});
}	
$(frm).submit(function(e){
	e.preventDefault();
	if(!confirm("수정하시겠습니까?")) return;
	frm.submit();
});

$("#btnDel").on("click", function(){
	var sname=$(frm.sname).val();
	if(!confirm(sname+"학생을 삭제하시겠습니까?")) return;
	$.ajax({
		type:"get",
		url:"/stu/enrollCount",
		data:{"scode":scode},
		dataType:"json",
		success:function(data){
			if(data==0){
			frm.action="delete";
			frm.submit();
		} else {
			alert(data + "과목을 수강신청했습니다.");
			}
		}
	});
});

$("#btnList").on("click", function(){
	location.href="list?page="+page;
});

	$(frm.pname).change(function(){
		var pcode=$(frm.pname).val();
		$(frm.advisor).val(pcode);
	});
</script>
</html>