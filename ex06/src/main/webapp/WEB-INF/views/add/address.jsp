<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주소록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>[주소록]</h1>
	<table border=1>
		<tr>
			<td width=100>Name : </td>
			<td width=400><input type="text" id="name"></td>
		</tr>
		<tr>
			<td width=100>Address : </td>
			<td width=400><input type="text" id="address" size=53></td>
		</tr>
		<tr>
			<td width=100>Telephone : </td>
			<td width=400><input type="text" id="tel"></td>
		</tr>
	</table>
	<input type="button" value="입력" id="btnInsert">
	<hr>
	<table id="tbl" border=1></table>
	<script id="temp" type="text/x-handlebars-template">
	<tr>
		<th width=50>No.</th>
		<th width=100>Name</th>
		<th width=300>Address</th>
		<th width=100>Telephone</th>
		<th>수정/삭제</th>
	</tr>
	{{#each list}}
		<tr class="row">
			<td class="id">{{id}}</td>
			<td><input type="text" value="{{name}}" size=15 class="name"></td>
			<td><input type="text" value="{{address}}" size=40 class="address"></td>
			<td><input type="text" value="{{tel}}" size=15 class="tel"></td>
			<td>
				<button class="btnUpdate">수정</button>
				<button class="btnDelete">삭제</button>
			</td>
		</tr>
	{{/each}}
	</script>
</body>
<script>
	
	getList();
	
	function getList(){
		$.ajax({
			type:"get",
			url:"/add/rest/list",
			dataType:"json",
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}
	
	$("#btnInsert").on("click", function(){
		if(!confirm("저장하시겠습니까?")) return;
		var name=$("#name").val();
		var address=$("#address").val();
		var tel=$("#tel").val();
		
		$.ajax({
			type:"post",
			url:"/add/rest/insert",
			data:{"name":name, "address":address, "tel":tel},
			success:function(){
				alert("등록되었습니다.");
				getList();
			}
		});
	});
	
	$("#tbl").on("click", ".row .btnUpdate", function(){
		if(!confirm("수정하시겠습니까?")) return;
		var row=$(this).parent().parent();
		var id=row.find(".id").html();
		var name=row.find(".name").val();
		var address=row.find(".address").val();
		var tel=row.find(".tel").val();
		
		
		$.ajax({
			type:"post",
			url:"/add/rest/update",
			data:{"id":id, "name":name, "address":address, "tel":tel},
			success:function(){
				alert("수정되었습니다.");
				getList();
			}
		});
	});
	
	$("#tbl").on("click", ".row .btnDelete", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		var row=$(this).parent().parent();
		var id=row.find(".id").html();
		
		
		$.ajax({
			type:"post",
			url:"/add/rest/delete",
			data:{"id":id},
			success:function(){
				alert("삭제되었습니다.");
				getList();
			}
		});
	});
</script>
</html>