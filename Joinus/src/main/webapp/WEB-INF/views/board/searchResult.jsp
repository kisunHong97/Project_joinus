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

    h2 {
        text-align: center;
    }
    /*table {*/
    /*  width: 100%;*/
    /*}*/
    .outter {
        display: block;
        width: 60%;
        margin: auto;
    }
    a {
        text-decoration: none;
    }
    /*.board {*/
    /*  width: 100%;*/
    /*}*/

    .board-header {
        text-align: center;
        margin-bottom: 20px;
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
    .carousel-container {
        display: flex;
        overflow: hidden;
        width: 100%;
    }

    .carousel-list {
        display: flex;
        transition: transform 0.5s ease;
    }

    .carousel-item {
        flex: 0 0 33.33%;
        padding: 10px;
        text-align: center;
    }

    .carousel-button {
        background-color: #f1f1f1;
        border: none;
        color: #555;
        cursor: pointer;
        font-size: 18px;
        outline: none;
        padding: 8px 16px;
        margin: 10px;
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
<%--        <div style="float: right;">--%>
<%--            <select id="cntPerPage" name="sel" onchange="selChange()">--%>
<%--                <option value="5"--%>
<%--                        <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>--%>
<%--                <option value="10"--%>
<%--                        <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>--%>
<%--                <option value="15"--%>
<%--                        <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>--%>
<%--                <option value="20"--%>
<%--                        <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>--%>
<%--            </select>--%>
<%--        </div>--%>
        <h1 class="hit">검색 결과</h1>
    <hr>
    <br>
        <!-- 옵션선택 끝 -->
        <table border="1">
            <div class="board">
                <div class="board-body">
                    <ul>
                        <c:forEach var="searchResult" items="${searchResultList}" varStatus="status">
                        <c:if test="${status.index % 3 == 0}">
                    </ul><ul>
                    </c:if>
                    <li>
                        <div class="post-thumbnail">
                            <img src="/display?fileName=${thumbnailList[status.index].uploadPath}/${thumbnailList[status.index].uuid}_${thumbnailList[status.index].fileName}" alt="게시물 썸네일">
                        </div>
                        <div class="post-content">
                            <a href='/board/read?pno=${searchResultList[status.index].pno}'>${searchResultList[status.index].p_inst }</a>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                </div>
            </div>
        </table>
    </div>
</section>

<%--    <div style="display: block; text-align: center;">--%>
<%--        <c:if test="${paging.startPage != 1 }">--%>
<%--            <a href="/product_board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>--%>
<%--        </c:if>--%>
<%--        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${p == paging.nowPage }">--%>
<%--                    <b>${p }</b>--%>
<%--                </c:when>--%>
<%--                <c:when test="${p != paging.nowPage }">--%>
<%--                    <a href="/product_board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${paging.endPage != paging.lastPage}">--%>
<%--            <a href="/product_board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>--%>
<%--        </c:if>--%>
<%--    </div>--%>
</div>
<div class="pagination" style="display: block; text-align: center;">
    <c:if test="${paging.startPage != 1 }">
        <a href="/product_board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
    </c:if>
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
        <c:choose>
            <c:when test="${p == paging.nowPage }">
                <b>${p }</b>
            </c:when>
            <c:when test="${p != paging.nowPage }">
                <a href="/product_board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
            </c:when>
        </c:choose>
    </c:forEach>
    <c:if test="${paging.endPage != paging.lastPage && paging.lastPage > 10}">
        <a href="/product_board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
    </c:if>
</div>
<br>
<%@ include file="../footer/footer.jsp"%>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.1.3/socket.io.js"></script>

<script type="text/javascript">
    // ##### 입장~~~!!
    let websocket;
    connect();
    function connect(){
        console.log("통신");
// 		websocket = new WebSocket("ws://본인 아이 피주소/www/chat-ws");
        websocket = new WebSocket("ws://localhost:8080/chat-ws");
        //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
        websocket.onopen = onOpen;
        websocket.onmessage = onMessage;
    }

    // ##### 연결 되었습니다!
    function onOpen(){
        id = document.getElementById("id").value;
        websocket.send(id + "님 입장하셨습니다.");
    }

    // ##### 메세지 보내기 버튼 클릭!
    document.getElementById("send").addEventListener("click", function() {
        send();
    });

    function send(){
        if (websocket.readyState === WebSocket.OPEN) {
            id = document.getElementById("id").value;
            msg = document.getElementById("message").value;
            websocket.send(id + ":" + msg);
            document.getElementById("message").value = "";
        }
    }

    function onMessage(evt){
        data= evt.data;
        chatarea = document.getElementById("chatarea");
        chatarea.innerHTML = chatarea.innerHTML + "<br/>" + data
    }

    // ##### 연결을 해제합니다!
    document.getElementById("exit").addEventListener("click", function() {
        disconnect();
    });

    function disconnect(){
        id = document.getElementById("id").value;
        websocket.send(id + "님이 퇴장하셨습니다.");
        document.getElementById("message").disabled = true;
        document.getElementById("send").disabled = true;
        document.getElementById("exit").disabled = true;

        //websocket.close();
    }
</script>
<script>
    function openNav() {
        document.getElementById("myNav").classList.toggle("menu_width");
        document
            .querySelector(".custom_menu-btn")
            .classList.toggle("menu_btn-style");
    }
</script>
</body>
</html>