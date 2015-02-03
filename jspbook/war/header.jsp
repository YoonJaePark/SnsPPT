<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>Fixed Top Navbar Example for Bootstrap</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-lightbox.min.css">
    <link rel="stylesheet" href="css/prettify.css">
    <link rel="stylesheet" href="css/styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
   
   <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
   <link rel="stylesheet" href="css/bootstrap-image-gallery.css">
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
 
 <%       int count= 0;
         Connection conn = null;
         PreparedStatement pstmt = null;
           ResultSet rs=null;
         // 데이터베이스 연결관련정보를 문자열로 선언
         String jdbc_driver = "com.mysql.jdbc.Driver";
         String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb";
         
         try{
            // JDBC 드라이버 로드
            Class.forName(jdbc_driver);

            // 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
            conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");

            // Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
            String sql2 = "SELECT * FROM jspdb.friend_info where friend_request = '"+(String)session.getAttribute("loginid")+"' and friend_state=1";
            pstmt = conn.prepareStatement(sql2);
            rs=pstmt.executeQuery();
            while(rs.next()){
               count+=1;
               
            }
            rs=pstmt.executeQuery();
         }
         catch(Exception e) {
            System.out.println(e);
         }
         
 %>
 

        <%   
   String id = (String)session.getAttribute("loginid"); //#로그인한#id를#체크#
   if (id != null) { //#로그인상태#
      %>  
        <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <form class="navbar-form navbar-left" role="search" method="post" action="search.jsp">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search" name=searchname>
        <button type="submit" class="btn btn-large btn-primary">Search</button>
        </div>
           </form>
            <form class="navbar-form navbar-right" method="post" action="process_responseFriend.jsp">
                     <div class="btn-group">
            <button type="button" data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="glyphicon glyphicon-user">&nbsp;</span><span class="badge pull-right"><%if(count!=0){%><%=count%><%} %></span> </button>
            <ul class="dropdown-menu">
               <%if(count==0) {%>
                <li><a href="#">친구 요청이 없습니다</a></li>
                <li class="divider"></li>
              <%}else{ while(rs.next()){%>
               <div>
              <li><a href="#"><%=rs.getString("username")%></a>
              <input type=hidden name="friend_rname" value="<%=rs.getString("username")%>"> 
              <button type="submit" class="btn btn-xs btn-primary" name="state" value=2>수락</button>
              <button type="submit" class="btn btn-xs btn-primary" name="state" value=3>거절</button></li></div>
             <li class="divider"></li>
             <%}} %>
            </ul>
        </div>
              <a href="write.jsp">새 글 작성</a>
         <a href="process_logout.jsp"><%= id+"님"%> 로그아웃</a>
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
     <%
   conn.close();    
    pstmt.close();

%>
  </body>

</html>