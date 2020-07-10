<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>영화정보</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		#tbl {float:left; background:gray;}
	</style>
</head>
<body>
	<h1>영화정보</h1>
	<table id="tbl" border=1></table>    
	<script id="temp" type="text/x-handlebars-template"> 
		{{#each array}}
		<tr>
			<td width=100><img src="{{image}}" width=100></td>
			<td width=20>{{rank}}</td>
			<td width=200>{{title}}</td>
			<td width=200>{{date}}</td>
		</tr>
		{{/each}}
	</script>
</body>
<script>
$.ajax({
	type : "get",
	url : "movie.json",
	dataType : "json",
	success : function(data) {
		var temp = Handlebars.compile($("#temp").html());
		$("#tbl").html(temp(data));
		}
	});
</script>
</html>