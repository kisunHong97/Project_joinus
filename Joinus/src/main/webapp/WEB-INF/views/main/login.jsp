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

        <title>Energym</title>
        <link href="../../../resources/css/logincss.css" rel="stylesheet" />
    </head>
    <%@ include file="../header/header.jsp"%>
    <style>
        @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
        @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

        .logo1 {
            margin-top: 0px;
            margin-bottom: 40px;
            font-size:30px;
            font-weight: 900;
            color:#333;
            letter-spacing:-1px;
        }

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
            border: none;
            border-radius: 5px;
            margin: 50px;
        }
        button {
            width: 100%;
            background-color: #ff731b;
            border-color: transparent;
            color: white;
        }
        .account2 {
            display: block;
            margin-bottom: 3px;
            padding: 3px;
            border: none;
            border-radius: 3px;
        }
    </style>
    <body>
    <br>
    <div class="container1">
        <div class="main1" style="margin: 0 auto">
            <h1 class="logo1">고객 로그인</h1>
            <form action="customerlogin" method="post">
                <input type="text" placeholder="ID" name="u_id" id="u_id" class="account">
                <input type="password" placeholder="Password" name="u_pwd" id="u_pwd" class="account">
                <div id="cerrormessage" style="color:red;" >
                    <%=cerrormessage%>
                    <button type="submit" class="account2">login</button>
                    <p id="alert2" class="account"> </p>
                </div>
                <div class="box">
                  <span class="input-wrap">
                    <input type="checkbox" id="checkId" name="checkId">
                    <label for="checkId"><span></span></label>
                    아이디 저장
                  </span>
                </div>
            </form>
        </div>
        <div class="main1" style="margin: 0 auto">
            <h1 class="logo1">사업자 로그인</h1>
            <form action="login" method="post">
                <input type="text" placeholder="ID" name="b_id" id="b_id" class="account">
                <input type="password" placeholder="Password" name="b_pwd" id="b_pwd" class="account">
                <div id="errormessage" style="color:red;" >
                    <%=errormessage%>
                </div>
                <button type="submit" class="account2">login</button>
                <p id="alert" class="account"> </p>
                <div class="box">
                      <span class="input-wrap">
                        <input type="checkbox" id="checkBusinessId" name="checkId">
                        <label for="checkBusinessId"><span></span></label>
                        아이디 저장
                      </span>
                </div>
            </form>

        </div>
    </div>
    <br>
    <%@ include file="../footer/footer.jsp"%>
    </body>
    </html>

<script>

    $(document).ready(function() {
        loadRememberedId("#u_id", "#checkId", "key1");
        loadRememberedId("#b_id", "#checkBusinessId", "key2");

        $("#checkId").change(function() {
            handleRememberId("#u_id", "#checkId", "key1");
        });
        $("#checkBusinessId").change(function() {
            handleRememberId("#b_id", "#checkBusinessId", "key2");
        });
        $("#u_id").keyup(function() {
            if ($("#checkId").is(":checked")) {
                setRememberedId("#u_id", "key1");
            }
        });

        $("#b_id").keyup(function() {
            if ($("#checkBusinessId").is(":checked")) {
                setRememberedId("#b_id", "key2");
            }
        });

        function loadRememberedId(inputId, checkboxId, cookieName) {
            var key = getCookie(cookieName);
            $(inputId).val(key);

            if ($(inputId).val() !== "") {
                $(checkboxId).attr("checked", true);
            }
        }

        function handleRememberId(inputId, checkboxId, cookieName) {
            if ($(checkboxId).is(":checked")) {
                setRememberedId(inputId, cookieName);
            } else {
                deleteCookie(cookieName);
            }
        }

        function setRememberedId(inputId, cookieName) {
            var key = $(inputId).val();
            setCookie(cookieName, key, 7);
        }

        function setCookie(cookieName, value, exdays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }

        function deleteCookie(cookieName) {
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }

        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';

            if (start != -1) {
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if (end == -1) {
                    end = cookieData.length;
                }
                cookieValue = cookieData.substring(start, end);
            }

            return unescape(cookieValue);
        }
    })
    //사업자 아이디 저장

</script>

