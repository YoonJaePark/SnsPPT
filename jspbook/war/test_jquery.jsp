<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>
웹 에디터에서 제이쿼리 예제가 구동이 안될시에는 파이어폭스(권장) 또는 인터넷 익스플로러를 이용해주세요. 
</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript">
$(function(){
$('.btn_show').click(function(){
$('.btn_word').show();
});
$('.btn_hide').click(function(){
$('.btn_word').hide();
});

});
</script>

</head>
<body>
<button class="btn_show" style="padding:3px">show</button>
<button class="btn_hide" style="padding:3px">hide</button>
<div class="btn_word">Hello world!!!</div>
</body>
</html>