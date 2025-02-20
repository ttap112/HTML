<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkVal() {
		if (!document.data.sno.value) {
			alert("학번을 입력하세요.");
			data.sno.focus()
			return false;
		} else if (!document.data.sno.value) {
			alert("국어 점수를 입력하세요.");
			data.sno.focus()
			return false;
		} else if (!document.data.sno.value) {
			alert("수학 점수를 입력하세요.");
			data.sno.focus()
			return false;
		} else if (!document.data.sno.value) {
			alert("영어 점수를 입력하세요.");
			data.sno.focus()
			return false;
		} else if (!document.data.sno.value) {
			alert("역사 점수를 입력하세요.");
			data.sno.focus()
			return false;
		} else {
			alert("학생 성적이 모두 입력되었습니다.");
			return true;
		}
	}
</script>
</head>
<body>
	<jsp:include page="jsp/header.jsp"></jsp:include>
	<jsp:include page="jsp/nav.jsp"></jsp:include>
	<section class="section">
		<h2>성적입력</h2>
		<form action="addGradeP.jsp" method="post" name="data" onsubmit="return checkVal()">
			<table class="table_style">
				<tr>
					<th>학번</th>
					<td><input type="text" name="sno"></td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td><input type="text" name="ekor"></td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td><input type="text" name="emath"></td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td><input type="text" name="eeng"></td>
				</tr>
				<tr>
					<th>역사점수</th>
					<td><input type="text" name="ehist"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록하기">
						<input type="reset" value="다시입력">
						<input type="button" value="학생목록조회" onclick="location.href='studentList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="jsp/footer.jsp"></jsp:include>
</body>
</html>