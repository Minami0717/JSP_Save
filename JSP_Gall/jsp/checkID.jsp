<%@page import="friend.Friend"%>
<%@page import="friend.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String inputCode = request.getParameter("code");
	String inputPw = request.getParameter("pw");
	
	if(inputCode.isEmpty()) {
		%><script>alert("아이디를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	if(inputPw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	Friend friend = FriendDao.getInstance().select(inputCode);
	
	String code = friend.getCode();
	String pw = friend.getPw();
	String nick = friend.getNick();
	String email = friend.getEmail();
	
	if(inputCode.equals(code) && inputPw.equals(pw)) {
		session.setAttribute("id", code);
		session.setAttribute("pw", pw);
		session.setAttribute("nick", nick);
		session.setAttribute("email", email);
		response.sendRedirect("loginSucc.jsp");
	}
	else {
		%><script>alert("아이디나 비밀번호가 틀립니다."); history.go(-1)</script><%
		return;
	}
%>
</body>
</html>