<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
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
<title>Adauga student</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<%
String Nume = request.getParameter("Nume");
String Prenume = request.getParameter("Prenume");
String Grupa = request.getParameter("Grupa");
String Medie = request.getParameter("Medie");
String Adresa = request.getParameter("Adresa");
String CNP = request.getParameter("CNP");
String Bursa = request.getParameter("Bursa");
if (Nume != null) {
jb.connect();
jb.adaugaStudent(Nume, Prenume, Grupa, Medie, Adresa, CNP, Bursa);
jb.disconnect();
%>
<br>
	<div class="container text-center">
	<h6 class="display-6">Datele au fost adaugate.</h6>
	</div><%
} else {
%>
<br><br>
	<div class="container text-center">
			<br> 
			
			<div class="container">
 
  				<div class="content">
  				
    				<h6 class="display-6">Adauga student</h6>
    				
  				</div>
			</div>
	</div>
	<br> <br> <br> <br> <br> <br>
	<div class="container text-center col-4">
		<form action="nou_Student.jsp" method="post">
			
			<table align="center" class="table table-secondary table-striped">
			<tr>
				<td align="right">Nume Student:</td>
				<td> <input type="text" name="Nume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Prenume Student:</td>
				<td> <input type="text" name="Prenume" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Grupa:</td>
				<td> <input type="text" name="Grupa" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Medie:</td>
				<td> <input type="text" name="Medie" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td> <input type="text" name="Adresa" size="40" /></td>
			</tr>
			<tr>
				<td align="right">CNP:</td>
				<td> <input type="text" name="CNP" size="40" /></td>
			</tr>
			<tr>
				<td align="right">Bursa:</td>
				<td> <input type="text" name="Bursa" size="40" /></td>
			</tr>
			</table>
				<input class="btn btn-light" type="submit" value="Adauga studentul" />
		</form>
		</div>
<%
}
%>
	<br />
	<div class="container text-center">
	<a href="tabela_Studenti.jsp"><button type="button" class="btn btn-light">Inapoi la tabela Studenti</button></a>
	</div>
	<br>
	<div class="container text-center">
		<a href="index.html"><button type="button" class="btn btn-secondary">Home</button></a>
	</div>
	<br />
</body>
</html>