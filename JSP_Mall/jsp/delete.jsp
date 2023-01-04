<%@page import="mall.CartDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	int result = CartDao.getInstance().delete(id);
	if (result != 0)
		response.sendRedirect("cartForm.jsp");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>

</html>