<%@page import="gall.Post"%>
<%@page import="gall.PostDao"%>
<%@page import="gall.ReplyDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="gall.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	Integer p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String nick = request.getParameter("nickname");
	String pw = request.getParameter("pw");
	String rep = request.getParameter("reply");
	
	if(nick.isEmpty()) {
		%><script>alert("닉네임을 입력하세요."); history.back()</script><%
		return;
	}
	if(pw.isEmpty()) {
		%><script>alert("비밀번호를 입력하세요."); history.back()</script><%
		return;
	}
	if(rep.isEmpty()) {
		%><script>alert("댓글을 입력하세요."); history.back()</script><%
		return;
	}
	
	Reply reply = new Reply();
	reply.setNickname(nick);
	reply.setContents(rep);
	reply.setPost_idx(p_idx);
	String date = LocalDateTime.now().format(
			DateTimeFormatter.ofPattern("MM.dd HH:mm:ss"));
	reply.setDate(date);
	
	if(session.getAttribute("code") == null)
		reply.setMember_id(null);
	else
		reply.setMember_id(session.getAttribute("code").toString());
	
	Post post = PostDao.getInstance().select(p_idx);
	post.setHits(post.getHits()-1);
	
	int result = ReplyDao.getInstance().insert(reply);
	if (result != 0) {
		PostDao.getInstance().updateReply(p_idx);
		PostDao.getInstance().update(post);
		response.sendRedirect("result.jsp?idx="+idx+"&p_idx="+p_idx);
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