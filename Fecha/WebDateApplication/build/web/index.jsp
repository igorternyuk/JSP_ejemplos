<%-- 
    Document   : index
    Created on : Apr 22, 2017, 3:43:41 PM
    Author     : igor
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using form</title>
    </head>
    <%
            Date date = new Date();
    %>
    <body>
        <h1>Using Form</h1>
        <p>Today is <%= date %></p>
        <form name="MyForm" action="display.jsp" method="POST">
                        <table border="0">
            <thead>Information</thead>
            <tbody>
                <tr>
                    <td>First name: </td>
                    <td><input type="text" name="name" value="" size="50" required="required"/></td>
                </tr>
                <tr>
                    <td>Last name: </td>
                    <td><input type="text" name="last" value="" size="50" required="required"/></td>
                </tr>
                <tr>
                    <td>Email address :</td>
                    <td><input type="email" name="mail" value="" size="50" required="required"/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><select name="gender" style="font-size: 16px">
                            <option>male</option>
                            <option>female</option>
                        </select></td>
                </tr>
                <tr>
                    <td>Date of birth</td>
                    <td><input type="text" name="dob" value="DD/MM/YYYY" size="15" style="font-size: 16px" required="required"/></td>
                </tr>
            </tbody>
            </table> 
            <input type="reset" value="Clear" name="clear" style="font-size: 16px" />
            <input type="submit" value="Submit" name="submit" style="font-size: 16px" />
        </form>

    </body>
</html>
