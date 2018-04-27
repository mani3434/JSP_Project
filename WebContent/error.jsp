<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error page - LearnToday</title>
</head>
<body>
	<div class="container">

		<header> <%@ include file="header.jsp"%>
		</header>

		
		<article>
			<div class="alert alert-danger">
			<% 
				String imageUrl = config.getInitParameter("imageUrl");
			String errorMessage = config.getInitParameter("errorMessage");
				out.println("<center><img src='" +imageUrl + "' alt='"+ errorMessage+"'/>");
			out.println("<h1>Oops!...<br>"+errorMessage+ "</h1></center>");
			%>
			</div>
		</article>
		
		<footer> <%@ include file="footer.jsp"%>
		</footer>




	</div>
</body>
</html>