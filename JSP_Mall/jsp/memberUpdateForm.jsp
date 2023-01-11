<%@page import="mall.MemberDao"%>
<%@page import="mall.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Member member = MemberDao.getInstance().selectOne(session.getAttribute("id").toString());
%>
<html>
<head>
<meta charset="UTF-8">
<title>Minami Mall</title>
<style>
	#title {background: #C3B091; height: 70px; padding: 100px;}
	.center {text-align: center;}
	
	input {margin: 5px;}
	.input {width: 200px; height: 30px; background: #f3f3f3; border: none;}
	.btn {width: 330px; height: 40px; background-color: #3b4890; color: white; border: none; cursor: pointer;}
	
	#jForm {margin: 20px;}
	label:not(label[for=m]) {display: inline-block; width: 120px;}
</style>
</head>
<body>
	<%@include file="menu.jsp" %>
	<div id=title><h1 class=center>회원정보 수정</h1></div>
	<div align=center id=jForm>
		<form action="memberUpdate.jsp" method=post>
			<table>
				<tr>
					<td>
						<label for=i>아이디</label>
						<input type=text class=input name=id id=i value=<%=member.getId() %> readonly>
					</td>
				</tr>
				<tr>
					<td>
						<label for=p>비밀번호</label>
						<input type=password class=input name=pw id=p>
					</td>
				</tr>
				<tr>
					<td>
						<label for=pc>비밀번호 확인</label>
						<input type=password class=input name=pwCheck id=pc>
					</td>
				</tr>
				<tr>
					<td>
						<label for=n>이름</label>
						<input type=text class=input name=name id=n value=<%=member.getName() %>>
					</td>
				</tr>
				<tr>
					<td>
						<label for=w>성별</label>
						<%
							if (member.getGender() == null) {
								%><input type="radio" name=gender id=m value=남><label for=m>남</label>
								<input type="radio" name=gender id=w value=여><label for=w>여</label><%
							}
							else if (member.getGender().equals("남")) {
								%><input type="radio" name=gender id=m value=남 checked><label for=m>남</label>
								<input type="radio" name=gender id=w value=여><label for=w>여</label><%
							}
							else {
								%><input type="radio" name=gender id=m value=남><label for=m>남</label>
								<input type="radio" name=gender id=w value=여 checked><label for=w>여</label><%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>
						<label for=b>생일</label>
						<input type="date"class=input name=birth id=b value=<%=member.getBirth() %>>
					</td>
				</tr>
				<tr>
					<td>
						<label for=e>이메일</label>
						<input type="email" class=input name=email id=e value=<%=member.getEmail() %>>
					</td>
				</tr>
				<tr>
					<td>
						<label for=ph>휴대폰 번호</label>
						<input type=tel class=input name=phone id=ph value=<%=member.getPhone() %>>
					</td>
				</tr>
				<tr>
					<td>
						<label for=a>주소</label>
						<input type="text" class=input name=address id=a value=<%=member.getAddress() %>>
					</td>
				</tr>
				<tr>
					<td><input type=submit value="정보 수정" class=btn></td>
				</tr>
				<tr>
					<td><input type=button value="회원 탈퇴" class=btn onclick=del()></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
<script>
	function del() {
		if (confirm("정말 탈퇴하시겠습니까?"))
			location.href="delMember.jsp";
	}
</script>
</html>