<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
	if(session.getAttribute("username")== null)
	{
		response.sendRedirect("../index.jsp");
	}
%>
<%if(session.getAttribute("type")!= null && session.getAttribute("type").equals("Employee") )
{response.sendRedirect("../Employee/employeeDash.jsp");}

else if(session.getAttribute("type")!= null && session.getAttribute("type").equals("Manager") )
{response.sendRedirect("../Manager/managerDash.jsp");}
%>
</head>
<body>

<div align = "left">
	<a href="adminDash.jsp">Home</a>
</div>

<div align = "right">
	<form action="<%=request.getContextPath() %>/Logout">
		<input type="submit" value="Logout" />
		</form>
	</div>
	
	<form action="<%=request.getContextPath()%>/AdminController" method="get">
	<center>
            <table border="5" width="25%" cellpadding="8">
                <thead>
                    <tr>
                        <th colspan="6">List of Active Employees</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Employee ID</th>
               	 		<th>First Name</th>
                		<th>Last Name</th>
                		<th>User Name</th>
                		<th>Status</th>
                		<th>Manager</th>
                		<th>Hierarchy</th>
            		</tr>
            		<c:forEach var="i" items="${sessionScope.activelist}">
                    <tr>
                    	
                        	<td><c:out value="${i.emp_id}" /></td>
                       		<td><c:out value="${i.first_name}" /></td>
                        	<td><c:out value="${i.last_name}" /></td>
                        	<td><c:out value="${i.username}" /></td>
                        	<td><c:out value="${i.status}" /></td>
                        	<td><c:out value="${i.manager}" /></td>
                        	<td><c:out value="${i.managerlist}"/></td>
                   	</tr>
                   	</c:forEach>
                 
                   </tbody>
            </table>
		</center>
	</form>
</body>
</html>