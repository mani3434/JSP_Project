<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*" errorPage="error.jsp"%>

<%! Connection conn; 

	private boolean createUser(String userName, String password){
		try{
			String sql = "insert into users values (?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			int result = ps.executeUpdate();
			if(result>0){
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
%>

<% 

	String userName = request.getParameter("userName");
	String password = request.getParameter("password");
	
	
	String driverClass = application.getInitParameter("dbDriver");
	String url = application.getInitParameter("dbUrl");
	String dbUser = application.getInitParameter("dbUser");
	String dbPwd = application.getInitParameter("dbPwd");

	
	try{
		Class.forName(driverClass);
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	conn = DriverManager.getConnection(url, dbUser, dbPwd);
	application.setAttribute("connection", conn);
	
	boolean authFlag = createUser(userName, password);
	
	if(authFlag){
		response.sendRedirect("login.jsp");
	}
	else{
		response.sendRedirect("error.jsp");
	}
	
	
	
%>

