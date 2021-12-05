<%-- Created by IntelliJ IDEA. User: dasith Date: 11/30/21 Time: 8:34 PM To change this template use File | Settings |
    File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Thank You</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.css">
</head>

<body>

<div align="center" style="margin-top: 10%;">
    <p class="title">Cheers! Payment Successful! ${payer.firstName}</p>

    <div class="box" style="width: 50%;">
        <table>

            <tr>

            </tr>
            <tr>
                <td>First Name &nbsp;&nbsp;</td>
                <td>${payer.firstName} </td>
            </tr>

            <tr>
                <td>Last Name &nbsp;&nbsp;</td>
                <td>${payer.lastName} </td>
            </tr>

            <tr>
                <td> Description &nbsp;&nbsp;</td>
                <td>${transaction.description} </td>
            </tr>




        </table>
        <br><br>
        <a href="/home" class="button is-primary is-inverted"> Back to Home</a>

    </div>

</div>

</body>

</html>