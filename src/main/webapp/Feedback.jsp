<%@page import="com.hcl.college.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="com.hcl.college.CollegeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function sub(){
	
	if(document.getElementById("s").value != ""){
		var e = document.getElementById("i");
		var sub = e.options[e.selectedIndex].text;
		if(sub != "Select Instructor"){
			var e = document.getElementById("subjec");
			var sub = e.options[e.selectedIndex].text;
			if(sub != "Select subject"){
				document.feedbck.submit();
			}else{
				alert("Please Select Subject");
			}
		}else{
			alert("Please Select Instructor");
		}
		
	} else{
		alert("Please Enter Student Name");
	}
	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<% 
     List<String> ins = new CollegeDao().searchIns();
	 String fid = new CollegeDao().generateId();
%>

<form name="feedbck">
<table>
	<tr>
		<td>Feedback Id : </td>
		<td> <input type="text" name="fid" value=<%=fid %>  readonly="readonly"/></td>
	</tr>
	<tr>
		<td>Student Name : </td>
		<td> <input type="text" name="sname" id="s"/></td>
	</tr>
	<tr>
		<td>Instructor : </td>
		<td><select  name="instructor" id="i">
				<option value="none" selected disabled hidden>Select Instructor</option> 
				<%for(String i : ins){ %>
				<option><%=i %></option>	
				<%} %>
		</select> </td>
	</tr>
	<tr>
	
	<%  List<String> s = new CollegeDao().searchSub();
			
	%>
		<td>Select Subject : </td>
		<td><select id="subjec"  name="subject" >
				<option value="none" selected disabled hidden>Select subject</option> 
				<%for(String i : s){ %>
				<option><%=i %></option>	
				<%} %>
		</select> </td>
	</tr>
	<tr >
		<td>FeedBack : </td>
		<td> <input type="radio" name="fbk" value="Excellent" />Excellent<br>
		 	<input type="radio" name="fbk" value="Very Good" />Very Good<br>
		 	<input type="radio" name="fbk" value="Good" checked="checked"/>Good<br>
		 	<input type="radio" name="fbk" value="Average" />Average<br>
		 	<input type="radio" name="fbk" value="Poor" />Poor</td>
	</tr>
	<tr>
		<td colspan="2"> <input type="button" value="Submit" onclick="sub()"/></td>
	</tr>
</table>
</form><br><br><br>

<%
	if(request.getParameter("fbk") != null){
		Feedback ob = new Feedback();
		ob.setStudentName(request.getParameter("sname"));
		ob.setInstructor(request.getParameter("instructor"));
		ob.setSubject(request.getParameter("subject"));
		ob.setFbvalue(request.getParameter("fbk"));
		%><%= new CollegeDao().insertFeedback(ob) %><%
	}
%>
<script>
</script>
</center>
</body>
</html>