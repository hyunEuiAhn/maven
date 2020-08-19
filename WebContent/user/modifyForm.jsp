<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
수정 할 아이디 입력 
<input type="text" id="searchId">
<input type="button" id="searchBtn" value="검색">
<br><br>
<div id="showResult"></div>
<br>

<form id="modifyForm">
<table>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="name" id="name">
			<div id="nameDiv"></div>
		</td>
	</tr>
		<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="id" readonly>
		</td>
	</tr>
		<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pwd" id="pwd">
			<div id="pwdDiv"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="modifyBtn" value="수정">
			<input type="button" id="resetBtn" value="취소">
		</td>
	</tr>
</table>
</form>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#modifyForm').hide();
	
	$('#searchBtn').click(function(){
		$.ajax({
			type : 'POST',
			url : '/chapter06_Maven/user/getUser.do',
			data : {'id' : $('#searchId').val()},
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				if(data.map==null){
					$('#showResult').html('<strong>찾고자 하는 아이디가 없습니다</strong>');
					$('#showResult').css('color','red');
					return false;
				}
				
				$('#modifyForm').show();
				$('#showResult').empty();
				$('#name').val(data.map.NAME);
				$('#id').val(data.map.ID);
				$('#pwd').val(data.map.PWD);
			}			
		});
	});
	
	$('#modifyBtn').click(function(){
		$('#nameDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#name').val() == "") {
			$('#nameDiv').text('이름을 입력해주세요!').css('color', 'red').css('font-size', '8pt');
		} else if($('#pwd').val() == "") {
			$('#pwdDiv').text('비밀번호를 입력해주세요!').css('color', 'red').css('font-size', '8pt');
		}else{
			$.ajax({
				type : 'POST',
				url : '/chapter06_Maven/user/modify.do',
				data : {'name' : $('#name').val(),
					    'id' : $('#id').val(),
				        'pwd' : $('#pwd').val()},	
		        success : function(data) {
					alert("수정 성공");
					location.href="/chapter06_Maven/user/getUserList.do";
				}
			});
		}
	});	
});	
</script>
</html>














