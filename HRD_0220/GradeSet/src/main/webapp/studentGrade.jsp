<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DB.DBConnect" %>
<%
    String sql = "select " +
    "substr(s.sno,1,1) grade, " +
    "substr(s.sno,2,2) class, " +
    "substr(s.sno,4,2) num, " +
    "s.sname, " +
    "nvl(e.ekor,0) ekor, " +
    "nvl(e.emath,0) emath, " +
    "nvl(e.eeng,0) eeng, " +
    "nvl(e.ehist,0) ehist, " +
    "nvl(e.ekor,0)+nvl(e.emath,0)+nvl(e.eeng,0)+nvl(e.ehist,0) as total, " +
    "(nvl(e.ekor,0)+nvl(e.emath,0)+nvl(e.eeng,0)+nvl(e.ehist,0))/4 as avg, " +
    "rank() over(order by nvl(e.ekor,0)+nvl(e.emath,0)+nvl(e.eeng,0)+nvl(e.ehist,0) desc) rank " +
    "from STUDENT_TBL_03 s, exam_tbl_03 e " +
    "where s.sno = e.sno(+) " +
    "order by avg desc";

    Connection con = DBConnect.getConnection();
    PreparedStatement pstmt = con.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
    function changeBin() {
        var rows = document.querySelectorAll('.table_style tr');
        for (var i = 1; i < rows.length; i++) {
            var cols = rows[i].querySelectorAll('td');
            var rank = parseInt(cols[10].innerText);
            var math = parseInt(cols[5].innerText);
            var total = parseInt(cols[8].innerText);
            var avg = parseFloat(cols[9].innerText);
            var kor = parseInt(cols[4].innerText);
            var eng = parseInt(cols[6].innerText);
            var hist = parseInt(cols[7].innerText);

            if (rank > 4) {
                cols[10].innerText = ""; 
            }
            if (math === 0) {
                cols[5].innerText = ""; 
            }
            if (total === 0) {
                cols[8].innerText = ""; 
            }
            if (avg === 0) {
                cols[9].innerText = ""; 
            }
            if (kor === 0) {
                cols[4].innerText = ""; 
            }
            if (eng === 0) {
                cols[6].innerText = ""; 
            }
            if (hist === 0) {
                cols[7].innerText = ""; 
            }
        }
    }

    window.onload = function() {
        changeBin();
    };
</script>
</head>
<body>
    <jsp:include page="jsp/header.jsp"></jsp:include>
    <jsp:include page="jsp/nav.jsp"></jsp:include>
    <section class="section">
        <h2>학생 성적</h2>
        <table class="table_style">
            <tr>
                <th>학년</th>
                <th>반</th>
                <th>번호</th>
                <th>이름</th>
                <th>국어</th>
                <th>수학</th>
                <th>영어</th>
                <th>역사</th>
                <th>합계</th>
                <th>평균</th>
                <th>순위</th>
            </tr>
            <%
                int kor = 0;
                int math = 0;
                int eng = 0;
                int hist = 0;
                int total = 0;
                float avg = 0;
                while (rs.next()) { 
            %>
            <tr>
                <td><%=rs.getString("grade") %></td>
                <td><%=rs.getString("class") %></td>
                <td><%=rs.getString("num") %></td>
                <td><%=rs.getString("sname") %></td>
                <td><%=rs.getString("ekor") %></td>
                <td><%=rs.getString("emath") %></td>
                <td><%=rs.getString("eeng") %></td>
                <td><%=rs.getString("ehist") %></td>
                <td><%=rs.getString("total") %></td>
                <td><%=Math.round(Float.parseFloat(rs.getString("avg")) * 10) / 10.0 %>
                <td><%=rs.getString("rank") %></td>
            </tr>
            <%
                kor += Integer.parseInt(rs.getString("ekor"));
                math += Integer.parseInt(rs.getString("emath"));
                eng += Integer.parseInt(rs.getString("eeng"));
                hist += Integer.parseInt(rs.getString("ehist"));
                total += Integer.parseInt(rs.getString("total"));
                avg += Float.parseFloat(rs.getString("avg"));
            }
            avg /= 4;
            
            float Avg = (float) Math.round(avg * 10) / 10.0f;  
            %>
            <tr>
                <td colspan="4">총 합</td>
                <td><%=kor %></td>
                <td><%=math %></td>
                <td><%=eng %></td>
                <td><%=hist %></td>
                <td><%=total %></td>
                <td><%=Avg %></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4">총평균</td>
                <td><%=Math.round(((float)kor / 4) * 10) / 10.0 %></td>
                <td><%=math / 4 %></td>
                <td><%=eng / 4 %></td>
                <td><%=(float)hist / 4 %></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </section>
    <jsp:include page="jsp/footer.jsp"></jsp:include>
</body>
</html>
