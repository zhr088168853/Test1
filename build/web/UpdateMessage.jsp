<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<html>
    <head>
        <title>
            修改留言板
        </title>
    </head>
<body bgcolor="#ffffcc">
	<%!
        String DBDRIVER = "com.mysql.cj.jdbc.Driver";
	String DBURL = "jdbc:mysql://localhost:3306/people1?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
	String DBUSER = "root";
	String DBPASSWORD = "root";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	int result = 0;
        %>
	<p align="center">修改新留言</p>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		sql = "select Name,Title,Content from user where name=?";
		try {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String newname = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
	%>
	<form method="post" action="update_do.jsp">
		<table align="center">
			<tr>
				<td>用户名：</td>
                                <!--将获取到的值设为value的值就可以在文本框里显示出来-->
				<td><input type="text" name="name" value="<%=newname%>" size="20">
				</td>
			</tr>
			<tr height="30">
				<td>留言标题：</td>
				<td><input type="text" name="title" value="<%=title%>"
					size="35">
				</td>
			</tr>
			<tr>
				<td>内容：</td>
                                <!--将获取到的值放到<textArea>里就可以在文本区里显示出来-->
				<td><textarea name="content" rows="8" cols="34"><%=content%></textarea>
				</td>
			</tr>
			<tr align="center">
				<input type="hidden" name="oldname" value="<%=name%>">
                                <td colspan="2"><input type="submit" value="留言"> 
                                                <input type="reset" value="清除">
				</td>
			</tr>
		</table>
		<center>
			<h3>
				<a href="Display.jsp">返回留言管理列表</a>
			</h3>
	</form>
	<%
		}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<p>&nbsp;</p>
</body>
</html>