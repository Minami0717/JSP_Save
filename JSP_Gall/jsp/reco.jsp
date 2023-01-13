<%@page import="gall.PostDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	int result = PostDao.getInstance().updateReco(p_idx);
	if (result != 0)
		response.sendRedirect("result.jsp?idx="+idx+"&p_idx="+p_idx);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>