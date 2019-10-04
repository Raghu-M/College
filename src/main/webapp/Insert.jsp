<%@page import="com.hcl.college.CollegeDao"%>
<%@page import="java.sql.Date"%>
<%@page import="com.hcl.college.Subjects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>

function TPhours() {
	var e = document.getElementById("subject");
	var sub = e.options[e.selectedIndex].text;
	if(sub == "Microprocessor"){
		document.getElementById("theory").value = "40";
		document.getElementById("practical").value = "15";
	} else if(sub == "Java"){
		document.getElementById("theory").value = "50";
		document.getElementById("practical").value = "40";
		
	} else if(sub == "Hibernate"){
		document.getElementById("theory").value = "20";
		document.getElementById("practical").value = "10";
		
	} else if(sub == "Python"){
		document.getElementById("theory").value = "30";
		document.getElementById("practical").value = "25";
		
	}
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<center>
<form>
<table>
<tr>
		<td>Subject</td>
		<td><center><select name="subject" id="subject" onchange="TPhours()" >
					<option >Microprocessor</option>
					<option >Java</option>
					<option>Hibernate</option>
					<option >Python</option>
				</select> </center>
	</td></tr>
	<tr>
		<td>Theory</td>
		<td><input type="text" name="theory" id="theory" readonly="readonly"/></td>
	</tr>
	<tr>
		<td>Practical</td>
		<td><input type="text" name="practical" id="practical" readonly="readonly"/></td>
	</tr>
	<tr>
		<td>Year</td>
		<td><input type="text" name="year" /></td>
	</tr>
	<tr>
		<td>Instructor</td>
		<td><input type="text" name="instructor" /></td>
	</tr>
	<tr>
		<td colspan="2"><center><input type="submit" value="Add"/></center></td>
	</tr>
		
</table>
</form>
</center>
<%
	if(request.getParameter("instructor") != null){
		Subjects ob = new Subjects();
		ob.setSubject(request.getParameter("subject"));
		ob.setPractical(Integer.parseInt(request.getParameter("practical")));
		ob.setTheory(Integer.parseInt(request.getParameter("theory")));
		ob.setInstructor(request.getParameter("instructor"));
		ob.setYear(Integer.parseInt(request.getParameter("year")));
		%><%= new CollegeDao().insertSubjects(ob) %><%
	}
%>

</body>
</html>