<%--2-06조 이지영, 이해서, 최주리--%>
<%--최적 실행환경: Chrome browser --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	a { text-style: bold;}
	.a { border: 1px solid Olive; border-collapse: collapse;}
	#b { align: center; width: 100;}
</style>
</head>
<body>
<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
	int currentYear = cal.get(java.util.Calendar.YEAR);	//현재 날짜
	int currentMonth = cal.get(java.util.Calendar.MONTH);
	int currentDate = cal.get(java.util.Calendar.DATE);
	String sYear = request.getParameter("YEAR");	//나타내고자 하는 날짜
	String sMonth = request.getParameter("MONTH");
	int year, month;
	
	if(sYear == null && sMonth == null) {	//처음 호출
		year = currentYear;
		month = currentMonth;
	}
	else {
		year = Integer.parseInt(sYear);
		month = Integer.parseInt(sMonth);
		if(month < 0) {
			month = 11;
			year -= 1;
		}
		if(month > 11) {
			month = 0;
			year += 1;
		}
	}
%>
<div align=center>
	<table>
		<tr>
			<td align=left width=200>	<!-- 년도 -->
			<a href="calendar.jsp?YEAR=<%out.print(year - 1);%>&MONTH=<%out.print(month);%>">◀</a>
			<b><%out.print(year);%>년</b>
			<a href="calendar.jsp?YEAR=<%out.print(year + 1);%>&MONTH=<%out.print(month);%>">▶</a>
			</td>
			<td align=center width=300>	<!--  월 -->
			<a href="calendar.jsp?YEAR=<%out.print(year);%>&MONTH=<%out.print(month - 1);%>">◀</a>
			<b><%out.print(month + 1);%>월</b>
			<a href="calendar.jsp?YEAR=<%out.print(year);%>&MONTH=<%out.print(month + 1);%>">▶</a>
			</td>
			<td align=right width=200>
			<b><%out.print(currentYear + "-" + (currentMonth + 1) + "-" + currentDate);%></b>
			</td>
		</tr>
	</table><br>
	<table class="a">
		<tr>
			<td class="a" align=center width=100 style="color:red" >일</td>
			<td class="a" align=center width=100>월</td>
			<td class="a" align=center width=100>화</td>
			<td class="a" align=center width=100>수</td>
			<td class="a" align=center width=100>목</td>
			<td class="a" align=center width=100>금</td>
			<td class="a" align=center width=100>토</td>
		</tr>
		<tr class="a" height=30>
		<%
			cal.set(year, month, 1);	//현재 날짜를 현재 월의 1일로 설정
			int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK);	//현재 날짜(1일)의 요일
			int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);	//이 달의 끝나는 날
			int br = 0;	//7일마다 줄 바꾸기
			for(int i = 0; i < (startDay - 1); i++) {	//빈칸 출력
				out.println("<td class=" + '"' + "a" + '"'+ ">&nbsp;</td>");
			
				br++;
				if((br % 7) == 0) out.println("<br>");
			}
			for(int i = 1; i <= endDay; i++) {	//날짜 출력
				if(br % 7 == 0)
					out.print("<td style=" + '"' + "color:red" + '"');
				else
					out.print("<td ");
				out.println("class=" + '"' + "a" + '"'+ "align=" +'"' + "center" + '"' + ">" + i + "</td>");
				br++;
				if((br % 7) == 0 && i != endDay) out.println("</tr><tr class=" +'"' + "a" + '"' + " height=30>");
			}
			while((br++) % 7 != 0) out.println("<td class=" + '"' + "a" + '"'+ ">&nbsp;</td>");	//말일 이후 빈칸 출력
		%>
		</tr>
	</table>
</div>
</body>
</html>