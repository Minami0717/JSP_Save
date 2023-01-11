<%@page import="mall.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = session.getAttribute("id").toString();
	int result = MemberDao.getInstance().delete(id);
	if (result != 0) {
		%><script>alert("탈퇴가 완료되었습니다."); location.href="home.jsp"</script><%
		session.invalidate();
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