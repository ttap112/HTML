<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<link rel="stylesheet"href="style/style.css">
<script type="text/javascript">
            function checkValue2() {
                                 if(!document.data1.in_custno.value){
                                	     alert("회원번호를 입력하세요.");
	   				 				     document.data1.in_custno.focus();      
	   				 				     return false;
                                 } return true;          	
                  }
</script>
</head>
<body>

<header>
	  <jsp:include page="jsp/header.jsp"></jsp:include>
 </header>
 <nav>
   	 <jsp:include page="jsp/nav.jsp"></jsp:include>
 </nav>
<section class="section">
   	 <h2>회원조회</h2><br>
<form name = "data1" action="userProfile_p.jsp" method="post" onsubmit="return checkValue2()" >
         <table class="table_style">
				<tr>
					<th>회원 번호</th>
					<td><input type="text" name="in_custno" size="10"> 
					</td>
				</tr>
                <tr>
					<td colspan="2" align="center">						
						<input type="button" value="취소" onclick="location.href='userProfile_p.jsp'">
						<input type="submit" value="조회"  >
				</tr>
			</table>
</form>
</section>
<footer>
	<jsp:include page="jsp/footer.jsp"></jsp:include>
</footer>
</body>
</html>








