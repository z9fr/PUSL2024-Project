<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://unpkg.com/tailwindcss@2.2.4/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<!-- Create By Joker Banny -->
<div class="min-h-screen bg-no-repeat bg-cover bg-center"
     style="background-image: url('/static/img/hero.webp')">
    <div class="flex justify-end">
        <div class="bg-white min-h-screen w-1/2 flex justify-center items-center">
            <div>

                    <form action="/login" method="POST">
                        <div>
                            <span class="text-sm text-gray-900">Welcome back</span>
                            <h1 class="text-2xl font-bold">Login to your account</h1>
                        </div>
                        <div class="mt-5">
                            <label class="block text-md mb-2" >UserName</label>
                            <input class="px-4 w-full border-2 py-2 rounded-md text-sm outline-none" type="text" name="username" placeholder="e.g. @alex" required>
                        </div>
                        <div class="my-3">
                            <label class="block text-md mb-2" >Password</label>
                            <input class="px-4 w-full border-2 py-2 rounded-md text-sm outline-none" type="password" name="password" placeholder="********" required>
                        </div>
                        <div class="flex justify-between">

                            <span class="text-sm text-blue-700 hover:underline cursor-pointer">Forgot password?</span>
                        </div>
                        <div class="">
                            <input type="submit" value="Login" class="mt-4 mb-3 w-full bg-green-500 hover:bg-green-400 text-white py-2 rounded-md transition duration-100">
                            <div class="flex  space-x-2 justify-center items-end bg-gray-700 hover:bg-gray-600 text-white py-2 rounded-md transition duration-100"">

                            <button id="backtoHome" onclick="backtohome()">Back to Home</button>

                            <a href="/home" id="takemebacktohome" style="display: none"> backtoehome</a>

                        </div>




                            <%
                                if (request.getAttribute("error") != null) {
                            %>
                        <br><br>
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
                </form>
            <p class="mt-8"> Dont have an account? <span class="cursor-pointer text-sm text-blue-600"> Join free today</span></p>
        </div>
    </div>
</div>
</div>
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
