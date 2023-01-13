<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Random"%>
<%@page import="gall.PostDao"%>
<%@page import="gall.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Random random = new Random();

	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = GallListDao.getInstance().selectGallName(idx);
	
	ArrayList<String> vList = (ArrayList)session.getAttribute("visitList");
	if (vList == null) {
		vList = new ArrayList<String>();
		vList.add(name);
		session.setAttribute("visitList", vList);
	}
	else {
		if (vList.contains(name))
			vList.remove(name);
		
		vList.add(name);
	}
	
	List<Post> list = PostDao.getInstance().selectAll(idx);
%>
<%!
	boolean exists(int n[], int num) {
	    for (int i = 0; i < n.length; i++) {
	        if(n[i] == num)
	            return true;
	    }
	    return false;
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	main {margin-left: 25%; width: 50%;}
	section {width: 70%; float: left;}
	h2 a {color: #29367c}
	
	table {width: 100%; text-align: center; border-bottom: 1px solid #3b4890; border-spacing: 0; font-size: 13px;
	border-collapse: collapse;}
	th {border-bottom: 1px solid #3b4890; border-top: 2px solid #3b4890; height: 37px;}
	td {height: 25px; vertical-align: middle; border-top: 1px solid gainsboro;}
	
	#mid button {width: 82px; height: 32px; background: #3b4890; color: white; border: 1px solid #29367c; margin: 15px 0 5px;
	font-weight: bold; border-radius: 2px; cursor: pointer;}	
	#mid .white {background: white; color: black; border: 1px solid #ccc;}
	#mid .right div {border: 1px solid #29367c; font-size: 13px; color: #29367c; font-weight: bold; padding: 0 5px; cursor: pointer;}
	#mid img {width: 13px;}
	#mid > .right {margin-top: 27px;}
	#mid select {margin-right: 2px;}
	
	#bot button {width: 82px; height: 35px; background: #3b4890; color: white; border: 1px solid #29367c; border-bottom-width: 3px;
	margin-top: 10px; margin-bottom: 40px; font-weight: bold; border-radius: 2px; cursor: pointer;}	
	#bot #idea {background: white; color: #3b4890;}	
	#header {padding: 20px 0;}
	
	#issue_box {border-top: 2px solid #3b4890; border-bottom: 1px solid gainsboro; padding: 20px; font-size: 13px;}
	#issue_box ul {float: left; width: 300px;}
	#issue_box li,#issue_box p {margin-bottom: 5px;}
	#issue_box img {width: 150px; border: 1px solid #3b4890; margin: 0 10px;}
	
	#login {border: 1px solid #3b4890; float: right; margin-top: 20px;}
	#login img {width: 15px; height: 15px;}
	#login p {padding: 10px 20px;}
	#login p a {color: #29367c; font-weight: bold; font-size: 14px;}
	#login p a:hover {text-decoration: none;}
	#login div {background: #f3f3f3; padding: 10px 30px;}
	#login div a {font-size: 13px; font-weight: bold;}
	
	.inline {display: inline-block;}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main>
		<section>
			<div id=header>
				<h2><a href=gallMain.jsp?idx=<%=idx%>><%=name %> 갤러리</a></h2>
			</div>
			<div id=issue_box>
				<ul>
				<%
					if (list.size() >= 5) {
						int n[] = new int[5];
			        	int num = 0;
				        for(int i = 0; i<n.length; i++) {
				            do {
				            	num = random.nextInt(list.size());
				            }while(exists(n,num));
				            n[i] = num;
				        }
						for (int i = 0; i < n.length; i++) {
							%><li>
								<a href=result.jsp?idx=<%=list.get(n[i]).getIdx() %>><%=list.get(n[i]).getTitle() %></a>
								<span class=right><%=list.get(n[i]).getWriter() %></span>
							</li><%
						}
						num = random.nextInt(list.size());
						
						%></ul>
						<div>
							<a href=result.jsp?idx=<%=list.get(num).getIdx() %>><img src=image/image12.jpg align=top></a>
							<div class=inline>
								<p><a href=result.jsp?idx=<%=list.get(num).getIdx() %>><b><%=list.get(num).getTitle() %></b></a>
								<p><a href=result.jsp?idx=<%=list.get(num).getIdx() %>><%=list.get(num).getContent() %></a>
								<p><b>작성자</b> : <%=list.get(num).getWriter() %>
							</div>
						</div><%
					}
				%>
			</div>
			<div id=mid>
				<button onclick="location.href='gallMain.jsp?idx=<%=idx%>'">전체글</button>
				<button class=white>개념글</button>
				<button class=white>공지</button>
				<div class=right>
					<div class=right onclick="location.href='write.jsp?idx=<%=idx%>'">
						<img src=image/pencil.png>글쓰기
					</div>
					<select class=right>
						<option>30개
						<option selected="selected">50개
						<option>100개
					</select>
				</div>
			</div>
			<table>
				<thead>
					<tr>
						<th width=50px>번호
						<th>제목
						<th width=50px>글쓴이
						<th width=100px>작성일
						<th width=50px>조회
						<th width=50px>추천
					</tr>
				</thead>
				<tbody>
				<%
					for(Post p : list) {
						String date;
						if (!p.getDate().substring(0,10).equals(LocalDate.now().toString()))
							date = p.getDate().substring(5,10);
						else
							date = p.getDate().substring(11,16);
						%><tr>
							<td><%=p.getIdx() %>
							<td align=left><a href="result.jsp?idx=<%= idx %>&p_idx=<%=p.getIdx() %>"><%=p.getTitle() %></a>
							<td><%=p.getWriter() %>
							<td><%=date %>
							<td><%=p.getHits() %>
							<td><%=p.getRecommend() %><%
					}
				%>
				</tbody>
			</table>
			<div id=bot>
				<button onclick="location.href='gallMain.jsp?idx=<%=idx%>'">전체글</button>
				<button id=idea>개념글</button>
			</div>
		</section>
		<aside>
			<div id=login>
				<p><a href=loginForm.jsp>로그인해 주세요.</a>
				<div>
					<a href=#>MY갤로그</a> &nbsp;|&nbsp;
					<a href=#>즐겨찾기</a> &nbsp;|&nbsp;
					<a href=#><img src=image/bell.png> 알림</a>
				</div>
			</div>
		</aside>
	</main>
</body>
</html>