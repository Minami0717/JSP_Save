<%@page import="gall.Post"%>
<%@page import="gall.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String pw = request.getParameter("pw");
	
	if(pw.isEmpty()){
		%><script>alert("비밀번호를 입력하세요."); history.back()</script><%
		return;
	}
	
	if(PostDao.getInstance().getPw(p_idx).equals(pw)) {
		if (request.getParameter("type").equals("mod"))
			response.sendRedirect("modifyForm.jsp?idx="+idx+"&p_idx="+p_idx);
		else if (request.getParameter("type").equals("del")) {
			%><script>
				if(confirm("게시글을 삭제하면 복구할 수 없습니다.\n정말 삭제하시겠습니까?"))
					location.href = "delPost.jsp?idx=<%=idx%>&p_idx=<%=p_idx%>"
				else
					history.back()
			</script><%
		}
	}
	else {
		%><script>alert("비밀번호가 맞지 않습니다."); history.back()</script><%
		return;
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