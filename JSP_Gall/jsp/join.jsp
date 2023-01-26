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
	String code = request.getParameter("code");
	String pw = request.getParameter("pw");
	String pwCheck = request.getParameter("pwCheck");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");
	boolean isFixed = Boolean.parseBoolean(request.getParameter("fixed"));
	
	if(code.isEmpty()) {
		%><script>alert("개인 식별 코드를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(pw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(pwCheck.isEmpty()) {
		%><script>alert("비밀번호확인을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(nick.isEmpty()) {
		%><script>alert("닉네임을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(request.getParameter("email1").isEmpty() || request.getParameter("email2").isEmpty()) {
		%><script>alert("이메일을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(!pw.equals(pwCheck)) {
		%><script>alert("비밀번호가 일치하지 않습니다."); history.go(-1)</script><%
		return;
	}
	if(!UserDao.getInstance().codeCheck(code)) {
		%><script>alert("이미 사용중인 식별 코드입니다."); history.go(-1)</script><%
		return;
	}
	
	User user = new User();
	user.setCode(code);
	user.setPw(pw);
	user.setNick(nick);
	user.setEmail(email);
	user.setFixed(isFixed);
	
	int result = UserDao.getInstance().insert(user);
	if(result != 0)
		response.sendRedirect("joinSucc.jsp");
%>
</body>
</html>