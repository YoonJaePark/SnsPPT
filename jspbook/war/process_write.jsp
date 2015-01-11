<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt =null;
	ResultSet rs=null;
	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb";
	
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		
		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
		long now = System.currentTimeMillis();  // 시간
		String username= (String)session.getAttribute("loginid");
		String sql1="SELECT max(boardno) FROM jspdb.board";
		stmt=conn.createStatement();               
		rs=stmt.executeQuery(sql1);			
		rs.next();
		int boardno=(rs.getInt(1)+1);
		
		
		// Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
		String sql2 = "insert into board values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, boardno);
		pstmt.setString(2,username);
		pstmt.setString(3,request.getParameter("title"));
		pstmt.setString(4,request.getParameter("content"));
		pstmt.setLong(5,now);
				
		
		// username 값을 입력한 경우 sql 문장을 수행.
		if(request.getParameter("title") != null) {
			pstmt.executeUpdate();
		}
	}
	catch(Exception e) {
		System.out.println(e);
	}
	 conn.close();    
	 
	response.sendRedirect("index.jsp");
%>
 