<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>chat</title>
	<style> 
		*{font-size:10px;} 
		body{overflow:hidden;width:100%;height:100%; margin:0px;padding:0px; background:#F0F0B7;} 
		#container{overflow:auto;height:87%;margin:0px;} 
		.content{overflow:hidden; width:100%;} 
		.content_left{float:left; margin:5px; padding:7px; border-radius:5px 5px 5px 5px; background:white;} 
		.content_right{float:right;margin:5px; padding:7px;border-radius:5px 5px 5px 5px; background:yellow;}  
		#bottom{position:fixed;height:10%; left:0px; right:0px; bottom:0px;padding-top:15px;text-align:center;} 
		#txtMessage{width:70%; height:25px; margin:0px;}
		#btnSend{height:30px; margin:0px;} 
		small{cursor:pointer; color:red;} 
		.sdate{font-size:8px; color:blue;} 
	</style>
</head>
<body>
	<div id="container"></div>
	<div id="bottom">
		<b><span id="userid">${ id }</span></b>
		<input type="text" id="txtMessage">
		<input type="button" value="Enter" id="btnSend">
	</div>
</body>
<script>
	if($("#userid").html()=="") {
		$("#userid").html("GUEST");
	}
	

	$("#txtMessage").keydown(function(key) {
		if (key.keyCode == 13) {
			$("#btnSend").click();
		}
	});
	
	$("#btnSend").on("click", function(){
		if($("#txtMessage").val()=="") {
			alert("내용을 입력하세요.");
		}
	})
</script>
</html>