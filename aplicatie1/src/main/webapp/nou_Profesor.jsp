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
<title>Adauga Profesor</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	String Nume = request.getParameter("Nume");
	String Prenume = request.getParameter("Prenume");
	String CNP = request.getParameter("CNP");
	String Adresa = request.getParameter("Adresa");
	String Salariu = request.getParameter("Salariu");
	String Grad = request.getParameter("Grad");
	String Vechime = request.getParameter("Vechime");
	if (Nume != null) {
		jb.connect();
		jb.adaugaProfesor(Nume, Prenume, CNP, Adresa, Salariu, Grad, Vechime);
		jb.disconnect();
	%>
	<br>
	<div class="container text-center">
	<h6 class="display-6">Datele au fost adaugate.</h6>
	</div>
	<%
	} else {
	%>
	<br><br>
	<div class="container text-center">
			<br> 
			
			<div class="container">
 
  				<div class="content">
  				
    				<h6 class="display-6">Adauga profesor</h6>
    				
  				</div>
			</div>
	</div>
		<br> <br> <br> <br> <br> <br>
	<div class="container text-center col-4">
	<form action="nou_Profesor.jsp" method="post">
		<table align="center" class="table table-secondary table-striped">
			<tr>
				<td align="right">Nume Profesor:</td>
				<td> <input type="text" name="Nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume Profesor:</td>
				<td> <input type="text" name="Prenume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">CNP:</td>
				<td> <input type="text" name="CNP" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td> <input type="text" name="Adresa" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Salariu:</td>
				<td> <input type="text" name="Salariu" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Grad:</td>
				<td> <input type="text" name="Grad" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Vechime:</td>
				<td> <input type="text" name="Vechime" size="40" /></td>
			</tr>
			</table>
				<input type="submit" class="btn btn-light" value="Adauga profesorul" />
		</form>
		</div>
	<%
	}
	%>
	<br />
	<div class="container text-center">
	<a href="tabela_Profesori.jsp"><button type="button" class="btn btn-light">Inapoi la tabela Profesori</button></a>
	</div>
	<br>
	<div class="container text-center">
		<a href="index.html"><button type="button" class="btn btn-secondary">Home</button></a>
	</div>
	<br />
</body>
</html>