 <%@page contentType="text/html;charset=utf-8" %>
<jsp:include page="header.jsp" flush="false"/>

 <style type="text/css"> 
 
	 body { padding-bottom: 40px; background-color: f5f5f5; } 

	.form-signin { 
 	max-width: 300px; padding: 19px 29px 29px; margin: 0 auto 20px; 
 	background-color: fff; border: 1px solid e5e5e5; border-radius: 5px; 
	box-shadow: 0 1px 2px rgba(0,0,0,.05); 
	} 
	.form-signin .form-signin-heading { margin-bottom: 10px; } 
	.form-signin input { font-size: 16px; height: auto; margin-bottom: 15px; padding: 7px 9px; } 
	</style> 
	<div class="container"> 
	<form role="form" action="process_write.jsp" method="post"> 
	<div class="form-group"> 
	<h2 class="form-write-heading">새 글 작성</h2> 
	<input type="text" name=title class="form-control" placeholder="새 글 제목"> 
	<textarea rows=10 name=content class="form-control"> </textarea>	
	</div> 
	<button class="btn btn-danger btn-lg" type="submit">글 작성</button> 
	<button class="btn btn-default btn-lg" type="submit">취소</button> 
	</form> 
	</div> 
<jsp:include page="footer.jsp" flush="false"/>
 
 