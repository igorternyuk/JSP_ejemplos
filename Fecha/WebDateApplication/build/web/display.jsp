<%-- 
    Document   : display
    Created on : Apr 22, 2017, 5:14:21 PM
    Author     : igor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using forms</title>
    </head>
    <body>
        <h1>Using forms</h1>
        <% 
            String firstName = request.getParameter("name");
            String lastName = request.getParameter("last");
            String email = request.getParameter("mail");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");        
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>First name:</td>
                    <td><%=firstName %></td>
                </tr>
                <tr>
                    <td>Last name:</td>
                    <td><%=lastName %></td>
                </tr>
                <tr>
                    <td>E-mail address:</td>
                    <td><%=email %></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%=gender %></td>
                </tr>
                <tr>
                    <td>Date of birth:</td>
                    <td><%=dob %></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
