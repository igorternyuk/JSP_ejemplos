<%--
    Document   : index
    Created on : Apr 30, 2017, 1:37:27 PM
    Author     : igor
--%>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete data from a DB</title>
    </head>
    <body onload="displayRes()">
        <h1>Delete data from a DB</h1>
            <%!
             public class Actor{
                String URL = "jdbc:mysql://localhost:3306/susan_db";
                String USERNAME = "igor";
                String PASSWORD = "1319";
                Connection connection = null;
                PreparedStatement selectActor = null;
                PreparedStatement printAllActors = null;
                PreparedStatement deleteActor = null;
                ResultSet resultSet = null;
                public Actor(){
                  try{
                    connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                    selectActor = connection.prepareStatement(
                    "SELECT id_actor, first_name, last_name FROM actor;"
                    );
                    printAllActors = connection.prepareStatement(
                    "SELECT * FROM actor");
                    deleteActor = connection.prepareStatement(
                    "DELETE FROM actor WHERE id_actor = ?"
                    );
                  } catch(SQLException e) {
                    e.printStackTrace();
                  }
                }
               ResultSet getActors(){
                    try{
                        resultSet = selectActor.executeQuery();
                    } catch(SQLException e){
                        e.printStackTrace();
                    }
                    return resultSet;
               }
               int deleteActor(Integer id){
                    int result = 0;
                    try{
                        deleteActor.setInt(1, id);
                        result = deleteActor.executeUpdate();
                    } catch(SQLException e){
                        e.printStackTrace();
                    }
                    return result;
               }
            }
        %>
        <%
            int result = 0;
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();
            Integer actorID = new Integer(0);
            if(request.getParameter("submit") != null){
                actorID = Integer.parseInt(request.getParameter("actor"));
                result = actor.deleteActor(actorID);
            }
        %>
        <form name="MyForm" action="index.jsp">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Actor id: </td>
                        <td><select name="actor">
                                <% while(actors.next()) {%>
                                <option value="<%= actors.getInt("id_actor") %>"> <%= actors.getString("first_name")%> <%= actors.getString("last_name")%> </option>
                                <% } %>
                            </select></td>
                    </tr>
                </tbody>
            </table>
            <input type="hidden" name ="hidden" value="<%= result %>"/>
            <input type="submit" value="Submit" name="submit" />
        </form>
        <SCRIPT lang="JavaScript">
            function displayRes()
            {
                if(document.MyForm.hidden.value == 1){
                    alert("The data has been successfully deleted");
                }
            }
        </SCRIPT>
    </body>
</html>
