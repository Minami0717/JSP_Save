<%@page import="mall.MemberDao"%>
<%@page import="mall.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String inputId = request.getParameter("id");
	String inputPw = request.getParameter("pw");
	
	if(inputId.isEmpty()) {
		%><script>alert("아이디를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	if(inputPw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	
	Member member = MemberDao.getInstance().selectOne(inputId);
	
	
	if(inputId.equals(member.getId()) && inputPw.equals(member.getPw())) {
		session.setAttribute("id", member.getId());
		session.setAttribute("pw", member.getPw());
		session.setAttribute("name", member.getName());
		session.setAttribute("gender", member.getGender());
		session.setAttribute("birth", member.getBirth());
		session.setAttribute("email", member.getEmail());
		session.setAttribute("phone", member.getPhone());
		session.setAttribute("address", member.getAddress());
		session.setAttribute("regist_day", member.getRegist_day());
		response.sendRedirect("home.jsp");
	}
	else {
		%><script>alert("아이디나 비밀번호가 틀립니다."); history.go(-1)</script><%
		return;
	}
%>