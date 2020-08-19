<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
삭제 할 아이디 입력 : <input type="text" size="20" id="searchId">
<input type="button" value="삭제" id="searchBtn">					
<br><br>
<div id="showResult"></div>
<br><br>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript">
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
			
			$('#showResult').empty();
			$.ajax({
				type : 'POST',
				url : '/chapter06_Maven/user/delete.do',
				data : {'id': $('#searchId').val()},
				success : function(){
					alert("삭제 성공");
					location.href="/chapter06_Maven/user/getUserList.do";
				}
			});
		}			
	});
});
</script>
</html>









