<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
     <head>
        <title>
            删除留言
        </title>
    </head>
  <body>
   <%!
    String DBDRIVER = "com.mysql.jdbc.Driver";
	String DBURL = "jdbc:mysql://localhost:3306/people1?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";
	String DBUSER = "root";
	String DBPASSWORD = "root";
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	boolean flag = false;
	%>
 <%
       request.setCharacterEncoding("UTF-8");
       String name=request.getParameter("name");
       try{
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            sql = "delete from user where Name =?";     
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.executeUpdate();  
            pstmt.close();
            conn.close();
            flag = true;//若删除成功则flag=true
       }catch(Exception e){
          e.printStackTrace();
       }
    %> 
    <%
       if(flag){
          response.setHeader("refresh","5;URL=Display.jsp");
          %>
        <center>   
           您删除成功！！<br/>
           5秒钟自动跳转到留言管理页面！！<br/>
           如何没有跳转，请点击<a href="Display.jsp">这里</a>！！
        </center>
          <% 
       }else{
          response.setHeader("refresh","5;URL=Display.jsp");
          %>
        <center>   
           您删除失败！！<br/>
           5秒钟自动跳转到留言管理页面！！<br/>
           如何没有跳转，请点击<a href="Display.jsp">这里</a>！！
        </center>
          <% 
       }
     %>
  </body>
</html>