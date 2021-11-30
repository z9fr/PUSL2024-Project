<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/30/21
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div align="center">
    <h1>fuck you</h1>

        <table>



            <tr>
                <td>Cheers! Payment Successful! ${payer.firstName}:</td>

            </tr>
            <tr>
                <td>Name :</td>
                <td>${payer.firstName} ${payer.lastName} </td>
            </tr>

            <tr>
                <td>Desc :</td>
                <td>${transaction.description} </td>
            </tr>
            <tr><td><br/></td></tr>

        </table>

</div>

</body>
</html>
