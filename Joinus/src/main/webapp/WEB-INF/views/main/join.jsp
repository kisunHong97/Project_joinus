<%--
  Created by IntelliJ IDEA.
  User: b14
  Date: 2023-05-04
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <link href="../../../resources/css/logincss.css" rel="stylesheet" />
</head>
<%@ include file="../header/header.jsp"%>
<style>
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

    /*body{*/
    /*    margin:0 auto;*/
    /*}*/
    /* body, table, div, p ,span{font-family:'Nanum Gothic';} */
    /*body, table, div, p ,span{font-family:'Noto Sans KR';}*/

    /*a{*/
    /*    text-decoration: none;*/
    /*    color:#333;*/
    /*}*/

    /*#login_form{*/
    /*    !* text-align:center; *!*/
    /*    border-radius: 10px;*/
    /*    padding:40px 50px;*/
    /*    background: #fff;*/
    /*    text-align: center;*/
    /*    position: absolute;*/
    /*    top:50%;*/
    /*    left:50%;*/
    /*    transform: translate(-50%, -50%);*/
    /*    display: flex;*/

    /*}*/
    /*.login{*/
    /*    font-size:25px;*/
    /*    font-weight: 900;*/
    /*    color:#333;*/
    /*}*/

    /*.btn{*/
    /*    width:140px;*/
    /*    height: 40px;*/
    /*    font-size:15px;*/
    /*    background-color: #ff731b;*/
    /*    color:#fff;*/
    /*    border:none;*/
    /*    cursor: pointer;*/
    /*    border-radius: 5px;*/
    /*}*/
    /*.btn:hover{*/
    /*    background: #ff432c;*/
    /*}*/
    /*#a{*/
    /*    margin: 0 50px 0 30px;*/

    /*}*/
    /*#b{*/
    /*    margin: 0 50px 0 30px;*/
    /*}*/
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
            width:140px;
            height: 40px;
            font-size:15px;
            background-color: #ff731b;
            color:#fff;
            border:none;
            cursor: pointer;
            border-radius: 5px;
    }

</style>
<%--<body>--%>
<%--<div class="container1" id="con">--%>
<%--    <div id="login">--%>
<%--        <div class="main1" style="margin: 0 auto" id="login_form"><!--로그인 폼-->--%>
<%--            <form action="/customerjoin" method="post" id="a">--%>
<%--                <h3 class="logo1" style="letter-spacing:-1px;">개인회원</h3>--%>
<%--                <br>--%>
<%--                <p>--%>
<%--                    <input type="submit" value="가입하기" class="btn" href="" >--%>
<%--                </p>--%>
<%--            </form>--%>
<%--            <form action="/join" method="post" id="b">--%>
<%--                <h3 class="login" style="letter-spacing:-1px;">사업자회원</h3>--%>
<%--                <br>--%>
<%--                <p>--%>
<%--                    <input type="submit" value="가입하기" class="btn" >--%>
<%--                </p>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div><!--con-->--%>
<%--</div>--%>
<%--<br>--%>

<body>
<br>
<div class="container1">
    <div class="main1" style="margin: 0 auto">
        <h1 class="logo1">개인회원</h1>
        <form action="/customerjoin" method="post">
            <input type="submit" value="가입하기" class="account2">
        </form>
    </div>
    <div class="main1" style="margin: 0 auto">
        <h1 class="logo1">사업자회원</h1>
        <form action="/join" method="post">
            <input type="submit" value="가입하기" class="account2">
        </form>
    </div>
</div>
<br>
<%@ include file="../footer/footer.jsp"%>
</body>
</html>

</body>
</html>

