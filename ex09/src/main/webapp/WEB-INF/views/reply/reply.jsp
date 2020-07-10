<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>댓글목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		#divInput {padding-bottom:15px; background:gray; width:362px; margin-bottom:10px; padding:10px; border:3px solid pink;}
		.divContent {width:320px; padding:30px; background:gray; color:white; border:3px solid skyblue; margin-bottom:10px; font-size:15px;}
	</style>
</head>
<body>
	<h1>[댓글목록]</h1>
	<div id="divInput">
		댓글수 : <span id="count"></span>
		<input type="text" id="txtReply" size=39>
		<button id="btnInsert">입력</button>
	</div>
	<div id="tbl"></div>    
		<script id="temp" type="text/x-handlebars-template">
			{{#each list}}
			<div class="divContent">
				<div class="replydate">
					{{replydate}}
					{{replyer}}
					<button rno={{rno}}>삭제</button>
				</div>
				<div class="reply">{{reply}}</div>
			</div>
			{{/each}}
		</script>
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
</body>
<script>

var bno="${vo.bno}";

getList();


$("#pagination a").click(function(e){
	e.preventDefault();
	var page=$(this).attr("href");
	location.href="list?page="+page;
});

$("#tbl").on("click", ".replydate button", function(){
	var rno=$(this).attr("rno");
	if(!confirm(rno+" 를(을) 삭제하시겠습니까?")) return;
	
	$.ajax({
		type:"post",
		url:"/reply/delete",
		data:{"rno":rno},
		success:function(){
			getList();
			alert("똥을 삭제했습니다~");
		}
	});
});

$("#txtReply").keydown(function(key){
	if(key.keyCode==13) {
		$("#btnInsert").click();
	}
});

$("#btnInsert").on("click", function(){
	var reply=$("#txtReply").val();
	if(reply=="") {
		alert("댓을 내용을 입력하세요!");
		return;
	}
	var replyer="user00";
	$.ajax({
		type:"post",
		url:"/reply/insert",
		data:{"bno":bno, "reply":reply, "replyer":replyer},
		success:function(){
			getList();
			$("#txtReply").val("");
			alert("똥이 입력되었습니다.");
		}
	});
});



function getList() {
	
$.ajax({
	type : "get",
	url : "/reply/list",
	data:{"bno":bno},
	dataType : "json",
	success : function(data) {
		var temp = Handlebars.compile($("#temp").html());
		$("#tbl").html(temp(data));
		$("#count").html(data.count);
		}
	});
}
</script>
</html>