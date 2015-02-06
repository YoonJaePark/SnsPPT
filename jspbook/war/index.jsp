<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<jsp:include page="header.jsp" flush="false"/>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 	
<!-- Add jQuery library -->
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>

	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="js/jquery.mousewheel.pack.js?v=3.1.3"></script>

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="js/jquery.fancybox.pack.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css?v=2.1.5" media="screen" />
	
	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="js/jquery.fancybox-buttons.js?v=1.0.5"></script>

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="css/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="js/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<script type="text/javascript">
	 	
		
	var aaa = null;
	    
		/*window.onload = function() {
	    var ex = document.getElementById('ex');
	    };	*/
	
	    function on() {
	    	location.href = './Edit_ppt.jsp?aa='+aaa;
	    }
	    
	    
		$(document).ready(function(){
		       $('img').click(function(){
			         //alert($('img').attr("src"));	
			         var index = $("img").index(this);
			         aaa = $("img:eq(" + index + ")").attr("src");
			         //alert( $("img:eq(" + index + ")").attr("src"));
			         /*
			         $("test").find('img').each(function(){ 
			        	 alert($(this).attr('src')); 
			        	 });*/ 
			       });
			   }); 
	
	 //window.open('#');

		$(document).ready(function() {
			$('.fancybox-thumbs').fancybox({
				
				prevEffect : 'fade',
				nextEffect : 'fade',

				closeBtn  : true,
				arrows    : true,
				nextClick : true,
				padding : 5,
				
				
			    beforeShow: function () {
			    	if (this.title) {
		                // New line
		                this.title += '<br />';
			    	
			    		// Add tweet button
	                	this.title += '<button id="ex" type="submit" onclick="on()">Edit</button>';
	                	
	                	
			    		}     
			    	},
			    
				afterShow: function() {
					$(".fancybox-title").wrapInner('<div />').show();
			    },
			   
				helpers : {			
					title	: {
						type : 'inside' 
					},
					thumbs : {
							
						width  : 50,
						height : 50,
	
						source : function( item ) {
							//$.fancybox.next();
							$.fancybox.jumpto( $(this).data('index'));
							
							return item.href.replace('1.jpg','1.jpg');
		                    
		                }
					}
				}
			}); 
			
		});
	</script> 	
	
	
 	<style type="text/css"> 
 
	 body {  padding-bottom: 40px; background-color: f5f5f5; } 

	.form-signin { 
 	max-width: 300px; padding: 19px 29px 29px; margin: 0 auto 20px; 
 	background-color: fff; border: 1px solid e5e5e5; border-radius: 5px; 
	jabox-shadow: 0 1px 2px rgba(0,0,0,.05); 
	} 
	.form-signin .form-signin-heading { margin-bottom: 10px; } 
	.form-signin input { font-size: 16px; height: auto; margin-bottom: 15px; padding: 7px 9px; } 
	
	
	</style> 

	
	<%	
	String id = (String)session.getAttribute("loginid"); //#로그인한#id를#체크#

	if (id != null) { //#로그인상태#
		// 데이터베이스 연결관련 변수 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		int total=0;
		// 데이터베이스 연결관련정보를 문자열로 선언
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb";
		
		try{
			// JDBC 드라이버 로드
			Class.forName(jdbc_driver);

			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
			String sql1 = "select count(boardno) from board";
			String sql2 = "select boardno, title,usernameboard, content, date, uploadfilename, slidelength from jspdb.board order by boardno DESC";
			pstmt = conn.prepareStatement(sql1);
			rs1=pstmt.executeQuery();
			pstmt = conn.prepareStatement(sql2);
			rs2=pstmt.executeQuery();
			rs1.next();
			total=rs1.getInt(1);
			
			// username 값을 입력한 경우 sql 문장을 수행.
			%>       
			
			 <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-12 col-sm-9">
          <div class="row">
            <div class="col-6 col-sm-6 col-lg-4">
             <%
				while(rs2.next()){
				long date=rs2.getLong("date");
				SimpleDateFormat Current=new SimpleDateFormat("yyyy/MM/dd/hh:mm");
				String today=Current.format(date);
				%> 
				<div class="container" > 
				  <div class='post' > 
  <h2><%=rs2.getString("title")%></h2> 
  <p><%=rs2.getString("content")%></p> 

   <% String src = rs2.getString("uploadfilename");
   	System.out.println(src);
    int a = rs2.getInt("slidelength");System.out.println(a);
  
    for(int i = 0;i<a;i++) {  %>
	<a class="fancybox-thumbs" data-fancybox-group="thumb<%=src%>"  title ="<%=rs2.getString("title")%>" id = "test"
	href="upload/img/<%=rs2.getString("uploadfilename").substring(0, rs2.getString("uploadfilename").indexOf("."))+(i+1)%>.jpg" > <% }%>
	
	
	<!-- 게시물에 노출된 표지 -->
	<img src="upload/img/<%=rs2.getString("uploadfilename").substring(0, rs2.getString("uploadfilename").indexOf("."))%>1.jpg" > 
	</a>

  <p>작성자 : <%=rs2.getString("usernameboard")%></p> 
  <p>작성시간 : <%=today%></p> 
  <p>첨부파일 : <%=rs2.getString("uploadfilename")%></p>
  <form action="process_down.jsp"> 
<input type=hidden name="fileName" value="<%=rs2.getString("uploadfilename")%>"> 
<input type="submit" value="다운로드"> 
</form>
  </div></div>
  

   
  <hr><hr>  <%
  		
			}
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		 conn.close();    
		 pstmt.close();
		%>  
		  </div><!--/span-->
                  </div><!--/row-->
        </div><!--/span-->
        
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
          <div class="well sidebar-nav">
            <ul class="nav">
              <li>Sidebar</li>
              <li class="active"><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li>Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li>Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
      </div><!--/row-->
        
		   <% } else { %> 
 	<div class="container"> 
	<form class="form-signin" action="process_register.jsp" method="post"> 
	<h2 class="form-signin-heading">Brand 가입</h2> 
	<input type="text" name=username class="input-block-level" placeholder="사용자 ID"> 
	<input type="text" name=email class="input-block-level" placeholder="사용자 이메일"> 
	<input type="password" name=passwd class="input-block-level" placeholder="사용자 암호"> 
	<button class="btn btn-large btn-primary" type="submit" onclick="location.href='register.jsp'">가입</button> 
	</form> 
		 <% } %> 
	</div> 
		
<jsp:include page="footer.jsp" flush="false"/>
 
 
