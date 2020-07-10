<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>보낸 메세지</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>Send Message</h1>
	 <div style="margin-bottom:10px;"> 
		<table border=1>
			<tr>
				<th width=100>보낸이:</th>
				<td><span id=name></span>&nbsp;&nbsp;포인트:<span id="point"></span>점</td>
			</tr>
			<tr>
				<th>받는이 :</th>
				<td><select style="height: 22px;" id="receiver">
						<c:forEach items="${list}" var="vo">
							<c:if test="${vo.id!=param.id}">
								<option value="${vo.id}">${vo.id}-${vo.name}</option>
							</c:if>
						</c:forEach>
						
				</select></td>
			</tr>
			<tr>
				<th>내용:</th>
				<td><input type="text" size=50 id="message"></td>
			</tr>
		</table>
		
	 	<input type="button" value="보내기" id="btnSend">  
	 	<button onClick="location.href='list'">목록</button> 
	  </div>
	  <hr>
	  <table id="tbl" border=1></table>    
	  <script id="temp" type="text/x-handlebars-template"> 
				<tr>
					<th>NO.</th>
					<th>Receiver</th>
					<th>Message</th>
					<th>status</th>
					<th>delete</th>
				</tr>		
			{{#each .}}
				<tr class="row">
					<td class="mid">{{mid}}</td>
					<td width=150>{{receiver}}:{{name}}</td>
					<td width=322>{{message}}</td>
					<td>{{{printStyle readDate}}}</td>
					<td><button>삭제</button></td>
				</tr>
			{{/each}}
	  </script>
	  
</body>
<script>
var id="${vo.id}";

	var name="${vo.name}";
	var point="${vo.point}";
	$("#name").html(name);
	$("#point").html(point);
	
	 Handlebars.registerHelper("printStyle", function(readDate){
	      var src;
	      if(readDate==null) {
	    	  src="<b>[읽지 않음]</b>";
	      } else {
	    	  src="<b>[읽음]</b>";
	      }
	      return src
	   })
	
	getList();
	
	function getList() {
		
	$.ajax({
		type : "get",
		url : "/list/send",
		data:{"id":id},
		dataType : "json",
		success : function(data) {
			var temp = Handlebars.compile($("#temp").html());
			$("#tbl").html(temp(data));
			}
		});
	}
	
	$("#message").keydown(function(key){
		if(key.keyCode==13){
			$("#btnSend").click();
		}	
	});
	
	$("#btnSend").on("click", function(){
		var sender=id;
		var receiver=$("#receiver").val();
		var message=$("#message").val();
		if(message=="") {
			alert("메세지 내용을 입력하세요.");
			
			return;
		}
		
		$.ajax({
			type : "post",
			url : "/message/insert",
			data:{"sender":sender, "receiver":receiver, "message":message},
			success : function() {
				alert("전송되었습니다.");
				$("#message").val("");
				var point=parseInt($("#point").html());
				$("#point").html(point+10);
				getList();
				}
			});
	});
	
	
	$("#tbl").on("click", ".row button", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		var mid=$(this).parent().parent().find(".mid").html();
		
		$.ajax({
			type:"get",
			url:"/message/sdelete",
			data:{"mid":mid},
			success:function(){
				alert("삭제되었습니다.");
				getList();
			}
		});
	});
</script>
</html>