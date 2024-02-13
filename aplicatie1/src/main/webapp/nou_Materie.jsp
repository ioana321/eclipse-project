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
<title>Adauga materie</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
	int idstudent, idprofesor;
	String id1, id2, NumeStudent, PrenumeStudent, Grupa, NumeProfesor, PrenumeProfesor, Grad, Denumire, PctCredit, OreSapt;
	id1 = request.getParameter("idstudent");
	id2 = request.getParameter("idprofesor");
	Denumire = request.getParameter("Denumire");
	PctCredit = request.getParameter("PctCredit");
	OreSapt = request.getParameter("OreSapt");
	if (id1 != null) {
		jb.connect();
		jb.adaugaMaterie(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Denumire, PctCredit,
		OreSapt);
		jb.disconnect();
	%>
	<div class="container text-center">
	<h6 class="display-6">Datele au fost adaugate.</h6>
	</div>
	<%
	} else {
	jb.connect();
	ResultSet rs1 = jb.vedeTabela("student");
	ResultSet rs2 = jb.vedeTabela("profesor");
	%>
<br><br>
	<div class="container text-center">
			<br> 
			
			<div class="container">
 
  				<div class="content">
  				
    				<h6 class="display-6">Adauga materie</h6>
    				
  				</div>
			</div>
	</div>
		<br> <br> <br> <br> <br> <br>
		<div class="container text-center col-4">
	<form action="nou_Materie.jsp" method="post">
		<table align="center" class="table table-secondary table-striped">
			<tr>
				<td align="right">Student:</td>
				<td><SELECT NAME="idstudent">
						<%
						while (rs1.next()) {
							idstudent = rs1.getInt("idstudent");
							NumeStudent = rs1.getString("Nume");
							PrenumeStudent = rs1.getString("Prenume");
							Grupa = rs1.getString("Grupa");
						%>
						<OPTION VALUE="<%=idstudent%>"><%=idstudent%>,<%=NumeStudent%>,<%=PrenumeStudent%>,<%=Grupa%></OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td align="right">Profesor:</td>
				<td><SELECT NAME="idprofesor">
						<%
						while (rs2.next()) {
							idprofesor = rs2.getInt("idprofesor");
							NumeProfesor = rs2.getString("Nume");
							PrenumeProfesor = rs2.getString("Prenume");
							Grad = rs2.getString("Grad");
						%>
						<OPTION VALUE="<%=idprofesor%>"><%=idprofesor%>,<%=NumeProfesor%>,<%=PrenumeProfesor%>,<%=Grad%></OPTION>
						<%
						}
						%>
				</SELECT>
				</td>
			</tr>
			<tr>
				<td align="right">Denumire:</td>
				<td><input type="text" name="Denumire" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Puncte de credit:</td>
				<td><input type="text" name="PctCredit" size="30" /></td>
			</tr>
			<tr>
				<td align="right">Ore pe sapt:</td>
				<td><input type="text" name="OreSapt" size="30" /></td>
			</tr>
		</table>
		<input type="submit" class="btn btn-light" value="Adauga materia" />
	</form>
	</div>
	<%
}
%>
	<br />
	<div class="container text-center">
	<a href="tabela_Materii.jsp"><button type="button" class="btn btn-light">Inapoi la tabela Materii</button></a>
	</div>
	<br>
	<div class="container text-center">
		<a href="index.html"><button type="button" class="btn btn-secondary">Home</button></a>
	</div>
	<br />
</body>
</html>