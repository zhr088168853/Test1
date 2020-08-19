<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>
            留言板编辑
        </title>
    </head>
 <body bgcolor="#ffffcc">
<form action="Addmessage.jsp" methed="post">
<table align="center">
	<tr>
		<td>用户名：</td>
		<td><input type="text" name="name" size="20"></td>
	</tr>
	<tr height="30">
		<td>留言标题：</td>
		<td><input type="text" name="title" size="35"></td>
	</tr>
	<tr>
		<td>留言内容：</td>
		<td><textarea name="content" rows="8" cols="34"></textarea></td>
	</tr>
	<tr align="center">
	<td colspan="2"><input type="submit" value="留言"> 
	<input type="reset" value="清除"></td>
	</tr>
	</table>
	</form>
  </body>
</html>