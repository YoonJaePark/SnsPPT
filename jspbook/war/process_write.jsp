<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Dimension"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.geom.Rectangle2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="org.apache.poi.hslf.model.Slide"%>
<%@page import="org.apache.poi.hslf.usermodel.SlideShow"%>
<% request.setCharacterEncoding("utf-8"); %> 
 
<% 
String saveDir = "C:\\Users\\ParkYoonJae\\git\\SnsPPT\\jspbook\\war\\upload";
int maxSize = 1024*1024*10;
String encType = "UTF-8";

MultipartRequest multipartRequest
= new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());

File uploadfilename = multipartRequest.getFile("uploadfilename");
String o_name = multipartRequest.getOriginalFileName("uploadfilename");

//데이터베이스 연결관련 변수 선언 
Connection conn = null; 
PreparedStatement pstmt = null; 
Statement stmt =null; 
ResultSet rs=null; 
//데이터베이스 연결관련정보를 문자열로 선언 
String jdbc_driver = "com.mysql.jdbc.Driver"; 
String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb"; 


Slide[] slide=null;
	
///ppt jpg 작업
if(o_name.contains(".ppt")){
	String pptFile = "C:\\Users\\ParkYoonJae\\git\\SnsPPT\\jspbook\\war\\upload\\"+o_name;
	String cvtImgFile = "C:\\Users\\ParkYoonJae\\git\\SnsPPT\\jspbook\\war\\upload\\img\\";
		
	// PPT파일
	FileInputStream is = new FileInputStream(pptFile);

	SlideShow ppt = new SlideShow(is);

	// PPT파일 닫기
	is.close();

	Dimension pgsize = ppt.getPageSize();

	 slide = ppt.getSlides();

	for (int i = 0; i < slide.length; i++) {

		BufferedImage img = new BufferedImage(pgsize.width, pgsize.height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics = img.createGraphics();
		// 이미지 영역을 클리어
		graphics.setPaint(Color.white);
		graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,
				pgsize.height));

		// 이미지 그리기
		slide[i].draw(graphics);

		// 파일로 저장
		FileOutputStream oout = new FileOutputStream(cvtImgFile +o_name.substring(0, o_name.indexOf("."))+(i + 1)
				+ "."+"jpg");
		ImageIO.write(img, "jpg", oout);
		oout.close();
	}
}

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
String sql2 = "insert into board values(?,?,?,?,?,?,?)"; 
 		pstmt = conn.prepareStatement(sql2); 
 		pstmt.setInt(1, boardno); 
 		pstmt.setString(2,username); 
 		pstmt.setString(3,multipartRequest.getParameter("title")); 
 		pstmt.setString(4,multipartRequest.getParameter("content")); 
 		pstmt.setLong(5,now); 
 		pstmt.setString(6,o_name); 
 		pstmt.setInt(7,slide.length); 
 		// username 값을 입력한 경우 sql 문장을 수행. 
 		if(multipartRequest.getParameter("title") != null) { 
 			pstmt.executeUpdate(); 
		} 
 	} 
	catch(Exception e) { 
 		System.out.println(e); 
	} 
 conn.close();     
	System.out.printf("%s",o_name);
	
	


response.sendRedirect("index.jsp"); 
%> 
   
