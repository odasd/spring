<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>사용자정보</title>
   <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <style>
   		input[type='file'] {visibility:hidden; height:0px;}
   		#listFile img {width:150px;margin-left:20px; }
   </style>
</head>
<body>
   <h1>[사용자정보]</h1>
   <form name="frm" action="update" method="post" enctype="multipart/form-data">
      <table border=1>
         <tr>
            <td width=100>아이디</td>
            <td><input type="text" value="${vo.id}" name="id" readonly></td>
         </tr>
         <tr>
            <td width=100>비밀번호</td>
            <td><input type="text" value="${vo.pass}" name="pass"></td>
         </tr>
         <tr>
            <td width=100>이름</td>
            <td><input type="text" value="${vo.name}" name="name"></td>
         </tr>
         <tr>
            <td width=100>대표이미지</td>
            <td width=400>
               <input type="file" name="file">
               <c:if test="${vo.image!=null && vo.image!=''}">
					<img src="/display?fileName=${vo.image}" width=150 height=170 id="image">
				</c:if>
				<c:if test="${vo.image==null || vo.image==''}">
					<img src="http://placehold.it/150x170" width=150 id="image">
				</c:if>
				<input type="hidden" value="${vo.image}" name="image">
            </td>
         </tr>
         <tr>
         	<td width=100>
         		<input type="button" value="상세이미지" id="btnImage">
         	</td>
         	<td width=400 height=150>
         		<input type="file" name="files" accept="image/*" multiple>
         		<div id="listFile">
         			<c:forEach items="${list}" var="vo">
         				<img src="/display?fileName=${vo}">
         			</c:forEach>
         		</div>
         	</td>
         </tr>
      </table>
      <input type="submit" value="수정">
      <input type="reset" value="취소">
       <input type="button" value="삭제" id="btnDelete">
      <input type="button" value="목록" id="btnList">
   </form>
</body>
<script>

	//상품이미지 버튼을 눌렀을때
	$("#btnImage").on("click", function(){
		$(frm.files).click();
	});
	
	//여러 사진파일을 올릴때
	 $(frm.files).on("change", function(){
	      var files=$(frm.files)[0].files;
	      var html="";
	      $.each(files, function(index, file){
	    	 html += "<img src='" + URL.createObjectURL(file) + "'>"; 
	      });
	      $("#listFile").html(html);
	   });

	//삭제버튼
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하시겠습니까?")) return;
		frm.action="delete";
		frm.submit();
	});
	
	//수정버튼
	$(frm).submit(function(e){
		e.preventDefault();
		if(!confirm("수정하시겠습니까?")) return;
		frm.submit();
	});

	//목록버튼
	$("#btnList").on("click", function(){
		location.href="list";
	});
	
	$("#image").on("click", function(){
		$(frm.file).click();
	});

   $(frm.file).on("change", function(){
      var file=$(frm.file)[0].files[0];
      $("#image").attr("src", URL.createObjectURL(file))
   })
   
   
</script>
</html>