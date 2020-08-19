<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*"%> 
<html>
    <head>
        <title>
            留言板展示
        </title>
    </head>
<body bgcolor="#ffffcc">
	<font size=6 color=red><p align="center">
			<strong>留&nbsp; 言&nbsp; 板</strong>
		</p> </font>
	<form action="Display.jsp" method="post">
		请输入查询内容：<input type="text" name="keyword" />&nbsp;&nbsp;<input
			type="submit" value="查询" />
	</form>
	<hr>
	<table width="600" border="1" align="center">
		<tr>
			<td width=115><font size=4><strong>用户名</strong> </font></td>
			<td width=86><font size=4><strong>标题</strong> </font></td>
			<td width=291><font size=4><strong>留言内容</strong> </font></td>
			<td width=86><font size=4><strong>操作</strong> </font></td>
		</tr>
		<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();//加载驱动程序
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/people1?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true","root","root"); 
				request.setCharacterEncoding("UTF-8");
				String keyword = request.getParameter("keyword");
				// Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				if (keyword == null) {//刚跳转到此页面时（即还没输入内容点击查询按钮）将数据库的Name,Title,Content字段查询出来
					sql = "select Name,Title,Content from user ";//避免将默认的id字段也选择出来，所以要指定字段选择出来
					pstmt = conn.prepareStatement(sql);
				} 
				else {    //输入内容点击查询按钮执行
					sql = "select Name,Title,Content from user where Name like ? OR Title like ? OR Content like ?";//将符合查询条件的记录的Name,Title,Content选择出来
					pstmt = conn.prepareStatement(sql);
					keyword="%" + keyword + "%";        //若包含输入的内容都可以将相应的记录查询出来（模糊查询）
					pstmt.setString(1, keyword );
					pstmt.setString(2, keyword );
					pstmt.setString(3, keyword );
				}                        
				rs = pstmt.executeQuery();
				int intPageSize; //一页显示的记录数
				int intRowCount; //记录的总数
				int intPageCount; //总页数
				int intPage; //待显示的页码
				String strPage;
				int i;
				intPageSize = 6; //设置一页显示6条记录,当超过6条记录时自动翻页显示
				strPage = request.getParameter("page");//取得待显示的页码
				if (strPage == null) //判断strPage是否等于null,如果是，显示第一页数据
				{
					intPage = 1;
				} else {
					intPage = java.lang.Integer.parseInt(strPage); //将字符串转换为整型
				}
				if (intPage < 1) {
					intPage = 1;
				}
				rs.last();//获取记录总数
				intRowCount = rs.getRow();
				intPageCount = (intRowCount + intPageSize - 1) / intPageSize; //计算机总页数
				if (intPage > intPageCount)
					intPage = intPageCount; //调整待显示的页码
				if (intPageCount > 0) {
					rs.absolute((intPage - 1) * intPageSize + 1); //将记录指针定位到待显示页的第一条记录上
				}
				//下面用于显示数据
				i = 0;
				while (i < intPageSize && !rs.isAfterLast()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><a href="UpdateMessage.jsp?name=<%=rs.getString(1)%>">修改</a>|
                            <a href="DeleteMessage.jsp?name=<%=rs.getString(1)%>">删除</a></td>
		</tr>
		<%
			rs.next();
                        i++;
				}
				rs.close();//关闭连接、释放资源
				pstmt.close();
				conn.close();
		%>
        </table>
		<div align="center">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共<%=intRowCount%>个记录，分<%=intPageCount%>页显示，当前页是：第<%=intPage%>页
			&nbsp; &nbsp; &nbsp; &nbsp; <a href="index.jsp">|留言板主页|</a>
			<%
				for (int j = 1; j <= intPageCount; j++) {
						out.print("&nbsp;&nbsp;<a href='Display.jsp?page=" + j
								+ "'>" + j + "</a>");
					}
			%>
		</div>
		<%
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
</body>
</html>