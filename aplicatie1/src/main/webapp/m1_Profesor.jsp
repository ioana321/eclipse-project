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
<title>Tabela Profesori</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<br><br>
	<div class="container text-center">
			<br> 
			
			<div class="container">
 
  				<div class="content">
  				
    				<h6 class="display-6">Modifica profesor</h6>
    				
  				</div>
			</div>
	</div>
	<br> <br> <br> <br> <br>
	<p align="center">
		<a href="nou_Profesor.jsp"><button type="button" class="btn btn-secondary">Adauga un nou profesor</button></a>
	</p>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceLinieDupaId("profesor", "idprofesor", aux);
	rs.first();
	String Nume = rs.getString("Nume");
	String Prenume = rs.getString("Prenume");
	String CNP = rs.getString("CNP");
	String Adresa = rs.getString("Adresa");
	String Salariu = rs.getString("Salariu");
	String Grad = rs.getString("Grad");
	String Vechime = rs.getString("Vechime");
	rs.close();
	jb.disconnect();
	%>
	<div class="container text-center col-4">
	<form action="m2_Profesor.jsp" method="post">
		<table align="center" class="table table-secondary table-striped">
			<tr>
				<td align="right">IdProfesor:</td>
				<td><input type="text" name="idprofesor" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">Nume:</td>
				<td><input type="text" name="Nume" size="30" value="<%=Nume%>" /></td>
			</tr>
			<tr>
				<td align="right">Prenume:</td>
				<td><input type="text" name="Prenume" size="30"
					value="<%=Prenume%>" /></td>
			</tr>
			<tr>
				<td align="right">CNP:</td>
				<td><input type="text" name="CNP" size="30"
					value="<%=CNP%>" /></td>
			</tr>
			<tr>
				<td align="right">Adresa:</td>
				<td><input type="text" name="Adresa" size="30"
					value="<%=Adresa%>" /></td>
			</tr>
			<tr>
				<td align="right">Salariu:</td>
				<td><input type="text" name="Salariu" size="30"
					value="<%=Salariu%>" /></td>
			</tr>
			<tr>
				<td align="right">Grad:</td>
				<td><input type="text" name="Grad" size="30"
					value="<%=Grad%>" /></td>
			</tr>
			<tr>
				<td align="right">Vechime:</td>
				<td><input type="text" name="Vechime" size="30"
					value="<%=Vechime%>" /></td>
			</tr>
		</table>
		<br>
		<p align="center">
			<input type="submit" class="btn btn-info" value="Modifica linia">
		</p>
	</form>
	</div>
	<div class="container text-center">
		<a href="index.html"><button type="button" class="btn btn-secondary">Home</button></a>
	</div>
</body>
</html>