<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	body {
  		background-image: url('background.jpg');
  		background-repeat: no-repeat;
 		background-attachment: fixed;
        background-size: cover;
		}
	.container {
  		position: relative;
  		max-width: 800px; /* Maximum width */
  		margin: 0 auto; /* Center it */
		}

	.container .content {
  		position: absolute; /* Position the background text */
  		top: 0; /* At the bottom. Use top:0 to append it to the top */
  		background: rgb(0, 0, 0); /* Fallback color */
 		background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  		color: #f1f1f1; /* Grey text */
  		width: 100%; /* Full width */
  		padding: 20px; /* Some padding */
		}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Materie</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<br><br>
	<div class="container text-center">
			<br> 
			
			<div class="container">
 
  				<div class="content">
  				
    				<h6 class="display-6">Materii</h6>
    				
  				</div>
			</div>
	</div>
	<br> <br> <br> <br> <br> <br>
	<div class="container text-center">
	<form id="materieForm" action="" method="post">
		<table border="1" align="center" class="table table-secondary table-striped">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdMaterie:</b></td>
				<td><b>IdStudent:</b></td>
				<td><b>Nume Student:</b></td>
				<td><b>Prenume Student:</b></td>
				<td><b>Grupa:</b></td>
				<td><b>IdProfesor:</b></td>
				<td><b>Nume Profesor:</b></td>
				<td><b>Prenume Profesor:</b></td>
				<td><b>Grad:</b></td>
				<td><b>Denumire:</b></td>
				<td><b>Puncte de credit:</b></td>
				<td><b>Ore pe sapt:</b></td>
			</tr>
			<%
			jb.connect();
			ResultSet rs = jb.vedeMaterie();
			long x;
			while (rs.next()) {
				x = rs.getInt("idmaterie");
			%>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%=x%>" /></td>
				<td><%=x%></td>
				<td><%=rs.getInt("idstudent")%></td>
				<td><%=rs.getString("NumeStudent")%></td>
				<td><%=rs.getString("PrenumeStudent")%></td>
				<td><%=rs.getString("Grupa")%></td>
				<td><%=rs.getInt("idprofesor")%></td>
				<td><%=rs.getString("NumeProfesor")%></td>
				<td><%=rs.getString("PrenumeProfesor")%></td>
				<td><%=rs.getString("Grad")%></td>
				<td><%=rs.getString("Denumire")%></td>
				<td><%=rs.getString("PctCredit")%></td>
				<td><%=rs.getString("OreSapt")%></td>
				<%
				}
				%>
			</tr>
		</table>
		<br />
		<div class="container text-center">
		<div class="btn-group" role="group" aria-label="Butoane">
 			<button type="button" class="btn btn-light" onclick="nou()">Adauga</button>
  			<button type="button" class="btn btn-light" onclick="modificare()">Modifica</button>
  			<button type="button" class="btn btn-light" onclick="stergere()">Sterge</button>
		</div>
		</div>
	</form>
	</div>
	<script>
	
		form=document.getElementById("materieForm");
		function stergere() {
			form.action="sterge_Materie.jsp";
			form.submit();
		}
		function modificare() {
			form.action="m1_Materie.jsp";
			form.submit();
		}
		function nou() {
			form.action="nou_Materie.jsp";
			form.submit();
		}
	
	</script>
	<%
rs.close();
jb.disconnect();
%>
	<br />
	<div class="container text-center">
		<a href="index.html"><button type="button" class="btn btn-secondary">Home</button></a>
	</div>
</body>
</html>