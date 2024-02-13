<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tabela Materie</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Tabela Materie:</h1>
	<br />
	<p align="center">
		<a href="nou_Materie.jsp"><b>Adauga o noua materie.</b></a> <a
			href="index.html"><b>Home</b></a>
	</p>
	<form action="m1_Materie.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Mark:</b></td>
				<td><b>IdMaterie:</b></td>
				<td><b>Id Student:</b></td>
				<td><b>Nume Student:</b></td>
				<td><b>Prenume Student:</b></td>
				<td><b>Grupa:</b></td>
				<td><b>Id Profeosr:</b></td>
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
				<td><%=rs.getInt("idprofesor")%></td>
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
		<p align="center">
			<input type="submit" value="Modifica linia">
		</p>
	</form>
	<%
jb.disconnect();%>
	<br />
	<p align="center">
		<a href="index.html"><b>Home</b></a> <br />
	</p>
</body>
</html>