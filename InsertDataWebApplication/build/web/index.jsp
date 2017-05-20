<%--
    Document   : index
    Created on : Apr 24, 2017, 5:07:05 PM
    Author     : igor
--%>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert data to a DB</title>
    </head>
    <body onload="displayRes()">
        <h1>Insert data to a DB</h1>
        <%!
             public class Actor{
                String URL = "jdbc:mysql://localhost:3306/susan_db";
                String USERNAME = "igor";
                String PASSWORD = "1319";
                Connection connection = null;
                PreparedStatement insertActor = null;
                PreparedStatement printAllActors = null;
                ResultSet resultSet = null;
                public Actor(){
                  try{
                    connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                    insertActor = connection.prepareStatement(
                    "INSERT INTO actor (first_name, last_name, last_update)" +
                    " VALUES(?, ?, ?);"
                    );
                    printAllActors = connection.prepareStatement(
                    "SELECT * FROM actor");
                  } catch(SQLException e) {
                    e.printStackTrace();
                  }
                }
               ResultSet getAllActors(){
                    try{
                        resultSet = printAllActors.executeQuery();
                    } catch(SQLException e){
                        e.printStackTrace();
                    }
                    return resultSet;
               }
               int setActor(String firstName, String lastName, Timestamp timeStamp){
                    int result = 0;
                    try{
                        insertActor.setString(1, firstName);
                        insertActor.setString(2, lastName);
                        insertActor.setTimestamp(3, timeStamp);
                        result = insertActor.executeUpdate();

                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                    return result;
               }
            }
        %>
        <%
            int result = 0;

            if(request.getParameter("submit") != null){
                String firstName = new String();
                String lastName = new String();
                if(request.getParameter("first") != null){
                    firstName = request.getParameter("first");
                }
                if(request.getParameter("last") != null){
                    lastName = request.getParameter("last");
                }
                Date date = new Date();
                Timestamp timeStamp = new Timestamp(date.getTime());
                Actor actor = new Actor();
                result = actor.setActor(firstName, lastName, timeStamp);
            }
        %>
        <form action="index.jsp" method="POST" name="myForm1">
            <table border="0">
                <tbody>
                    <tr>
                        <td>First name:</td>
                        <td><input type ="text" name ="first" value = "" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Last name:</td>
                        <td><input type="text" name="last" value="" size="50"/></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" name="clear" value="Clear"/>
            <input type="submit" name="submit" value="Submit"/><br/>
            <input type="hidden" name ="hidden" value="<%= result %>"/>
        </form>
        <SCRIPT lang="JavaScript">
            function displayRes()
            {
                if(document.myForm1.hidden.value == 1){
                    alert("The data has been successfully inserted");
                }
            }
        </SCRIPT>
    </body>
</html>
