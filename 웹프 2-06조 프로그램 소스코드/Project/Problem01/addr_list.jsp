<%--2-06조 이지영, 이해서, 최주리--%>
<%--최적 실행환경: Chrome browser --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="jspbook.ch07.*"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="am" class="jspbook.ch07.AddrManager" scope="application"/>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 목록</title>
<%
    String sindex = request.getParameter("sindex");
%>
</head>
<style>
#list {
	background-color:#bada55;
} 
td {
	text-align:center;
}
</style>
<body>
<div align=center>
<h2>주소록(전체보기)</h2>
<hr>
<a href="addr_form.jsp">주소추가</a><p>
<%
int currentPage = 1; //페이지를 처음 방문한 경우이므로 null인 경우
if(sindex != null){// 연산을 하기 위한 sindex 형변환  
	currentPage = Integer.parseInt(sindex);
}

int rpp = 2;//페이지당 보여지는 목록 수
int allpage;//전체페이지
int startIndex = (currentPage - 1)*rpp;//시작페이지 인덱스 0번 부터
int lastIndex = currentPage*rpp - 1;//마지막페이지 

if(am.getAddrList().size() % rpp == 0) { //전체 자료의 개수 am.getAddrList().size() 
	allpage = am.getAddrList().size()/rpp;
}
else {//rpp 값의 배수가 아닌 경우
	allpage =am.getAddrList().size()/rpp + 1;//나눴을때 나머지
	if(currentPage == allpage) {
		lastIndex = startIndex + am.getAddrList().size() % rpp - 1;//last인덱스까지 못갔을때 재설정
	}
}
%> 
<table border="1" width="500">
<tr id="list"><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td><td>그룹</td></tr>
<%
for(int i= startIndex; i<= lastIndex; i++) { //목록 보여주기  get메소드를 이용하여 i번째 요소 출력 /ArrayList에 담긴 모든 데이터 출력
%>
<tr>
<td><%=am.getAddrList().get(i).getUsername() %></td> <!-- i번재에서 부르겠다 -->
<td><%=am.getAddrList().get(i).getTel() %></td>
<td><%=am.getAddrList().get(i).getEmail() %></td>
<td><%=am.getAddrList().get(i).getSex() %></td>
<td><%=am.getAddrList().get(i).getGroup() %></td>
</tr>
<%
}
%>
</div>
</table>
<br>
<%
if(currentPage > 1) {
	out.println("<a href=\"addr_list.jsp?sindex=" + (currentPage-1) + "\">" + "이전" + "</a>"); 
	
}
	for(int i=1; i<= allpage; i++){//페이지 수 다 출력
		if(i == currentPage) {
			out.println(i); //현재 페이지는 페이지 번호
		} else {
			out.println("<a href=\"addr_list.jsp?sindex=" + i + "\">" + i + "</a>"); //그 외 하이퍼링크
		}
	
		if(i != allpage) {
			out.println("| ");
		}
	}
	
if(currentPage < allpage) {
		out.println("<a href=\"addr_list.jsp?sindex=" + (currentPage+1) + "\">" + "다음" + "</a>"); 
}
%>
</body>
</html>