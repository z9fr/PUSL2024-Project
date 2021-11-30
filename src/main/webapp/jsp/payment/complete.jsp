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

<p style="text-align:center;color:#1ab394;font-size:24px;font-weight:500;">Cheers! Payment Successful!
    ${payer.firstName} </p>
<br>Payer Details:&nbsp;<strong
        style="font-weight:500;font-size:16px;color: #222222;">${payer.firstName} ${payer.lastName} </strong>
<br>Payment amount:&nbsp;<strong style="font-weight:500;font-size:16px;color: #222222;">${transaction.amount.total}
    USD</strong>
<br>transaction description:&nbsp;<strong
        style="font-weight:500;font-size:16px;color: #222222;">${transaction.description}</strong>
<br>Thank you for booking this room! <strong style="font-weight:500;font-size:15px;color: #222222;"> we are hoping to
    see you soon</strong></p>

</body>
</html>
