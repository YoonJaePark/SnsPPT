<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="header.jsp" flush="false"/>

<%
String id = (String)session.getAttribute("loginid"); //#로그인한#id를#체크#
if (id != null) { //#로그인상태#
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs2=null;
	int total=0;
	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb";
	String searchname = request.getParameter("searchname"); 
	
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);

		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
		String sql2 = "SELECT username FROM jspdb.jdbc_test where username like '%"+searchname+"%'";
		pstmt = conn.prepareStatement(sql2);
		rs2=pstmt.executeQuery();
		
		// username 값을 입력한 경우 sql 문장을 수행.
			
			%><h2 class="form-signin-heading">사용자 목록</h2><% 
			while(rs2.next()){
			%>
			<div class="container"> 
			  <div class='post'>
			  <p><%=rs2.getString("username")%></p> 
				 </div></div><hr><hr>
				 <%
			}
	}
	catch(Exception e) {
		System.out.println(e);
	}
	 conn.close();    
	 pstmt.close();
	 
	 

}
%>

		
<jsp:include page="footer.jsp" flush="false"/>
 
 
 