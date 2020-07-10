<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<h1>회원가입</h1>
	<form name="frm" action="insert" method="post">
		<table border=1 width=450>
			<tr>
				<td width=150>회원 아이디</td>
				<td>
					<input type="text" name="id" size=20>
					<a href="#" id="btnCheck">중복확인</a>
				</td>
			</tr>
			<tr>
				<td width=150>회원 비밀번호</td>
				<td><input type="password" name="pass" size=20></td>
			</tr>
			<tr>
				<td width=150>회원 성명</td>
				<td><input type="text" name="name" size=20></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="가입"> 
		<input type="reset" value="취소">
	</form>
</body>
<script>
	// 중복체크를 안했을시
	var check = false;
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!check) {
			var id = $(frm.id).val();
			if (id == "") {
				alert("아이디를 입력해주세요.");
				return;
			}
			alert("아이디 중복체크를 하세요");
			$(frm.id).focus();
		} else {
			frm.submit();
		}
	});

	// 중복체크 후 다른아이디를 입력하고 중복체크를 하지 않았을때
	$(frm.id).change(function() {
		check = false;
	});

	// 중복체크버튼을 클릭했을때
	$("#btnCheck").on("click", function(e) {
		var id = $(frm.id).val();
		e.preventDefault();
		if (id != "") {
			$.ajax({
				type : "post",
				url : "/user/login",
				data : {
					"id" : id
				},
				success : function(data) {
					if (data != 0) {
						alert("존재하는 아이디입니다.");
						$(frm.id).focus();
					} else {
						alert("사용가능한 아이디입니다.");
						check = true;
					}
				}
			});
		} else {
			alert("아이디를 입력해주세요.");
			$(frm.id).focus();
		}
	});
</script>
</html>