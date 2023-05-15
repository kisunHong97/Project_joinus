<%--
  Created by IntelliJ IDEA.
  User: b14
  Date: 2023-05-04
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Title</title>
</head>
<%@ include file="../header/header.jsp"%>
<style>
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

  body{margin-top:20px;}
  .avatar{
    width:200px;
    height:200px;
  }

  .main{
    margin-left: 180px;
  }
  .form-horizontal{
    width: 600px;
    margin-left: 300px;
  }
  .text{
    color: #ff3b85;
  }
  .btn{
    width:140px;
    height: 40px;
    font-size:15px;
    background-color: #ff4567;
    color:#fff;
    border:none;
    cursor: pointer;
    border-radius: 5px;

  }
  .btn{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 300px;
  }

</style>
</head>
<body>
<br>
<div class="container bootstrap snippets bootdey">
  <div class="main">
    <h1 class="text">JOINUS 포인트</h1>
    <hr>
    <div class="row">
        <div class="col-md-9 personal-info">
            현재 <strong>${customervo.u_name}</strong>님이 보유하고 있는 JOINUS포인트는 <strong>${point}</strong>포인트 입니다.
        <form class="form-horizontal" role="form" action="/customerpoint?point=${point}" method="post">
            <div class="button">
                <p>
                <div>
                    <input type="submit" value="포인트 충전하기" class="btn">
                </div>
                </p>
            </div>
        </form>
        </div>
    </div>
  </div>
</div>
<hr>

</body>
<%@ include file="../footer/footer.jsp"%>
</html>
