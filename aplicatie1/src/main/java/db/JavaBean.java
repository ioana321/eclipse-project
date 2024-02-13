package db;

import java.sql.*;

public class JavaBean {

    String error;
    Connection con;

    public JavaBean() {
    }

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/facultate?useSSL=false", "root", "placeholder");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    }

    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "placeholder");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    }

    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "placeholder");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    }

    public void disconnect() throws SQLException {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException sqle) {
            error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
            throw new SQLException(error);
        }
    }

    public void adaugaStudent(String Nume, String Prenume, String Grupa, String Medie, String Adresa, String CNP, String Bursa)
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into student(Nume, Prenume, Grupa, Medie, Adresa, CNP, Bursa) values('" + Nume + "'  , '" + Prenume + "', '" + Grupa + "', '" + Medie + "', '" + Adresa + "', '" + CNP + "', '" + Bursa + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaStudent()
    

    public void adaugaProfesor(String Nume, String Prenume, String CNP, String Adresa, String Salariu, String Grad, String Vechime)
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into profesor(Nume, Prenume, CNP, Adresa, Salariu, Grad, Vechime) values('" + Nume + "'  , '" + Prenume + "', '" + CNP + "', '" + Adresa + "', '" + Salariu + "', '" + Grad + "', '" + Vechime + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaProfesor()

        public void adaugaMaterie(int idstud, int idprof, String Denumire, String PctCredit, String OreSapt)
            throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into materie(idstud, idprof, Denumire, PctCredit, OreSapt) values('" + idstud + "'  , '" + idprof + "', '" + Denumire + "', '" + PctCredit + "', '" + OreSapt + "');");
                
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adaugaMaterie()

    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select * from `facultate`.`" + tabel + "`;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

    public ResultSet vedeMaterie() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select s.Nume NumeStudent, s.Prenume PrenumeStudent, s.Grupa, p.Nume NumeProfesor, p.Prenume PrenumeProfesor, p.Grad, m.idmaterie, m.idprof idprofesor, m.idstud idstudent, m.Denumire, m.PctCredit, m.OreSapt from student s, profesor p, materie m where s.idstudent = m.idstud and p.idprofesor = m.idprof;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                long aux;
                PreparedStatement delete;
                delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                for (int i = 0; i < primaryKeys.length; i++) {
                    aux = java.lang.Long.parseLong(primaryKeys[i]);
                    delete.setLong(1, aux);
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch (Exception e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeDateTabela()

    public void stergeTabela(String tabela) throws SQLException, Exception {
        if (con != null) {
            try {
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("delete from " + tabela + ";");
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeTabela()

    public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
        String update = "update " + tabela + " set ";
        String temp = "";
        if (con != null) {
            try {
                for (int i = 0; i < campuri.length; i++) {
                    if (i != (campuri.length - 1)) {
                        temp = temp + campuri[i] + "='" + valori[i] + "', ";
                    } else {
                        temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
                    }
                }
                update = update + temp;
// creaza un "prepared SQL statement"
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate(update);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of modificaTabela()
    
   

    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT * FROM " + tabela + " where idstudent=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinie()

    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()

    public ResultSet intoarceMaterieId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Executa interogarea
            String queryString = ("SELECT s.Nume NumeStudent, s.Prenume PrenumeStudent, s.Grupa, p.Nume NumeProfesor, p.Prenume PrenumeProfesor, p.Grad, m.idmaterie, m.idprof idprofesor, m.idstud idstudent, m.Denumire, m.PctCredit, m.OreSapt FROM student s, profesor p, materie m WHERE s.idstudent = m.idstud AND p.idprofesor = m.idprof AND idmaterie = '" + ID + "';");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }
}
