<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>로그인</title>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <style>
    	a {text-decoration:none;}
    </style>
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
    <h1>[로그인]</h1>
    <form action="login" method="post" name="frm">
        <table width=300 border=1>
            <tr>
            	<td>아이디:</td><td><input type="text" name="id" size=10></td>
            </tr>
            <tr>
            	<td>비밀번호</td><td><input type="password" name="pass" size=10></td>
            </tr>
            <tr>
            	<td colspan=2>
	            	<input type="submit" value="로그인">
	            	<input type="checkbox" name="chkLogin">로그인 상태유지
	            	<a href="insert">[회원가입]</a>
            	</td>
            </tr>
        </table>
    </form>
</body>
<script>
	
	
	
	$(frm).submit(function(e){
		var id=$(frm.id).val();
		var pass=$(frm.pass).val();
		var chkLogin=$(frm.chkLogin).is(":checked")?true:false;
		
		e.preventDefault();
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{"id":id, "pass":pass, "chkLogin":chkLogin},
			success:function(data){
				if(data==0) {
					alert("아이디가 존재하지 않습니다.");
					$(frm.id).focus();
				} else if(data==1) {
					alert("비밀번호가 일치하지 않습니다.");
					$(frm.pass).focus();
				} else {
					alert("로그인 성공");
					var dest="${dest}";
					if(dest!="") {
						location.href="${dest}";
					} else {
						location.href="/board/list";
					}
					
				}
			}
		});
	});
</script>
</html>