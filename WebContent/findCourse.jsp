<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="com.fund.model.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result page</title>
</head>
<body>

	<jsp:scriptlet>
		String userName = (String) session.getAttribute("user");
	
		if(userName == null)
			response.sendRedirect("login.jsp?requestUrl=findCourse");
			else{
	</jsp:scriptlet>

	<jsp:useBean id="course" class="com.fund.model.Course" scope="request"/>

	<jsp:scriptlet>
	
		String courseName = null;
		String facultyName = null;
		String courseDuration = null;
		int courseFee = 0;
		
		courseName = request.getParameter("courseName");
		Connection conn = (Connection) application.getAttribute("connection");
		String sql = "select * from course where courseTitle = '"+courseName+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
	</jsp:scriptlet>
	
	<jsp:setProperty name="course" property="courseName"
		value="<%= courseName %>" />
	<jsp:setProperty name="course" property="facultyName"
		value="<%= rs.getString(3) %>" />
	<jsp:setProperty name="course" property="imageUrl"
		value="<%= rs.getString(4) %>" />
	<jsp:setProperty name="course" property="fees"
		value="<%= rs.getInt(5) %>" />
	<jsp:setProperty name="course" property="description"
		value="<%= rs.getString(6) %>" />

	<jsp:scriptlet>
		
		}
	</jsp:scriptlet>
	
	<jsp:forward page="viewCourse.jsp"></jsp:forward>
	
	<jsp:scriptlet>
		
		}
			
	</jsp:scriptlet>
	
</body>
</html>