<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<%@ include file="../header/header.jsp"%>
<link href="../../../resources/css/category.css" rel="stylesheet" />
<style>
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

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
        <div style="display: flex; align-items: center; justify-content: space-between;">
            <h1 class="hit" style="font-size: 50px; margin-right: auto;">Food</h1>
            <form method="post" action="/location">
                <input type="hidden" name="name" value="food"/>
                <input type="hidden" name="name1" value="Food"/>
            <select class="styled-select" name="location" style="margin-left: auto;">
                <option value="지역 선택" disabled selected>지역 선택</option>
                <option value="서울">서울</option>
                <option value="수원">수원</option>
                <option value="안양">안양</option>
                <option value="인천">인천</option>
                <option value="부산">부산</option>
                <option value="대구">대구</option>
                <option value="대전">대전</option>
                <option value="광주">광주</option>
                <option value="울산">울산</option>
                <option value="용인">용인</option>
                <option value="전주">전주</option>
            </select>
                <button class="search-button " type="submit" value="검색">검색</button>
            </form>
        </div>
        <hr>
        <br>

        <table border="1">
            <div class="board">
                <div class="board-body">
                    <ul>
                        <c:forEach var="food" items="${Foodlist}" varStatus="status">
                            <c:if test="${status.index >= (paging.nowPage-1) * 16 && status.index < paging.nowPage * 16}">
                                <li>
                                    <div class="post-thumbnail">
                                        <img src="/display?fileName=${thumbnailList[status.index].uploadPath}/${thumbnailList[status.index].uuid}_${thumbnailList[status.index].fileName}" alt="게시물 썸네일">
                                    </div>
                                    <div class="post-content">
                                        <a href="/board/read?pno=${Foodlist[status.index].pno}">${Foodlist[status.index].p_inst }</a>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </table>
    </div>
</section>
<br>
<div class="pagination" style="display: block; text-align: center;">
    <c:if test="${paging.startPage != 1 }">
        <a href="/Food?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
    </c:if>
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
        <c:choose>
            <c:when test="${p == paging.nowPage }">
                <b>${p }</b>
            </c:when>
            <c:when test="${p != paging.nowPage }">
                <a href="/Food?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
            </c:when>
        </c:choose>
    </c:forEach>
    <c:if test="${paging.endPage != paging.lastPage && paging.lastPage > 10}">
        <a href="/Food?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
    </c:if>
</div>
<br>
<%@ include file="../footer/footer.jsp"%>
</body>
</html>

<!-- 생략된 코드 -->
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    console.log("테스트")
    var selectedOption = $("select[name='location']").val();
    console.log(selectedOption);
    $(document).ready(function() {
        $(".button").click(function(e) {

            e.preventDefault(); // 기본 동작(폼 제출) 막기

            var selectedOption = $("select[name='location']").val();

            if (selectedOption === null) {
                return; // 아무 동작 실행 안 함
            }
            // 컨트롤러 실행
            $("form").submit();
        });
    });

</script>
