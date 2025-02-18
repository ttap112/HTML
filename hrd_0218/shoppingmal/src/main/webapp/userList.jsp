<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import = "DB.DBConnect" %>
<%
	String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd') joindate, case grade when 'A' then 'VIP' when 'B' then'일반' else '직원' end grade, city from member_tbl_02";
	
	Connection conn = DB.DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/style.css">
</head>
<body>
	<jsp:include page="jsp/header.jsp"></jsp:include>
	<jsp:include page="jsp/nav.jsp"></jsp:include>
	<section class="section">
		<h2>회원목록조회/수정</h2>
		<table class="table_style">
			<tr>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<% while (rs.next()) { %>
			<tr>
               <td><a href="update.jsp?click_custno=  <%= rs.getString("custno") %>" >      
                       <%= rs.getString("custno") %> </a>  
               </td>
               
               <td><%= rs.getString("custname") %></td>
               <td><%= rs.getString("phone") %></td>
				<td><%= rs.getString("address") %></td>
				<td><%= rs.getString("joindate") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("city") %></td>
				</tr>
               
<%					}				%>
			
		</table>
	</section>
	<jsp:include page="jsp/footer.jsp"></jsp:include>
</body>
</html>