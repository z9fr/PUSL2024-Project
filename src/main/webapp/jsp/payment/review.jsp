<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/30/21
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review</title>
    <style type="text/css">
        table { border: 0; }
        table td { padding: 5px; }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.css">
</head>
<body>
<div align="center" >
    <br><br>
    <h1 class="subtitle is-3">please confirm below information</h1>

    <div class="box" style="width: 40%; margin-top: 3%;">
        <form action="/user/complete_pay" method="POST">
            <table>
                <tr>
                    <td colspan="2"><b>Transaction Details:</b></td>
                    <td>
                        <input type="hidden" name="payid" value="${param.paymentid}" />
                        <input type="hidden" name="payerid" value="${param.payerid}" />
                    </td>
                </tr>


                <tr>
                    <td>payment id</td>
                    <td>${param.paymentid}</td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td>${transaction.description}</td>
                </tr>
                <tr>
                    <td>Subtotal:</td>
                    <td>${transaction.amount.details.subtotal} USD</td>
                </tr>

                <tr>
                    <td>Total:</td>
                    <td>${transaction.amount.total} USD</td>
                </tr>
                <tr>
                    <td><br /></td>
                </tr>
                <tr>
                    <td colspan="2"><b>Payer Information:</b></td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td>${payer.firstName}</td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td>${payer.lastName}</td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>${payer.email}</td>
                </tr>
                <tr>
                    <td><br /></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Pay Now" class="button is-primary is-fullwidth"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>


</div>
</body>
</html>
