<%@page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>
            留言板登陆
        </title>
    </head>
<body bgcolor="#ffffcc">
  <center>
  <form action="CheckUser.jsp" method=”post” >
    <font size=6 color=red>请先登录!</font><br><br><br>
  用户名：<input type="text" name="userName"><br><br>
  密&nbsp; 码：<input type="password" name="password"> <br><br>
  <input type="submit" value="登陆">
  <input type="reset" value="取消">
  </form>
</center>
  </body>
</html>