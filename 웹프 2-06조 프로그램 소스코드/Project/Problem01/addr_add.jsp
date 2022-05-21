<%--2-06조 이지영, 이해서, 최주리--%>
<%--최적 실행환경: Chrome browser --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="jspbook.ch07.*"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="addr" class="jspbook.ch07.AddrBean"/>
<jsp:setProperty name="addr" property="*"/>
<jsp:useBean id="am" class="jspbook.ch07.AddrManager" scope="application"/>
<%
am.add(addr);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>등록내용</h2>
이름: <jsp:getProperty property="username" name="addr"/><p>
전화번호: <%=addr.getTel() %><p>
이메일: <%=addr.getEmail() %><p>
성별: <%=addr.getSex() %><p>
그룹: <%=addr.getGroup() %><p>
<hr>
<a href="addr_list.jsp">전체 목록보기</a>
</center>
</body>
</html>