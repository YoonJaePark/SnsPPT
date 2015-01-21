<%@ page import="java.io.*"%>
<%@ page import="org.apache.poi.hslf.model.*"%>
<%@ page import="org.apache.poi.hslf.usermodel.*"%>
<%@ page import="org.apache.poi.hslf.*"%>

<%

    SlideShow src = 

          new SlideShow(

          new HSLFSlideShow("C:\\Users\\ParkYoonJae\\git\\SnsPPT\\jspbook\\war\\upload\\Hello poi.ppt")); 


    Slide[] sl = src.getSlides();


    for (int i = 0; i < sl.length; i++) { 
        Slide s = sl[i];
        TextRun[] trs = s.getTextRuns();
        for (int k = 0; k < trs.length; k++) {
            TextRun tr = trs[k];
            System.out.println(tr.getText());
           }
    }

%>
