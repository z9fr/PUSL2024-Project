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
</head>
<body>
<div align="center">
    <h1>fuck you</h1>
    <form action="/user/complete_pay" method="POST">
        <table>
            <tr>
                <td colspan="2"><b>Transaction Details:</b></td>
                <td>
                    <input type="hidden" name="payid" value="${param.paymentid}" />
                    <input type="hidden" name="payerid" value="${param.payerid}" />
                </td>
            </tr>

            <code> payment id = ${param.paymentid}</code>
            <code> payer id   = ${param.payerid}</code>
            <tr>
                <td>Description:</td>
                <td>${transaction.description}</td>
            </tr>
            <tr>
                <td>Subtotal:</td>
                <td>${transaction.amount.details.subtotal} USD</td>
            </tr>

            <tr>
                <td>Tax:</td>
                <td>${transaction.amount.details.tax} USD</td>
            </tr>
            <tr>
                <td>Total:</td>
                <td>${transaction.amount.total} USD</td>
            </tr>
            <tr><td><br/></td></tr>
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
            <tr><td><br/></td></tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Pay Now" />
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>