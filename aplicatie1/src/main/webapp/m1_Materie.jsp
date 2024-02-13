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
	<br><br>
	<div class="container text-center">
			<br> 
			
			<div class="container">
 
  				<div class="content">
  				
    				<h6 class="display-6">Modifica materia</h6>
    				
  				</div>
			</div>
	</div>
	<br> <br> <br> <br> <br>
	<p align="center">
		<a href="nou_Materie.jsp"><button type="button" class="btn btn-secondary">Adauga o noua materie</button></a>
	</p>
	<%
	jb.connect();
	String NumeStudent, PrenumeStudent, Grupa, NumeProfesor, PrenumeProfesor, Grad, Denumire, PctCredit, OreSapt;
	int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
	ResultSet rs = jb.intoarceMaterieId(aux);
	rs.first();
	int id1 = rs.getInt("idstudent");
	int id2 = rs.getInt("idprofesor");
	NumeStudent = rs.getString("NumeStudent");
	PrenumeStudent = rs.getString("PrenumeStudent");
	Grupa = rs.getString("Grupa");
	NumeProfesor = rs.getString("NumeProfesor");
	PrenumeProfesor = rs.getString("PrenumeProfesor");
	Grad = rs.getString("Grad");
	Denumire = rs.getString("Denumire");
	PctCredit = rs.getString("PctCredit");
	OreSapt = rs.getString("OreSapt");
	ResultSet rs1 = jb.vedeTabela("student");
	ResultSet rs2 = jb.vedeTabela("profesor");
	int idstudent, idprofesor;
	%>
	<div class="container text-center col-4">
	<form action="m2_Materie.jsp" method="post">
		<table align="center" class="table table-secondary table-striped">
			<tr>
				<td align="right">IdMaterie:</td>
				<td><input type="text" name="idmaterie" size="30"
					value="<%=aux%>" readonly /></td>
			</tr>
			<tr>
				<td align="right">idstudent:</td>
				<td><SELECT NAME="idstudent">
						<%
						while (rs1.next()) {
							idstudent = rs1.getInt("idstudent");
							NumeStudent = rs1.getString("Nume");
							PrenumeStudent = rs1.getString("Prenume");
							Grupa = rs1.getString("Grupa");
							if (idstudent != id1) {
						%>
						<OPTION VALUE="<%=idstudent%>"><%=idstudent%>,
							<%=NumeStudent%>,
							<%=PrenumeStudent%>,
							<%=Grupa%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idstudent%>"><%=idstudent%>,
							<%=NumeStudent%>,
							<%=PrenumeStudent%>,
							<%=Grupa%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">idprofeosr:</td>
				<td><SELECT NAME="idprofesor">
						<%
						while (rs2.next()) {
							idprofesor = rs2.getInt("idprofesor");
							NumeProfesor = rs2.getString("Nume");
							PrenumeProfesor = rs2.getString("Prenume");
							Grad = rs2.getString("Grad");
							if (idprofesor != id2) {
						%>
						<OPTION VALUE="<%=idprofesor%>"><%=idprofesor%>,
							<%=NumeProfesor%>,
							<%=PrenumeProfesor%>,
							<%=Grad%></OPTION>
						<%
						} else {
						%>
						<OPTION selected="yes" VALUE="<%=idprofesor%>"><%=idprofesor%>,
							<%=NumeProfesor%>,
							<%=PrenumeProfesor%>,
							<%=Grad%></OPTION>
						<%
						}
						}
						%>
				</SELECT></td>
			</tr>
			<tr>
				<td align="right">Denumire:</td>
				<td><input type="text" name="Denumire" size="30"
					value="<%=Denumire%>" /></td>
			</tr>
			<tr>
				<td align="right">Puncte de credit:</td>
				<td><input type="text" name="PctCredit" size="30"
					value="<%=PctCredit%>" /></td>
			</tr>
			<tr>
				<td align="right">Ore pe sapt:</td>
				<td><input type="text" name="OreSapt" size="30"
					value="<%= OreSapt%>" /></td>
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
<%
rs.close();
rs1.close();
rs2.close();
jb.disconnect();
%>
</html>