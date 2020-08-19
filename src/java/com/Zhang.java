package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Zhang {
	public static void main(String[] args) throws Exception{
		String username = javax.swing.JOptionPane.showInputDialog(null, "输入用户名");
		String userpwd = javax.swing.JOptionPane.showInputDialog(null, "输入密码");
		String sex = javax.swing.JOptionPane.showInputDialog(null, "输入性别");
                String  age= javax.swing.JOptionPane.showInputDialog(null, "输入年龄");
                String eamil = javax.swing.JOptionPane.showInputDialog(null, "输入邮箱");
		Class.forName("jdbc:mysql://localhost:3306/test?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true");
		Connection conn = DriverManager.getConnection("com.mysql.cj.jdbc.Driver","root","root");
		Statement stat = conn.createStatement();
		String sql = "INSERT INTO userinfo(userName,userPwd,userSex,userAge,eamil) VALUES('"+username+"','"+userpwd+"','"+sex+"','"+age+"','"+eamil+"')";
		int i = stat.executeUpdate(sql);
		System.out.println("成功添加" + i + "行");
		stat.close();
		conn.close();
	}
}
