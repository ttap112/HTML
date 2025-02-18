<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import = "DB.DBConnect" %>
<%
request.setCharacterEncoding("UTF-8");
	String sql = "delete from member_tbl_02 where custno="+Integer.parseInt(request.getParameter("d_custno"));
	
	Connection conn = DB.DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/style.css">
</head>
<body>
	<jsp:forward page="userList.jsp"></jsp:forward>
</body>
</html>