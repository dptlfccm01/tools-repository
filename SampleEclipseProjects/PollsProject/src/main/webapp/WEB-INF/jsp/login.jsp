<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PollsProject - Login</title>
</head>
<body>

<form:form name="login-form" commandName="loginCommandName">
<legend>
	Username: <form:input path="username" />
	<form:errors path="username" cssClass="error"/>
	<br />
	Password: <input type="password" name="password" id="password" /><br />
	<br />
	<input type="submit" name="login" value="Log in" />
</legend>

</form:form>

</body>
</html>