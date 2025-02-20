<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%
	
	String sql = "select sno,sname,substr(sno,1,1) grade,substr(sno,2,2) class,substr(sno,4,2) num,sphone,case sgender when 'M' then '남자' else '여자' end sgender,saddress from STUDENT_TBL_03";
	Connection con = DBConnect.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="jsp/header.jsp"></jsp:include>
	<jsp:include page="jsp/nav.jsp"></jsp:include>
	<section class="section">
		<h2>학생목록</h2>
		<table class="table_style">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<% while(rs.next())  {%>
			<tr>
				<td><%= rs.getString("sno") %></td>
				<td><%= rs.getString("sname") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("class") %></td>
				<td><%= rs.getString("num") %></td>
				<td><%= rs.getString("sgender") %></td>
				<td><%= rs.getString("sphone") %></td>
				<td><%= rs.getString("saddress") %></td>
			</tr>
			<% } %>
		</table>
	</section>
	<jsp:include page="jsp/footer.jsp"></jsp:include>
</body>
</html>