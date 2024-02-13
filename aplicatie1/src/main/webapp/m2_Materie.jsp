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
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
<div class="container text-center">
<br>
	<h6 class="display-6">Tabela Materie:</h6>
	<br />
</div>
	<%
	jb.connect();
	int aux = java.lang.Integer.parseInt(request.getParameter("idmaterie"));
	String idstudent = request.getParameter("idstudent");
	String idprofesor = request.getParameter("idprofesor");
	String Denumire = request.getParameter("Denumire");
	String PctCredit = request.getParameter("PctCredit");
	String OreSapt = request.getParameter("OreSapt");
	String[] valori = { idstudent, idprofesor, Denumire, PctCredit, OreSapt };
	String[] campuri = { "idstud", "idprof", "Denumire", "PctCredit", "OreSapt" };
	jb.modificaTabela("materie", "idmaterie", aux, campuri, valori);
	jb.disconnect();
	%>
	<div class="container text-center">
	<h5 class="display-5">Modificarile au fost efectuate !</h5>
	<br>
	
	<div class="container text-center">
	<a href="tabela_Materii.jsp"><button type="button" class="btn btn-light">Inapoi la tabela Materii</button></a>
	</div>
	
	<br>
	
	<a href="index.html"><button type="button" class="btn btn-secondary">Home</button></a>
	
		</div>
</body>
</html>