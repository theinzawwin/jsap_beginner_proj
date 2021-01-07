<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="<c:url value='/index.jsp' />" class="btn btn-primary">New Employee</a>
<a href="<c:url value='/studentList.jsp' />" class="btn btn-primary">Student List</a>
<a href="<c:url value='/class_list.jsp' />" class="btn btn-primary">Class List</a>
</body>
</html>