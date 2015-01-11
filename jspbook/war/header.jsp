<%@page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>Fixed Top Navbar Example for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet"> 

    <!-- Custom styles for this template -->
    <link href="navbar-fixed-top.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
 <nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index.jsp">Brand</a>
  </div>
 

        <%	
	String id = (String)session.getAttribute("loginid"); //#로그인한#id를#체크#
	if (id != null) { //#로그인상태#
		%>  
		  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <form class="navbar-form navbar-right" role="search" method="post" action="search.jsp">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search" name=searchname>
        <button type="submit" class="btn btn-large btn-primary">Search</button>
        	<a href="write.jsp">새 글 작성</a>
			<a href="process_logout.jsp"><%= id+"님"%> 로그아웃</a>
        </div>
           </form>
   </div>
 
        <% } else { %> 
          <div class="collapse navbar-collapse navbar-ex1-collapse">
  		  <form class="navbar-form navbar-right" action="process_login.jsp" method="post" role="search">
  		      <div class="form-group">
         <input type="text" name=username class="form-control" placeholder="사용자 ID"> 
	     <input type="password" name=passwd class="form-control" placeholder="사용자 암호">
		 <button class="btn btn-large btn-primary" type="submit">로그인</button> 
		   </div>
		 <% } %> 
    </form>
  </div><!-- /.navbar-collapse -->
</nav>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
