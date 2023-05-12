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
</head>
<%@ include file="../header/header.jsp"%>
<style>
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
    #mypage-menu {
        display: flex;
        justify-content: center;

    }

    #mypage-menu > div {
        width: 170px;
        height: 100px;
        margin-right: 20px;
        border: 1px solid #e5e5e5;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #mypage-menu > div > a {
        color: #7e7e7e;
    }


</style>
</head>
<body>
<br>
<div id="mypage-menu">
    <div><a href="#">구매상품확인</a></div>
    <div><a href="#">이용권 관리</a></div>
    <div><a href="#">찜목록</a></div>
    <div><a href="/myinformation" role="button">개인정보 수정</a></div>
    <div><a href="#">문의 내역</a></div>
</div>
<%--<a href="#" onclick="toggleDiv(1)">Link 1</a>--%>
<%--<a href="#" onclick="toggleDiv(2)">Link 2</a>--%>
<%--<a href="#" onclick="toggleDiv(3)">Link 3</a>--%>

<div id="content1" style="display: none;">Content for Link 1</div>
<div id="content2" style="display: none;">Content for Link 2</div>
<div id="content3" style="display: none;">Content for Link 3</div>
<div class="mypage-form">
    <form>
      <h2>고객 마이페이지에요~</h2>
    </form>
</div>

</body>
<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    // function toggleDiv(divId) {
    //     var div = document.getElementById("content" + divId);
    //     if (div.style.display === "none") {
    //         div.style.display = "block";
    //     } else {
    //         div.style.display = "none";
    //     }
    // }



</script>
