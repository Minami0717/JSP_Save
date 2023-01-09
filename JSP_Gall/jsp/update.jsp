<%@page import="gall.User"%>
<%@page import="gall.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwCheck = request.getParameter("pwCheck");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String job = request.getParameter("job");
	
	if(pw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(pwCheck.isEmpty()) {
		%><script>alert("비밀번호확인을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(!pw.equals(pwCheck)) {
		%><script>alert("비밀번호가 일치하지 않습니다."); history.go(-1)</script><%
		return;
	}
	
	/* Friend friend = new Friend();
	friend.setId(id);
	friend.setPw(pw);
	friend.setName(name); */
	
	/* int result = FriendDao.getInstance().update(friend);
	if(result != 0) {
		response.addCookie(new Cookie("pw", pw));
		response.addCookie(new Cookie("age", age));
		response.addCookie(new Cookie("job", job));
		response.sendRedirect("updateSucc.jsp");
	}
	else
		response.sendRedirect("updateFail.jsp"); */
%>