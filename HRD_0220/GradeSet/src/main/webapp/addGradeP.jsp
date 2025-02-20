<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%

	String sql = "insert into student_tbl_03 values(?,?,?,?,?)";
	Connection con = DBConnect.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,request.getParameter("sno"));
	pstmt.setString(2,request.getParameter("ekor"));
	pstmt.setString(3,request.getParameter("emath"));
	pstmt.setString(4,request.getParameter("eeng"));
	pstmt.setString(5,request.getParameter("ehist"));
	
	pstmt.executeUpdate();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:forward page="studentList.jsp"></jsp:forward>
</body>
</html>