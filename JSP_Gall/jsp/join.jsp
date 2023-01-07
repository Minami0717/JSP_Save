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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwCheck = request.getParameter("pwCheck");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String job = request.getParameter("job");
	
	if(id.isEmpty()) {
		%><script>alert("아이디를 입력하세요."); history.go(-1)</script><%
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
	
	if(name.isEmpty()) {
		%><script>alert("이름을 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	if(!pw.equals(pwCheck)) {
		%><script>alert("비밀번호가 일치하지 않습니다."); history.go(-1)</script><%
		return;
	}
	
	if(!FriendDao.getInstance().idCheck(id)) {
		%><script>alert("이미 사용중인 아이디입니다."); history.go(-1)</script><%
		return;
	}
	
	Friend friend = new Friend();
	friend.setId(id);
	friend.setPw(pw);
	friend.setName(name);
	friend.setAge(age);
	friend.setJob(job);
	
	int result = FriendDao.getInstance().insert(friend);
	if(result != 0)
		response.sendRedirect("joinSucc.jsp");
	else
		response.sendRedirect("joinFail.jsp");
%>
</body>
</html>