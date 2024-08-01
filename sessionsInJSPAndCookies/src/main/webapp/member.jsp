<%@page import="jakarta.servlet.http.Cookie"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
member area<br/>
<%
String username = null, sessionId=null;
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie cookie:cookies){
		if(cookie.getName().equals("username")){
			username=cookie.getValue();
		}
		if(cookie.getName().equals("JSESSIONID")){
			sessionId=cookie.getValue();
	}
}
}
if(sessionId ==null ||username==null){
	response.sendRedirect("login.jsp");
}

%>
Username:<%=username %><br/>
SessionId:<%=sessionId %><br/>

<form action="<%= request.getContextPath() %>/MemberAreaController " method="get">
<input type="hidden" name="action" value="destroy">
<input type="submit" value="logout">
</form>





</body>
</html>