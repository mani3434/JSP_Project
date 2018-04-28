
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title><jsp:getProperty property="courseName" name="course" /></title>
</head>

<body>
	<div class="container">
		<header>
			<%@ include file="header.jsp"%>
		</header>

		<article>
			
			<jsp:scriptlet>String user = (String) session.getAttribute("user");
			String message = "Welcome " + user + " !";</jsp:scriptlet>

			<b><jsp:expression>message</jsp:expression></b>

			<jsp:useBean id="course" class="com.fund.model.Course"
				scope="request"></jsp:useBean>

			<div class="panel panel-primary">
				<p class="panel-heading">Course Details</p>
				<div class="panel-body">
					<div class="media">
						<div class="media-left">
							<a href="#"><img
								src="<jsp:getProperty name="course" property="imageUrl"/>"
								width="300" height="300"></a>
						</div>
						<div class="media-body">
							<h4 class="meida-heading">
								<jsp:getProperty property="courseName" name="course" />
							</h4>
							<p>
								<strong>Course Description:</strong>
								<jsp:getProperty property="description" name="course" />
							</p>
							<p>
								<storng>Trainer Name:</storng>
								<jsp:getProperty property="facultyName" name="course" />
							</p>
							<p>
								<storng>Course Description:</storng>
								<jsp:getProperty property="fees" name="course" />
							</p>
						</div>
					</div>
					<p class="text-center">
						<a href="Courses.jsp" class="btn btn-lg btn-success"> View All
							Courses</a>
					</p>
				</div>
			</div>
		
		</article>

		<footer>
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>


</html>