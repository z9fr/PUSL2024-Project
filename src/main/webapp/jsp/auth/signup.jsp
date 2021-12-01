<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://unpkg.com/tailwindcss@2.1.4/dist/tailwind.css" rel="stylesheet">
    <style>
        button{
            border-radius: 4px;
        }
        input
        {
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="relative min-h-screen flex items-center justify-center bg-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8 bg-gray-500 bg-no-repeat bg-cover relative items-center"
     style="background-image: url(/static/img/hero.webp);">

    <div class="absolute bg-black opacity-60 inset-0 z-0"></div>
        <div class="max-w-md w-full space-y-8 p-10 bg-white shadow-lg z-10" style="border-radius: 10px;">

        <div class="grid  gap-8 grid-cols-1">
            <div class="flex flex-col ">
                <div class="flex flex-col sm:flex-row items-center">
                    <h2 class="font-semibold text-lg mr-auto">Thank You for Joining With Us</h2>
                    <div class="w-full sm:w-auto sm:ml-auto mt-3 sm:mt-0"></div>
                </div>
                <div class="mt-5">

                    <form action="/signup" method="POST">
                        <div class="form">

                            <div class="md:flex flex-row md:space-x-4 w-full text-xs">
                                <div class="mb-3 space-y-2 w-full text-xs">
                                    <label class="font-semibold text-gray-600 py-2">Your Username <abbr title="required">*</abbr></label>
                                    <input placeholder="@john" class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter h-10 px-4" required="required" type="text" name="username">
                                    <p class="text-red text-xs hidden">Please fill out this field.</p>
                                </div>

                            </div>
                            <div class="mb-3 space-y-2 w-full text-xs">
                                <label class="font-semibold text-gray-600 py-2">Your  Mail <abbr title="required">*</abbr></label>
                                <div class="flex flex-wrap items-stretch w-full mb-4 relative">
                                    <input placeholder="john@mail.com" class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter h-10 px-4" required="required" type="email" name="email">
                                    <p class="text-red text-xs hidden">Please fill out this field.</p>
                                </div>
                            </div>
                            <div class="md:flex md:flex-row md:space-x-4 w-full text-xs">
                                <div class="w-full flex flex-col mb-3">
                                    <label class="font-semibold text-gray-600 py-2">password <abbr title="required">*</abbr> </label>
                                    <input placeholder="*****" class="appearance-none block w-full bg-grey-lighter text-grey-darker border border-grey-lighter h-10 px-4" type="password" name="password">
                                </div>

                            </div>

                            <a href="/home" id="takemebacktohome" style="display: none"> backtoehome</a>
                            <p class="text-xs text-red-500 text-right my-3">Required fields are marked with an
                                asterisk <abbr title="Required field">*</abbr></p>
                            <div class="mt-5 text-right md:space-x-3 md:block flex flex-col-reverse">
                                <button class="mb-2 md:mb-0 bg-white px-5 py-2 text-sm shadow-sm font-medium tracking-wider border text-gray-600 hover:shadow-lg hover:bg-gray-100" onclick="backtohome()"> Cancel </button>
                                <input type="submit" class="mb-2 md:mb-0 bg-green-400 px-5 py-2 text-sm shadow-sm font-medium tracking-wider text-white hover:shadow-lg hover:bg-green-500" value="Create Account">
                            </div>
                        </div>

                    </form>

                </div>

            </div>

        </div>

            <%
                if (request.getAttribute("error") != null) {
            %>
            <div class="mb-4" id="theErrMesg">
                <div class="flex max-w-sm w-full bg-white shadow-md rounded-lg overflow-hidden mx-auto">
                    <div class="w-2 bg-red-600">
                    </div>
                    <div class="w-full flex justify-between items-start px-2 py-2">
                        <div class="flex flex-col ml-2">
                            <label class="text-gray-800">Message!</label>
                            <p class="text-gray-500 "> <%=request.getAttribute("error")%>
                        </div>
                        <a href="#" onclick="hideErr()">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>

    <script>

        function backtohome() {
            let toclick = document.getElementById("takemebacktohome").click();
        }

        function hideErr(){
            let model = document.getElementById("theErrMesg").style.display="none";
        }

    </script>


</body>
</html>
