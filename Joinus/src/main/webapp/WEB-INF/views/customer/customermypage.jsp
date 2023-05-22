<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
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
        width: 160px;
        height: 110px;
        margin-right: 20px;
        border: 1px solid #e5e5e5;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #mypage-menu > div > a {
        color: #7e7e7e;
    }
    .content{
        display: flex;
        justify-content: center;
    }
    .content > div {
        width: 880px;
        height: 700px;
        margin-right: 20px;
        border: 1px solid #e5e5e5;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    table {
        border-collapse: collapse;
        width: 47%;
        margin: 0 auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<br>

<div id="mypage-menu">
    <div><a href="#" onclick="showContent(1)">이용권 관리</a></div>
    <div><a href="#" onclick="showContent(2)">찜목록</a></div>
    <div><a href="/myinformation?u_id=${a.u_id}" role="button">개인정보 수정</a></div>
    <div><a href="/customerpoint?point=${a.buypoint}" role="button">포인트 충전</a></div>
    <div><a href="#">문의 내역</a></div>

</div>
<br>
<c:choose>
    <c:when test="${not empty buyInfo}">
        <div class="content" id="content1">
            <table border="1">
                <thead>
                <tr>
                    <th>사용자 아이디</th>
                    <th>상품명</th>
                    <th>기간</th>
                    <th>남은일수</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="today" value="<%= new java.util.Date() %>" />
                <c:forEach items="${buyInfo}" var="buy">
                    <%!
                        int daysDiff; // 변수를 스크립트릿 태그 안에서 선언
                    %>
                    <tr>
                        <td>${buy.u_id}</td>
                        <td><a href='/board/read?pno=${buy.pno}'>${buy.p_name}</a></td>
                        <td>${buy.startDate} ~ ${buy.endDate}</td>
                        <td>
                            <fmt:parseDate value="${buy.startDate}" var="startDate" pattern="yyyy년 MM월 dd일"/>
                            <fmt:parseDate value="${buy.endDate}" var="endDate" pattern="yyyy년 MM월 dd일"/>
                            <%
                                // startDate와 endDate 값을 가져옴
                                java.util.Date startDate = (java.util.Date) pageContext.getAttribute("startDate");
                                java.util.Date endDate = (java.util.Date) pageContext.getAttribute("endDate");

                                // 현재 날짜를 가져옴
                                java.util.Date currentDate = new java.util.Date();

                                // 남은 일수 계산
                                long diffMillis = endDate.getTime() - startDate.getTime();
                                int daysDiff = (int) (diffMillis / (24 * 60 * 60 * 1000));

                                // 현재 날짜와 endDate 사이의 일수 계산
                                long currentDiffMillis = endDate.getTime() - currentDate.getTime();
                                int currentDaysDiff = (int) (currentDiffMillis / (24 * 60 * 60 * 1000));

                                // 결과 출력
//                                out.println("남은 일수: " + (currentDaysDiff + 1) + "일");
                            %>
                            <c:choose>
                                <c:when test="<%= currentDaysDiff+1 <= 0 %>">
                                    기간만료 <button type="button" id="delBtn1">삭제</button>
                                </c:when>
                                <c:otherwise>
                                    <%= currentDaysDiff+2 %>일
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:when>
    <c:otherwise>
        <div class="content" id="content1">
            <div>구매상품이 없습니다.</div>
        </div>
    </c:otherwise>
</c:choose>

<%--<c:choose>--%>
<%--<c:when test="${not empty buyInfo}">--%>
<%--<div class="content" id="content2" style="display: none;">--%>
<%--                <table border="1">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>카테고리</th>--%>
<%--                        <th>상품명</th>--%>
<%--                        <th>가격</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>

<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <div class="content" id="content1">--%>
<%--                <div>구매상품이 없습니다.</div>--%>
<%--            </div>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
<br>
</body>
<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    function showContent(contentId) {
        $('.content').hide();
        $('#content' + contentId).show();
    }
</script>
