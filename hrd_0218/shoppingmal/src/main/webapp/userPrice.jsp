<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import = "DB.DBConnect" %>
<%

	String sql = "select m.custno,m.custname, case grade when 'A' then 'VIP' when 'B' then '일반' else '직원' end grade, sum(mo.price) price from member_tbl_02 m, money_tbl_02 mo where m.custno = mo.custno and mo.price is not null group by m.custno, m.custname, grade order by sum(mo.price) desc";
	
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
		<table class="table_style">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<% int i = 0;
			while (rs.next()) { %>
			<tr>
				<td><%= rs.getString("custno") %></td>
				<td><%= rs.getString("custname")%></td>
				<td><%= rs.getString("grade")%></td>
				<td><%= rs.getString("price")%></td>
			</tr>
			<% i += Integer.parseInt(rs.getString("price"));  }%>
			<tr>
				<td colspan="3"> 총합 </td>
				<td><%= i %></td>
			</tr>
		</table>
	</section>
	<jsp:include page="jsp/footer.jsp"></jsp:include>
</body>
</html>