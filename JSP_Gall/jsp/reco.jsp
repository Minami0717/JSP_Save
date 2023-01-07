<%@page import="friend.PostDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int result = PostDao.getInstance().updateReco(idx);
	if (result != 0)
		response.sendRedirect("result.jsp?idx="+idx);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>