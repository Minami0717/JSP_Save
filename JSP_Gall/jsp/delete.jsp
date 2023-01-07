<%@page import="friend.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	
	String id = (String)session.getAttribute("id");
	int result = FriendDao.getInstance().delete(id);
	if(result != 0) {
		%><script>
			alert("탈퇴가 완료되었습니다.");
			location.href="main.jsp";
		</script><%
	}
	else {
		%><script>alert("탈퇴실패"); history.back();</script><%
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