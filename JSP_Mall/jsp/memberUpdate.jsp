<%@page import="mall.MemberDao"%>
<%@page import="mall.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwCheck = request.getParameter("pwCheck");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	if(pw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(pwCheck.isEmpty()) {
		%><script>alert("비밀번호 확인을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(name.isEmpty()) {
		%><script>alert("이름을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(gender.isEmpty()) {
		%><script>alert("성별을 선택하세요."); history.go(-1)</script><%
		return;
	}
	if(birth.isEmpty()) {
		%><script>alert("생일을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(email.isEmpty()) {
		%><script>alert("이메일을 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(phone.isEmpty()) {
		%><script>alert("휴대폰 번호를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(address.isEmpty()) {
		%><script>alert("주소를 입력하세요."); history.go(-1)</script><%
		return;
	}
	if(!pw.equals(pwCheck)) {
		%><script>alert("비밀번호가 일치하지 않습니다."); history.go(-1)</script><%
		return;
	}
	
	Member member = new Member();
	member.setId(id);
	member.setPw(pw);
	member.setName(name);
	member.setGender(gender);
	member.setBirth(birth);
	member.setEmail(email);
	member.setPhone(phone);
	member.setAddress(address);
	
	int result = MemberDao.getInstance().update(member);
	if(result != 0)
		response.sendRedirect("updateSucc.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>