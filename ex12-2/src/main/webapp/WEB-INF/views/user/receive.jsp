<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>받은 메세지</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>[받은 메세지]</h1>
	<div style="margin-bottom:10px;"> 
		<table border=1>
		<tr>
			<td width=280>받은이 : <span id=name>${vo.name}</span></td>
			<td width=280>포인트:<span id="point">${vo.point}</span>점</td>
		</tr>
		</table>
		<button onClick="location.href='list'">목록</button>
	</div>
	<table id="tbl" border=1></table>    
	  <script id="temp" type="text/x-handlebars-template"> 
				<tr>
					<th>NO.</th>
					<th>Sender</th>
					<th>Message</th>
					<th>View</th>
					<th>삭제</th>
				</tr>				
			{{#each .}}
				<tr class="row" {{printStyle readDate}}>
					<td class="mid">{{mid}}</td>
					<td width=150>{{sender}}:{{name}}</td>
					<td width=325>{{message}}</td>
					<td><button class="view">view</button></td>
					<td><button class="del">delete</button></td>
				</tr>
			{{/each}}
	  </script>
	  
	  <div style="background:gray; color:white; margin:10px 0px 10px 0px; padding:10px;width:500px; border-radius:10px;" id="divMessage">
	  	Sender : <span id="sender"></span><br>
	  	Message : <span id="message"></span><br>
	  	Send Date : <span id="sendDate"></span><br>
	  	Read Date : <span id="readDate"></span>
	  </div>
</body>
<script>
	var id="${vo.id}";
	var name="${vo.name}";
	var point="${vo.point}";
	$("#name").html(name);
	$("#point").html(point);
	
	   Handlebars.registerHelper("printStyle", function(readDate){
		      var src;
		      if(readDate==null) src="style=color:red";
		      return src
		   })
	
getList();
	$("#divMessage").hide();
	function getList() {
		var id="${vo.id}";
	$.ajax({
		type : "get",
		url : "/list/receive",
		data:{"id":id},
		dataType : "json",
		success : function(data) {
			var temp = Handlebars.compile($("#temp").html());
			$("#tbl").html(temp(data));
		}
	});
}
	
	$("#tbl").on("click", ".row .view", function(){
		var mid=$(this).parent().parent().find(".mid").html();
		$.ajax({
			type:"get",
			url:"/message/read",
			data:{"mid":mid},
			dataType:"json", //리턴타입이 있을때 줌, 데이터를 받아올때 적는거임
			success:function(data){
				$("#sender").html(data.sender+ " - " + data.name);
				$("#message").html(data.message);
				$("#sendDate").html(data.sendDate);
				$("#readDate").html(data.readDate);
				$("#divMessage").show();
						
						$.ajax({
							type:"get",
							url:"/user/getUser",
							data:{"id":id},
							dataType:"json",
							success:function(data) {
								$("#point").html(data.point);
							}
						});
						getList();
			}
		});
	});
	
	$("#tbl").on("click", ".row .del", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		var mid=$(this).parent().parent().find(".mid").html();
		
		$.ajax({
			type:"get",
			url:"/message/rdelete",
			data:{"mid":mid},
			success:function(){
				alert("삭제되었습니다.");
				getList();
			}
		});
	});
</script>
</html>