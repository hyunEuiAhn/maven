<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form action="/chapter06_Maven/user/write.do" method="post" id="writeForm">
		<h1 align="center">회원가입 페이지 입니다.</h1>
		
		
		<div class="form-group">
			<label for="name">이름</label> 
			<input id="name" type="text" name="name" class="form-control">
			<div id="nameDiv" style="color : red;"></div>
		</div>		
		
		<div class="form-group">
			<label for="id">아이디</label> 
			<input id="id" type="text" name="id" class="form-control">
			<div id="idDiv" style="color : red;"></div>
		</div>
		
		<div class="form-group">
			<label for="pwd">비밀번호</label> 
			<input id="pwd" type="password" name="pwd" class="form-control">
			<div id="pwdDiv" style="color : red;"></div>
		</div>
		
		<button class="btn btn-success btn-lg btn-block" type="button" id="login">회원가입</button>
		<button class="btn btn-default btn-lg btn-block" type="button" id="reset">초기화</button>
		
		</form>
	</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script>
	$('#login').click(function(){
		$('#nameDiv,#idDiv,#pwdDiv').empty();
		
		if($('#name').val().length == 0){
			$('#nameDiv').text("이름을 입력해주세요");
			$('#name').focus();
		}else if($('#id').val().length == 0 ){
			$('#idDiv').text('아이디를 입력해주세요');
			$('#id').focus();
		}else if($('#pwd').val().length == 0 ){
			$('#pwdDiv').text('비밀번호를 입력해주세요');
			$('#pwd').focus();
		}else{
			$('#writeForm').submit();	
		}
	});

	$('#reset').click(function(){
		$('#nameDiv,#idDiv,#pwdDiv').empty();
		$('#name,#id,#pwd').val('');
		$('#name').focus();
	});
	
	$('#id').focusout(function(){
		$.ajax({
			type : 'POST',
			url : '/chapter06_Maven/user/checkId.do',
			data : 'id='+$('#id').val(),
			dataType : 'text',
			success : function(data){
				if(data=='exist'){
					$('#idDiv').text('사용 불가능합니다');
					$('#idDiv').css('color','magenta');
					$('#idDiv').css('font-size','8pt');
				}else if(data=='not_exist'){
					$('#idDiv').text('사용 가능합니다');
					$('#idDiv').css('color','magenta');
					$('#idDiv').css('font-size','8pt');
				}else if(data=='empty'){
					$('#idDiv').text('먼저 아이디 입력하세요');
					$('#idDiv').css('color','magenta');
					$('#idDiv').css('font-size','8pt');
				}
			}
			       
		});
	});
</script>
</html>


<!-- 
	button의 크기조절 
	
	btn-lg  	/ btn-sm
	
	btn-block : button의 block화
	

 -->
 
 
 
 
 
 
 