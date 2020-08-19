<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="table" border="1">
	<th width="100">이름</th>
	<th width="100">아이디</th>
	<th width="100">비밀번호</th>
</table>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.0.min.js"></script>     
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/chapter06_Maven/user/getList.do',
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, item){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: item.name
				})).append($('<td/>',{
					align: 'center',
					text: item.id
				})).append($('<td/>',{
					align: 'center',
					text: item.pwd
				})).appendTo($('#table'));
				
			});
		}		
	});
});
</script>
</html>

















