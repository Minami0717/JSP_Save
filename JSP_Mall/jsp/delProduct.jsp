<%@page import="mall.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	int result = ProductDao.getInstance().delete(id);
	if (result != 0)
		response.sendRedirect("deleteForm.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>