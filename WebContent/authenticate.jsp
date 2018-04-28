<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp" %>


<%!Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public boolean verify(String userName, String password) {

		try {
			String sql = "select * from users where username = ? and password = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next()) {
				//System.out.println(rs.getString(1)+":"+rs.getString(2));
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}%>



<%
	String driverClass = application.getInitParameter("dbDriver");
	String url = application.getInitParameter("dbUrl");
	String dbUser = application.getInitParameter("dbUser");
	String dbPwd = application.getInitParameter("dbPwd");

	try {
		Class.forName(driverClass);
	} catch (Exception e) {
		e.printStackTrace();
	}

	conn = DriverManager.getConnection(url, dbUser, dbPwd);
	application.setAttribute("connection", conn);
	
	String userName = request.getParameter("userName");
	String password = request.getParameter("password");
	
	boolean flag = verify(userName, password);
		System.out.println("User name:"+ userName+ "\n Password:"+password+ "\n flag:"+flag);
	if (flag) {
		session.setAttribute("user", userName);
		String rurl = request.getParameter("requestUrl");
		if(rurl != null && !url.equals("null")){
			response.sendRedirect(rurl+".jsp");
		}
		response.sendRedirect("courses.jsp");
	}else{
		response.sendRedirect("error.jsp");
	}
%>