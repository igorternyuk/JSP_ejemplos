<%-- 
    Document   : display
    Created on : Apr 24, 2017, 11:18:02 AM
    Author     : igor
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selecting specific data from a DB</title>
    </head>
    <body>
        <h1>Selecting specific data from a DB</h1>
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
                    "SELECT a.first_name, a.last_name, c.title, c.film_year" +
                    " FROM actor a, actor_film b, films c" +
                    " WHERE a.first_name = ? AND a.last_name = ? " + 
                    "AND a.id_actor = b.id_actor AND b.id_film = c.id_film;" 
                    );
                  } catch(SQLException e) {
                    e.printStackTrace();

                  }
                }
               ResultSet getActors(String firstName, String lastName){
                    try{
                        selectActors.setString(1, firstName);
                        selectActors.setString(2, lastName);
                        resultSet = selectActors.executeQuery();
                    } catch(SQLException e){
                        e.printStackTrace();
                    }
                    return resultSet;
               }
              public PreparedStatement getQuery(){
                    return selectActors;
              }
            }
        %>
        <%
            String firstName = new String();
            String lastName = new String();
            if(request.getParameter("first") != null && 
               request.getParameter("last") != null){
               firstName = request.getParameter("first");
               lastName = request.getParameter("last");
            }
            Actor actor = new Actor();
            ResultSet actors = actor.getActors(firstName, lastName);
        %>
        
        <table border="1">
            <tbody>
                <tr>
                    <td>First name:</td>
                    <td>Last name:</td>
                    <td>Film title:</td>
                    <td>Year:</td>
                </tr>
                <% while(actors != null && actors.next()){ %>
                <tr>
                    <td><%= actors.getString("first_name") %></td>
                    <td><%= actors.getString("last_name") %></td>
                    <td><%= actors.getString("title") %></td>
                    <td><%= actors.getString("film_year") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
            <a href="index.jsp">Go back</a>
    </body>
</html>
