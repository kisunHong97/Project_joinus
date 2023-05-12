<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String errormessage = (String) session.getAttribute("errormessage");
   if(errormessage==null) errormessage="";
//   session.invalidate();
   String cerrormessage = (String) session.getAttribute("cerrormessage");
   if(cerrormessage==null) cerrormessage="";
//   session.invalidate();
%>
    <html>
    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta
                name="viewport"
                content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Energym</title>
        <link
                rel="stylesheet"
                type="text/css"
                href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
        />

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css" />

        <!-- fonts style -->
        <link
                href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
                rel="stylesheet"
        />
        <!-- Custom styles for this template -->
        <link href="../../../resources/css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="../../../resources/css/responsive.css" rel="stylesheet" />
        <link href="../../../resources/css/logincss.css" rel="stylesheet" />
    </head>
    <%@ include file="../header/header.jsp"%>
    <style>
        .container1 {
            display: flex;
            justify-content: center;
            width: 700px;
            height: 300px;
            margin: 0 auto;
        }

        #alert2 {
            border-color: transparent;
        }
        .main1 {
            width: 250px;
            height: 300px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            border: 1px solid lightgrey;
            border-radius: 5px;
            margin: 50px;
        }
        button {
            width: 100%;
            background-color: #ff6f84;
            border-color: transparent;
            color: white;
        }
    </style>
    <body>
    <div class="container1">
        <div class="main1" style="margin: 0 auto">
            <h1 class="logo">고객 로그인</h1>
            <form action="customerlogin" method="post">
                <input type="text" placeholder="ID" name="u_id" id="u_id" class="account">
                <input type="password" placeholder="Password" name="u_pwd" id="u_pwd" class="account">
                <div id="cerrormessage" style="color:red;" >
                    <%=cerrormessage%>
                    <button type="submit" class="account">login</button>
                    <p id="alert2" class="account"> </p>
                </div>
            </form>
        </div>
        <div class="main1" style="margin: 0 auto">
            <h1 class="logo">사업자 로그인</h1>
            <form action="login" method="post">
                <input type="text" placeholder="ID" name="b_id" id="b_id" class="account">
                <input type="password" placeholder="Password" name="b_pwd" id="b_pwd" class="account">
                <div id="errormessage" style="color:red;" >
                    <%=errormessage%>
                </div>
                <button type="submit" class="account">login</button>
                <p id="alert" class="account"> </p>
            </form>
        </div>
    </div>
    <%@ include file="../footer/footer.jsp"%>
    </body>
    </html>

