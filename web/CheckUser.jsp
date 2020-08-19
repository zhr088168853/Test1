<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="java.sql.*"%> 
<html>
  <body>
  <% 
       boolean flag = false ;
       request.setCharacterEncoding("utf-8");
       String username=request.getParameter("userName");
       String password=request.getParameter("password");
       try{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();//加载驱动程序
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/people1?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true","root","root"); 
            request.setCharacterEncoding("UTF-8");
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = null;
            String newname=null;
            String newpwd=null;
				    //输入内容点击查询按钮执行
            sql = "select userName,password from usercheck where userName=? and password=?";//将符合查询条件的记录选择出来
            pstmt = conn.prepareStatement(sql);		
            pstmt.setString(1, username );
            pstmt.setString(2, password );							                       
            rs = pstmt.executeQuery();
            while (rs.next()) {
		newname = rs.getString(1);
		newpwd = rs.getString(2);
            }
            pstmt.close() ;
            conn.close() ;
             // 如果修改成功，则肯定能执行到此段代码,若用户名和密码都正确则flag=true
            if(newname.equals(username) && newpwd.equals(password)){
                flag = true; 
            }        
       }  catch(Exception e)
   {
       e.printStackTrace();
   }
       if(flag)
       {
   %>
   <jsp:forward page="messageContent.jsp"/>
   <%
       }
       else{
            response.setHeader("refresh","5;URL=Login.jsp") ;
           %>
           <center>
           用户名或密码有误，5秒后跳转回登陆页面！！！<br>
           如果没有跳转，请按<a href="Login.jsp">这里</a>！！！
           </center>
          <%
       }
       %>
  </body>
</html>