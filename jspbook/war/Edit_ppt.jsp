<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


</head>
<body>
<script>
var url = location.toString();
var sp = url.split('?');
var eqSp = sp[1].split('=');

//document.write(eqSp[0]);//변수이름
//document.write('<br>');
//document.write(eqSp[1]);//변수값

//alert(eqSp[0]);
alert(eqSp[1]);

console.log(eqSp[0]);

</script>
</body>
</html>