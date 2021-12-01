<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 12/1/21
  Time: 11:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Something went wrong</title>
</head>
<body>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <!-- NAME: SIMPLE TEXT -->
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Please confirm your email</title>
    <style type="text/css">
        p{
            margin:1em 0;
        }
        table{
            border-collapse:collapse;
        }
        img,a img{
            border:0;
            outline:none;
            text-decoration:none;
        }
        h1,h2,h3,h4,h5,h6{
            display:block;
            margin:0;
            padding:0;
        }
        body,#bodyTable,#bodyCell{
            height:100% !important;
            margin:0;
            padding:0;
            width:100% !important;
        }
        #outlook a{
            padding:0;
        }
        img{
            -ms-interpolation-mode:bicubic;
        }
        .ReadMsgBody{
            width:100%;
        }
        .ExternalClass{
            width:100%;
        }
        td,table{
            mso-table-lspace:0pt;
            mso-table-rspace:0pt;
        }
        p,a,li,td,body,table,blockquote{
            -ms-text-size-adjust:100%;
            -webkit-text-size-adjust:100%;
        }
        .ExternalClass,.ExternalClass p,.ExternalClass td,.ExternalClass div,.ExternalClass span,.ExternalClass font{
            line-height:100%;
        }
        a.mcnButton{
            display:block;
        }
        .mcnImage{
            vertical-align:bottom;
        }
        .mcnTextContent img{
            height:auto !important;
        }
        /*
        @tab Page
        @section background style
        @tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.
        */
        body,#bodyTable{
            /*@editable*/background-color:#FFFFFF;
        }
        /*
        @tab Page
        @section background style
        @tip Set the background color and top border for your email. You may want to choose colors that match your company's branding.
        */
        #bodyCell{
            /*@editable*/border-top:0;
        }
        /*
        @tab Page
        @section email border
        @tip Set the border for your email.
        */
        #templateContainer{
            /*@editable*/border:0;
        }
        /*
        @tab Page
        @section heading 1
        @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.
        @style heading 1
        */
        h1{
            /*@editable*/color:#333333 !important;
            /*@editable*/font-family:Helvetica;
            /*@editable*/font-size:24px;
            /*@editable*/font-style:normal;
            /*@editable*/font-weight:bold;
            /*@editable*/line-height:125%;
            /*@editable*/letter-spacing:normal;
            /*@editable*/text-align:left;
        }
        /*
        @tab Page
        @section heading 2
        @tip Set the styling for all second-level headings in your emails.
        @style heading 2
        */
        h2{
            /*@editable*/color:#333333 !important;
            /*@editable*/font-family:Helvetica;
            /*@editable*/font-size:20px;
            /*@editable*/font-style:normal;
            /*@editable*/font-weight:bold;
            /*@editable*/line-height:125%;
            /*@editable*/letter-spacing:-.75px;
            /*@editable*/text-align:left;
        }
        /*
        @tab Page
        @section heading 3
        @tip Set the styling for all third-level headings in your emails.
        @style heading 3
        */
        h3{
            /*@editable*/color:#333333 !important;
            /*@editable*/font-family:Helvetica;
            /*@editable*/font-size:18px;
            /*@editable*/font-style:normal;
            /*@editable*/font-weight:bold;
            /*@editable*/line-height:125%;
            /*@editable*/letter-spacing:normal;
            /*@editable*/text-align:left;
        }
        /*
        @tab Page
        @section heading 4
        @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.
        @style heading 4
        */
        h4{
            /*@editable*/color:#333333 !important;
            /*@editable*/font-family:Helvetica;
            /*@editable*/font-size:16px;
            /*@editable*/font-style:normal;
            /*@editable*/font-weight:bold;
            /*@editable*/line-height:125%;
            /*@editable*/letter-spacing:normal;
            /*@editable*/text-align:left;
        }
        /*
        @tab Header
        @section header style
        @tip Set the background color and borders for your email's header area.
        */
        #templateHeader{
            /*@editable*/border-bottom:0;
        }
        /*
        @tab Header
        @section header text
        @tip Set the styling for your email's header text. Choose a size and color that is easy to read.
        */
        .headerContainer .mcnTextContent,.headerContainer .mcnTextContent p{
            /*@editable*/color:#333333;
            /*@editable*/font-family:Helvetica;
            /*@editable*/font-size:15px;
            /*@editable*/line-height:150%;
            /*@editable*/text-align:left;
        }
        /*
        @tab Header
        @section header link
        @tip Set the styling for your email's header links. Choose a color that helps them stand out from your text.
        */
        .headerContainer .mcnTextContent a{
            /*@editable*/color:#333333;
            /*@editable*/font-weight:normal;
            /*@editable*/text-decoration:none;
        }
        /*
        @tab Body
        @section body style
        @tip Set the background color and borders for your email's body area.
        */
        #templateBody{
            /*@editable*/border-top:0;
            /*@editable*/border-bottom:0;
        }
        /*
        @tab Body
        @section body text
        @tip Set the styling for your email's body text. Choose a size and color that is easy to read.
        */
        .bodyContainer .mcnTextContent,.bodyContainer .mcnTextContent p{
            /*@editable*/color:#333333;
            /*@editable*/font-family:Helvetica;
            /*@editable*/font-size:15px;
            /*@editable*/line-height:150%;
            /*@editable*/text-align:left;
        }
        /*
        @tab Body
        @section body link
        @tip Set the styling for your email's body links. Choose a color that helps them stand out from your text.
        */
        .bodyContainer .mcnTextContent a{
            /*@editable*/color:#428BF7;
            /*@editable*/font-weight:normal;
            /*@editable*/text-decoration:none;
        }
        /*
        @tab Footer
        @section footer style
        @tip Set the background color and borders for your email's footer area.
        */
        #templateFooter{
            /*@editable*/border-top:0;
        }
        /*
        @tab Footer
        @section footer text
        @tip Set the styling for your email's footer text. Choose a size and color that is easy to read.
        */
        .footerContainer .mcnTextContent,.footerContainer .mcnTextContent p{
            /*@editable*/color:#333333;
            /*@editable*/font-family:Helvetica;
            /*@editable*/font-size:11px;
            /*@editable*/line-height:125%;
            /*@editable*/text-align:left;
        }
        /*
        @tab Footer
        @section footer link
        @tip Set the styling for your email's footer links. Choose a color that helps them stand out from your text.
        */
        .footerContainer .mcnTextContent a{
            /*@editable*/color:#333333;
            /*@editable*/font-weight:normal;
            /*@editable*/text-decoration:none;
        }
        @media only screen and (max-width:480px){
            body{
                width:100% !important;
                min-width:100% !important;
            }

        }   @media only screen and (max-width:480px){
            td[class=footerContainer] a[class=utilityLink]{
                display:block !important;
            }

        }   @media only screen and (max-width:480px){
            td[class=mcnImageGroupContent]{
                padding:9px !important;
            }

        }   @media only screen and (max-width:480px){
            td[class=mcnImageCardBottomImageContent]{
                padding-bottom:9px !important;
            }

        }   @media only screen and (max-width:480px){
            table[class=mcpreview-image-uploader]{
                display:none !important;
                width:100% !important;
            }

        }   @media only screen and (max-width:480px){
            td[class=mcnImageGroupBlockInner]{
                padding-top:0 !important;
                padding-bottom:0 !important;
            }

        }   @media only screen and (max-width:480px){
            tbody[class=mcnImageGroupBlockOuter]{
                padding-top:9px !important;
                padding-bottom:9px !important;
            }

        }   @media only screen and (max-width:480px){
            td[class=mcnTextContent],td[class=mcnBoxedTextContentColumn]{
                padding-right:18px !important;
                padding-left:18px !important;
            }

        }   @media only screen and (max-width:480px){
            table[class=mcnCaptionLeftContentOuter] td[class=mcnTextContent],table[class=mcnCaptionRightContentOuter] td[class=mcnTextContent]{
                padding-top:9px !important;
            }

        }   @media only screen and (max-width:480px){
            td[class=mcnImageCardLeftImageContent],td[class=mcnImageCardRightImageContent]{
                padding-right:18px !important;
                padding-bottom:0 !important;
                padding-left:18px !important;
            }

        }   @media only screen and (max-width:480px){
            td[class=mcnImageCardTopImageContent],td[class=mcnCaptionBlockInner] table[class=mcnCaptionTopContent]:last-child td[class=mcnTextContent]{
                padding-top:18px !important;
            }

        }   @media only screen and (max-width:480px){
            img[class=mcnImage],table[class=mcnCaptionTopContent],table[class=mcnCaptionBottomContent],table[class=mcnTextContentContainer],table[class=mcnBoxedTextContentContainer],table[class=mcnImageGroupContentContainer],table[class=mcnCaptionLeftTextContentContainer],table[class=mcnCaptionRightTextContentContainer],table[class=mcnCaptionLeftImageContentContainer],table[class=mcnCaptionRightImageContentContainer],table[class=mcnImageCardLeftTextContentContainer],table[class=mcnImageCardRightTextContentContainer],table[class=socialContainer]{
                width:100% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section template width
            @tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesn't work for you, set the width to 300px instead.
            */
            table[id=templateContainer],table[id=templatePreheader],table[id=templateHeader],table[id=templateBody],table[id=templateFooter]{
                /*@tab Mobile Styles
        @section template width
        @tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesn't work for you, set the width to 300px instead.*/max-width:600px !important;
                /*@editable*/width:100% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section heading 1
            @tip Make the first-level headings larger in size for better readability on small screens.
            */
            h1{
                /*@editable*/font-size:24px !important;
                /*@editable*/line-height:125% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section heading 2
            @tip Make the second-level headings larger in size for better readability on small screens.
            */
            h2{
                /*@editable*/font-size:20px !important;
                /*@editable*/line-height:125% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section heading 3
            @tip Make the third-level headings larger in size for better readability on small screens.
            */
            h3{
                /*@editable*/font-size:18px !important;
                /*@editable*/line-height:125% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section heading 4
            @tip Make the fourth-level headings larger in size for better readability on small screens.
            */
            h4{
                /*@editable*/font-size:16px !important;
                /*@editable*/line-height:125% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section Header Text
            @tip Make the header text larger in size for better readability on small screens.
            */
            td[class=headerContainer] td[class=mcnTextContent],td[class=headerContainer] td[class=mcnTextContent] p{
                /*@editable*/font-size:18px !important;
                /*@editable*/line-height:125% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section Body Text
            @tip Make the body text larger in size for better readability on small screens. We recommend a font size of at least 16px.
            */
            td[class=bodyContainer] td[class=mcnTextContent],td[class=bodyContainer] td[class=mcnTextContent] p{
                /*@editable*/font-size:18px !important;
                /*@editable*/line-height:125% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section footer text
            @tip Make the body content text larger in size for better readability on small screens.
            */
            td[class=footerContainer] td[class=mcnTextContent],td[class=footerContainer] td[class=mcnTextContent] p{
                /*@editable*/font-size:14px !important;
                /*@editable*/line-height:115% !important;
            }

        }   @media only screen and (max-width:480px){
            /*
            @tab Mobile Styles
            @section Boxed Text
            @tip Make the boxed text larger in size for better readability on small screens. We recommend a font size of at least 16px.
            */
            table[class=mcnBoxedTextContentContainer] td[class=mcnTextContent],td[class=mcnBoxedTextContentContainer] td[class=mcnTextContent] p{
                /*@editable*/font-size:20px !important;
                /*@editable*/line-height:125% !important;
            }

        }
    </style>
</head>

<body>
<center>
    <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">
        <tr>
            <td align="center" valign="top" id="bodyCell">
                <!-- BEGIN TEMPLATE // -->
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" id="templateContainer">
                    <tr>
                        <td align="left" valign="top">
                            <!-- BEGIN HEADER // -->
                            <table border="0" cellpadding="0" cellspacing="0" width="600" id="templateHeader">
                                <tr>
                                    <td valign="top" class="headerContainer" style="padding-top:9px; padding-bottom:24px;"></td>
                                </tr>
                            </table>
                            <!-- // END HEADER -->
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <!-- BEGIN BODY // -->
                            <table border="0" cellpadding="0" cellspacing="0" width="600" id="templateBody">
                                <tr>
                                    <td valign="top" class="bodyContainer" style="padding-top:9px; padding-bottom:9px;">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnBoxedTextBlock">
                                            <tbody class="mcnBoxedTextBlockOuter">
                                            <tr>
                                                <td valign="top" class="mcnBoxedTextBlockInner">
                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" width="600" class="mcnBoxedTextContentContainer">
                                                        <tbody>
                                                        <tr>
                                                            <td style="padding-top:9px; padding-left:18px; padding-bottom:9px; padding-right:18px;">
                                                                <table border="0" cellpadding="18" cellspacing="0" class="mcnTextContentContainer" width="100%" style="background-color: #FFFFFF;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td valign="top" class="mcnTextContent" style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; text-align: left; padding: 36px; word-break: break-word;">
                                                                            <div style="text-align: center; margin-bottom: 36px">
                                                                                <img align="none" src="https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/000000/external-coffee-interface-kiranshastry-lineal-color-kiranshastry.png">
                                                                            </div>
                                                                            <div style="text-align: left; word-wrap: break-word;">Something went Wrong while Confirming your account :( can you try again ?
                                                                                <br />
                                                                                <br />If you want to see more about the error , click the below button
                                                                                <br />

                                                                                <details>
                                                                                    <summary>error details</summary>
                                                                                    <code>
                                                                                        <%=request.getAttribute("confirm_error_detail_log")%>
                                                                                    </code>
                                                                                </details>

                                                                                <br />
                                                                                <br />Welcome and thanks!
                                                                                <br />The XYZ Hotel Team
                                                                                <div class="footer" style="font-size: 0.7em; padding: 0px; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; text-align: right; color: #777777; line-height: 14px; margin-top: 36px;">© 2021 XYZ Hotel
                                                                                    <br>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <!-- // END BODY -->
                        </td>
                    </tr>
                </table>
                <!-- // END TEMPLATE -->
            </td>
        </tr>
    </table>
</center>
</body>

</html>

</body>
</html>
