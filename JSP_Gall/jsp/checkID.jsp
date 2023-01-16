<%@page import="gall.User"%>
<%@page import="gall.UserDao"%>
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
		%><script>alert("식별 코드를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	if(inputPw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	User user = UserDao.getInstance().select(inputCode);
	
	String code = user.getCode();
	String pw = user.getPw();
	String nick = user.getNick();
	String email = user.getEmail();
	
	if(inputCode.equals(code) && inputPw.equals(pw)) {
		session.setAttribute("code", code);
		session.setAttribute("pw", pw);
		session.setAttribute("nick", nick);
		session.setAttribute("email", email);
	}
	else {
		%><script>alert("아이디나 비밀번호가 틀립니다."); history.go(-1)</script><%
		return;
	}
	
	if(request.getParameter("where").equals("main"))
		response.sendRedirect("main.jsp");
	else if(request.getParameter("where").equals("gall")) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		response.sendRedirect("gallMain.jsp?idx="+idx);
	}
%>
</body>
</html>