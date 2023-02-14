<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="gall.GallListDao"%>
<%@page import="gall.GallList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	String uploadPath = request.getRealPath("jsp/image");
	int size = 10*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size,
			"utf-8", new DefaultFileRenamePolicy());
			
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	String image = multi.getFilesystemName(file);
	
	String name = multi.getParameter("name");
	String desc = multi.getParameter("desc");
	String cate = multi.getParameter("cate");
	String admin = (String)session.getAttribute("code");
	
	GallList gall = new GallList();
	gall.setName(name);
	gall.setDesc(desc);
	gall.setCategory(cate);
	gall.setAdmin(admin);
	gall.setType("minor");
	gall.setDate(LocalDate.now().toString());
	gall.setImage(image);
	
	int result = GallListDao.getInstance().insert(gall);
	if(result != 0) {
		%><script>alert("개설이 완료되었습니다."); location.href="main.jsp"</script><%
	}
%>