<%-- 
    Document   : index
    Created on : Apr 24, 2017, 9:45:47 AM
    Author     : igor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selecting data from a DB</title>
    </head>
    <body>
        <h1>Selecting data from a DB</h1>
        <%!
            public class Actor{
                String URL = "jdbc:mysql://localhost:3306/susan_db";
                String USERNAME = "igor";
                String PASSWORD = "1319";
                Connection connection = null;
                PreparedStatement selectActors = null;
                ResultSet resultSet = null;
                public Actor(){
                  try{
                    connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                    selectActors = connection.prepareStatement(
                    "SELECT id_actor, first_name, last_name FROM actor;");
                  } catch(SQLException e) {
                    e.printStackTrace();
                  }
               }
               ResultSet getActors(){
                    try{
                        resultSet = selectActors.executeQuery();
                    } catch(SQLException e){
                        e.printStackTrace();
                    }
                    return resultSet;
               }
            };
        %>
        <%
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>ID_Actor</td>
                    <td>First name</td>
                    <td>Last name</td>
                </tr>
                <% while(actors.next()){ %>
                <tr>
                    <td><%=actors.getInt("id_actor") %> </td>
                    <td><%=actors.getString("first_name") %></td>
                    <td><%=actors.getString("last_name") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

    </body>
</html>
