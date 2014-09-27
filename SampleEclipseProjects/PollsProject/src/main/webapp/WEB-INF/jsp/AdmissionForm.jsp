<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<h1> student admission page</h1>
	<form action="/PollsProject/submitAdmissionForm.html" method="post">
		<p>
			Student name: <input type="text" name="studentName" />
		</p>
		<p>
			Student's hobby <input type="text" name="studentHobby" />
		</p>
		<input type="submit" value="submit this form" />	
	</form>
</body>
</html>