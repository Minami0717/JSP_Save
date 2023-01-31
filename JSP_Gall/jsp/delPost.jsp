<%@page import="gall.ReplyDao"%>
<%@page import="gall.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	
	int result = PostDao.getInstance().delete(p_idx);
	ReplyDao.getInstance().delete(p_idx);
	
	if (result != 0) {
		%><script>alert("삭제되었습니다."); location.href="gallMain.jsp?idx=<%=idx%>"</script><%
	}
%>