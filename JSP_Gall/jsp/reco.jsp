<%@page import="gall.Post"%>
<%@page import="gall.RecoListDao"%>
<%@page import="java.net.InetAddress"%>
<%@page import="gall.RecoList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.LocalDate"%>
<%@page import="gall.PostDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	Integer idx = Integer.parseInt(request.getParameter("idx"));
	int p_idx = Integer.parseInt(request.getParameter("p_idx"));
	String reco = request.getParameter("reco");
	String date = LocalDate.now().toString();
	int result = 0;
	
	String ipAddress = request.getRemoteAddr();
	if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
	    InetAddress inetAddress = InetAddress.getLocalHost();
	    ipAddress = inetAddress.getHostAddress();
	}

	RecoList recoList = new RecoList();
	recoList.setPost_idx(p_idx);
	recoList.setUser_ip(ipAddress);
	recoList.setDate(date);
	
	Post post = PostDao.getInstance().select(p_idx);
	post.setHits(post.getHits()-1);
	
	if (reco.equals("re")) {
		recoList.setReco(true);
		
		if (RecoListDao.getInstance().isReco(recoList)) {
			%><script>alert("추천은 1일 1회만 가능합니다."); history.back();</script><%
			return;
		}
		
		result = PostDao.getInstance().updateReco(p_idx);
		RecoListDao.getInstance().insert(recoList);
		PostDao.getInstance().update(post);
	}
	else if (reco.equals("de")) {
		recoList.setReco(false);
		
		if (RecoListDao.getInstance().isReco(recoList)) {
			%><script>alert("비추천은 1일 1회만 가능합니다."); history.back();</script><%
			return;
		}
		
		result = PostDao.getInstance().updateDeco(p_idx);
		RecoListDao.getInstance().insert(recoList);
		PostDao.getInstance().update(post);
	}
	
	if (result != 0)
		response.sendRedirect("result.jsp?idx="+idx+"&p_idx="+p_idx);
%>