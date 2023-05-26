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

    h2 {
        text-align: center;
    }

    .outter {
        display: block;
        width: 60%;
        margin: auto;
    }
    a {
        text-decoration: none;
    }

    .board-body ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-wrap: wrap;
    }

    .board-body li {
        width: calc(23.33% - 20px);
        margin-right: 20px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(0,0,0,0.3);
        transition: box-shadow 0.2s ease-in-out;
    }

    .board-body li:hover {
        box-shadow: 0 4px 4px rgba(0,0,0,0.3);
    }

    .post-thumbnail img {
        display: block;
        width: 100%;
        height: auto;
    }

    .post-content {
        padding: 10px;
    }

    .post-content h3 {
        margin-top: 0;
        margin-bottom: 10px;
    }

    .post-content p {
        margin: 0;
        line-height: 1.5;
    }

    .post-content a {
        display: block;
        text-align: center;
        margin-top: 10px;
        font-size: 13px;
        font-weight: bold;
        font-family: "Poppins", sans-serif;
        color : peru;
    }
    .hit{
        margin-top: 0px;
        margin-bottom: 10px;
        font-size:40px;
        font-weight: 900;
        color:#333;
        letter-spacing:-1px;
    }

</style>
<script>
    function selChange() {
        var sel = document.getElementById('cntPerPage').value;
        location.href="product_board?nowPage=${paging.nowPage}&cntPerPage="+sel;
    }
</script>
<body class="sub_page about_page">
<br>
<section>
    <div class="outter">
        <h1 class="hit">상품 관리</h1>
        <hr>
        <!-- 옵션선택 끝 -->
        <table border="1">
            <div class="board">
                <div class="board-body">
                    <ul>
                        <c:forEach var="myProduct" items="${myProductList}" varStatus="status">
                            <li>
                                <div class="post-thumbnail">
                                    <img src="/display?fileName=${thumbnailList[status.index].uploadPath}/${thumbnailList[status.index].uuid}_${thumbnailList[status.index].fileName}" alt="게시물 썸네일">
                                </div>
                                <div class="post-content">
                                    <a href="/modify/${myProductList[status.index].pno}">${myProductList[status.index].p_inst }</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </table>
    </div>
</section>
</section>
<div style="display: block; text-align: center;">
    <c:if test="${paging.startPage != 1 }">
        <a href="/showMyProduct?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
    </c:if>
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
        <c:choose>
            <c:when test="${p == paging.nowPage }">
                <b>${p }</b>
            </c:when>
            <c:when test="${p != paging.nowPage }">
                <a href="/showMyProduct?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
            </c:when>
        </c:choose>
    </c:forEach>
    <c:if test="${paging.endPage != paging.lastPage}">
        <a href="/showMyProduct?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
    </c:if>
</div>
<%@ include file="../footer/footer.jsp"%>
</body>
</html>

<!-- 생략된 코드 -->
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">


</script>
