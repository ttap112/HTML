<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import = "DB.DBConnect" %>
<%

	String sql = " select custno, custname, phone, address,  "
		  + " to_char(joindate, 'yyyy-mm-dd')  joindate,"
		  + " grade, city from member_tbl_02 where custno= "
		  +   request.getParameter("click_custno");  
	
	Connection conn = DB.DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function checkValue() {
		if (!document.data.custname.value) {
			alert("회원성명을 입력하세요.");
			data.custname.focus();
			return false;
		} else if (!document.data.phone.value) {
			alert("전화번호를 입력하세요.");
			data.custname.focus();
			return false;
		} else if (!document.data.address.value) {
			alert("주소를 입력하세요.");
			data.custname.focus();
			return false;
		} else if (!document.data.joindate.value) {
			alert("가입일자를 입력하세요.");
			data.custname.focus();
			return false;
		} else if (!document.data.grade.value) {
			alert("등급을 입력하세요.");
			data.custname.focus();
			return false;
		} else if (!document.data.city.value) {
			alert("도시코드를 입력하세요.");
			data.custname.focus();
			return false;
		} else {
			alert("등록이 완료됐습니다.");
			return true;
		}
	}
	function checkDel(f_custno) {
		msg = "정말로 삭제하시겠습니까?";
		if(confirm(msg)!=0)
		   {                   alert("삭제되었습니다.");
			                    location.href ="delete.jsp?d_custno="+f_custno;
	  }else{
		         alert("삭제가 취소되었습니다.");
	  }		
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/style.css">
</head>
<body>
	<jsp:include page="jsp/header.jsp"></jsp:include>
	<jsp:include page="jsp/nav.jsp"></jsp:include>
	<section class="section">
		<h2>홈쇼핑 정보 조회</h2>
		<form action="update_p.jsp" method="post" name="data" onsubmit="return checkValue()">
			<table class="table_style">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%=rs.getString("custno")%>" readonly ></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%=rs.getString("custname")%>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" value="<%=rs.getString("phone")%>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%=rs.getString("joindate")%>"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type="text" name="grade" value="<%=rs.getString("grade")%>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%=rs.getString("city")%>"></td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="button" value="삭제" onclick="checkDel(<%=rs.getString("custno")%>)">
						<input type="submit" value="수정">
						<input type="button" value="조회" onclick="userList.jsp">

					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="jsp/footer.jsp"></jsp:include>
</body>
</html>