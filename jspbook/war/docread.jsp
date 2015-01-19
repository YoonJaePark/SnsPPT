<%@ page
language="java"
contentType="text/html;charset=euc-kr" 
import="java.io.*,
 org.apache.poi.poifs.filesystem.POIFSFileSystem,
 org.apache.poi.hssf.record.*,
 org.apache.poi.hssf.model.*,
 org.apache.poi.hssf.usermodel.*,
 org.apache.poi.hssf.util.*,
 org.apache.poi.xwpf.extractor.XWPFWordExtractor,
 org.apache.poi.xwpf.usermodel.XWPFDocument"
  %>

 

<html>
<head><title>Read example</title></head>
<body>

<%

   XWPFDocument docx = new XWPFDocument(
   new FileInputStream("C:\\Users\\ParkYoonJae\\git\\SnsPPT\\jspbook\\createparagraph.docx"));
   //using XWPFWordExtractor Class
   XWPFWordExtractor we = new XWPFWordExtractor(docx);
   System.out.println(we.getText());
   %> 
   <p>문서 정보</p>
   <p><%=we.getText()%></p><%   

%>


</body>
</html>
