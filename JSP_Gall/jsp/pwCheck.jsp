<%@page import="gall.Post"%>
<%@page import="gall.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String pw = request.getParameter("pw");
	
	if(pw.isEmpty()){
		%><script>alert("비밀번호를 입력하세요."); history.back()</script><%
		return;
	}
	
	if(PostDao.getInstance().getPw(p_idx).equals(pw))
		response.sendRedirect("modifyForm.jsp?idx="+idx+"&p_idx="+p_idx);
	else {
		%><script>alert("비밀번호가 맞지 않습니다."); history.back()</script><%
		return;
	}
		
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>