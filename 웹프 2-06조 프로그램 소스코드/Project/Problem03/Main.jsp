<%--2-06조 이지영, 이해서, 최주리--%>
<%--최적 실행환경: 이클립스 --%>
<%--Main.jsp--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "jspbook.pr35.*"%>
<%!
String[] types = {
      "yellow", "blue", "gray", "blank"
};
%>
<jsp:useBean id = "lec" class = "jspbook.pr35.LectureBean"/>
<jsp:setProperty name = "lec" property = "*"/>
<jsp:useBean id = "am" class = "jspbook.pr35.LectureManager" scope = "session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   table, td, tr, th {
      border-collapse : collapse;
      border : 1px solid black;
      table-layout : fixed;
      width : 80px;
      height : 50px;
   }
   td.left_column {
      font-size: 20px;
      font-weight: bold;
      text-align : center;
   }
   td {
      font-size: 13px;
      text-align : center;
   }
   td.yellow {
      background-color : #ffe08c;
   }
   td.blue {
      background-color : #b2ccff;
   }
   td.gray {
      background-color : #bdbdbd;
   }
   td.blank {
      background-color : white;
   }
</style>
</head>
<body>

<%
   int i, j;

   out.println("<form method = POST action = Main.jsp>");
   out.println("과목타입 : <select name=" + '"' + "type" + '"' + ">");
   for(i = 0; i < 4; i++)
      out.println("<option value=" + '"' + i + '"' + ">" + LectureBean.typeNames[i] + "</option>");
   out.println("</select>");
   
   out.println("과목명 : <select name=" + '"' + "title" + '"' + ">");
   for(i = 0; i < 8; i++)
      out.println("<option value=" + '"' + i + '"' + ">" + LectureBean.titleNames[i] + "</option>");
   out.println("</select>");
   
   out.println("요일 : <select name=" + '"' + "day" + '"' + ">");
   for(i = 0; i < 5; i++)
      out.println("<option value=" + '"' + i + '"' + ">" + LectureBean.dayNames[i] + "</option>");
   out.println("</select>");
   
   out.println("시간 : <select name=" + '"' + "time" + '"' + ">");
   for(i = 1; i < 7; i++)
      out.println("<option value=" + '"' + i + '"' + ">" + i + "</option>");
   out.println("</select>");
   
   out.println("연강여부 : <select name=" + '"' + "consecutive" + '"' + ">");
   for(i = 1; i < 5; i++)
      out.println("<option value=" + '"' + i + '"' + ">" + i + "</option>");
   out.println("</select>");
   
   out.println("<input type=" + '"' + "submit" + '"' + "value=" + '"' + "등록\">");
   out.println("</form>");
   
   out.println("<hr>");
   
%>
<%
   int num;

   am.buildMatrix(lec);
   am.add(lec);
   
   out.println("<div align = center>");
   out.println("<h3> 강의 시간표 </h3>");
   out.println("<table>");
   out.println("<tr>");
   out.println("<th> 2학년 </th>");
   for(i = 0; i < 5; i++)
      out.println("<th>" + LectureBean.dayNames[i] + "</th>");
   out.println("</tr>");
   
   for(i = 0; i < 6; i++) {
      out.println("<tr>");
      out.println("<td class = \"left_column\">" + (i+1) + "</td>");
      for(j = 0; j < 5; j++)
      {
          num = am.getTitleMatrix(i, j);//itleNames(과목이름)인덱스
           
            if(am.getSpanMatrix(i, j) == 1) {//1칸
               if(num == -1)//공강
                    out.println("<td>&nbsp;</td>");
               else//단강
                  out.println("<td class='" + types[am.getTypeMatrix(i, j)] + "'>" + 
                     LectureBean.titleNames[num] + "</td>");
            } 
            else if(am.getSpanMatrix(i, j) > 1) {//연강
               out.println("<td rowspan='" + am.getSpanMatrix(i, j) + 
                  "'class='" + types[am.getTypeMatrix(i, j)] + "'>" + LectureBean.titleNames[num] + "</td>");

            }
      }
      out.println("</tr>");
   }
   out.println("</table>");
   out.println("</div>");
   out.println("<br>");
   out.println("<hr>");
 
   out.println("<div align = \"center\">");

   for(LectureBean lb : am.getLectureList()){
      if(lb.getType() != -1 && lb.getTitle() != -1 && lb.getTime() != -1 && lb.getDay() != -1 && lb.getConsecutive() != -1){
         out.println(lb.toString());
         }
    }
   
   out.println("</div>");
%>
</body>
</html>