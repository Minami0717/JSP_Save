<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="mall.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="mall.Product"%>
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
			
	String id = multi.getParameter("id");
	String name = multi.getParameter("name");
	String des = multi.getParameter("des");
	String maker = multi.getParameter("maker");
	String category = multi.getParameter("category");
	String condition = multi.getParameter("condition");
	
	int price,stock;
	if (multi.getParameter("price").isEmpty())
		price = 0;
	else
		price = Integer.parseInt(multi.getParameter("price"));
		
	if (multi.getParameter("stock").isEmpty())
		stock = 0;
	else
		stock = Integer.parseInt(multi.getParameter("stock"));
	
	Product product = new Product();
	product.setId(id);
	product.setName(name);
	product.setDescription(des);
	product.setMaker(maker);
	product.setCategory(category);
	product.setCondition(condition);
	product.setImage(image);
	product.setPrice(price);
	product.setStock(stock);
	
	int result = ProductDao.getInstance().insert(product);
	if (result != 0)
		response.sendRedirect("products.jsp");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>