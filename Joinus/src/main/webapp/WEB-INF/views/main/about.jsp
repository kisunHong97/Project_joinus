<%@ page import="com.ezen.joinus.vo.ProductVO" %>
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
        margin-left: 50px;
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
    .account2 {
        width:140px;
        height: 35px;
        font-size:15px;
        background-color: #ff731b;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;
    }
    .chatarea{
        border-radius: 10px;
        border-style: solid;
        border-color: #e1e1e1;
        border-width: 1px;
    }
    .message{
        border-radius: 5px;
        background-color: #ffe0ca;
        border-style: none;
    }
    .exit{
        width: 60px;
        height: 35px;
        font-size:15px;
        background-color: #ff9d5d;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;
    }
    .moving-text {
        position: absolute;
        white-space: nowrap;
        font-size: 14px;
        color: darkorange;
        animation: moveText 5s linear infinite;
    }

    @keyframes moveText {
        0% { left: 20px; }
        100% { left: calc(100% - 200px); }
    }
    .message-box {
        text-align: left;
        align-self: flex-start; /* 내가 입력한 메시지는 왼쪽에 정렬 */
        background-color: #ffae4d; /* 내가 입력한 메시지의 배경색 */
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 10px;
        color: #ff731b; /* 글씨 색상 */
        font-family: Helvetica, Arial, sans-serif; /* 폰트 */
        font-size: 14px; /* 폰트 크기 */
        font-weight: bold; /* 글씨 굵기 */
    }

    .message-box.other {
        text-align: right;
        align-self: flex-end; /* 다른 사람이 입력한 메시지는 오른쪽에 정렬 */
        background-color: #ffccab; /* 다른 사람이 입력한 메시지의 배경색 */
    }
    .allcategory li {
        text-align: center;
        background-color: black;
        color: white;
        padding: 5px;
        margin-left: 327px;
        width: 160px;
        height: 40px;
    }
    .allcategory li:hover {
        background-color: white;
        color: black;
    }

    /*.arrow-right {*/
    /*    position: relative;*/
    /*    top: -300px; !* 원하는 만큼 요소를 위로 옮깁니다 *!*/
    /*    font-size: 35px;*/
    /*    color: #e5e5e5;*/
    /*    font-weight: bold;*/
    /*}*/
    /*.arrow-left {*/
    /*    position: relative;*/
    /*    font-size: 35px;*/
    /*    color: #e5e5e5;*/
    /*    font-weight: bold;*/
    /*    top: -300px;*/
    /*    left: 795px; !* 원하는 만큼 요소를 오른쪽으로 이동시킵니다 *!*/
    /*}*/
    .board {
        position: relative;
        overflow: hidden;
    }

    .board-body {
        display: flex;
        flex-wrap: wrap;
        transition: transform 0.5s ease-in-out;
        width: 75%;
    }

    .board-item {
        flex: 0 0 33.33%;
        box-sizing: border-box;
        padding: 10px;
    }

    .arrow-left,
    .arrow-right {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 40px;
        height: 40px;
        background-color: #f2f2f2;
        text-align: center;
        line-height: 40px;
        font-weight: bold;
        font-size: 20px;
        text-decoration: none;
        color: #333;
    }

    .arrow-left {
        left: 10px;
    }

    .arrow-right {
        right: 5px;
        left: 810px;
    }
    #slider {
        display: flex;
        transition: transform 0.5s ease;
    }
    .slide {
        flex: 0 0 33.33%;
        padding: 10px;
        opacity: 0;
        visibility: hidden;
        transition: opacity 0.5s ease, visibility 0.5s ease;
    }
    .slide.active {
        opacity: 1;
        visibility: visible;
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
    <div class="outter ">
        <h1 class="hit">히트상품</h1>
        <!-- 옵션선택 끝 -->
        <div class="board">
            <div class="board-body">
                <div class="row">
                    <div id="slider">
                        <div class="col-12">
                            <div class="row">
                                <c:forEach var="food" items="${productList}" varStatus="status">
                                    <c:if test="${status.index >= (paging.nowPage-1) * 6 && status.index < paging.nowPage * 6}">
                                        <div class="col-4">
                                            <div class="board-item">
                                                <div class="post-thumbnail">
                                                    <img src="/display?fileName=${thumbnailList[status.index].uploadPath}/${thumbnailList[status.index].uuid}_${thumbnailList[status.index].fileName}" alt="게시물 썸네일">
                                                </div>
                                                <div class="post-content">
                                                    <a href="/board/read?pno=${productList[status.index].pno}">${productList[status.index].p_inst}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a class="arrow-left" href="#">&lt;</a>
            <a class="arrow-right" href="#">&gt;</a>
        </div>
        </div>

<%--        <table border="1">--%>
<%--            <div class="board">--%>
<%--                <div class="board-body">--%>
<%--                    <c:forEach var="food" items="${productList}" varStatus="status">--%>
<%--                        <c:if test="${status.index >= (paging.nowPage-1) * 6 && status.index < paging.nowPage * 6}">--%>
<%--                            <div class="board-item">--%>
<%--                                <div class="post-thumbnail">--%>
<%--                                    <img src="/display?fileName=${thumbnailList[status.index].uploadPath}/${thumbnailList[status.index].uuid}_${thumbnailList[status.index].fileName}" alt="게시물 썸네일">--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <a href="/board/read?pno=${productList[status.index].pno}">${productList[status.index].p_inst }</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--                <a class="arrow-left" href="#">&lt;</a>--%>
<%--                <a class="arrow-right" href="#">&gt;</a>--%>
<%--            </div>--%>
<%--        </table>--%>

        <aside style="position: absolute; top: 200px; right: 360px;">
            <div style="flex-shrink: 0; width: 300px;">
                <h1 class="hit">Let's Join Us!</h1>
                <input type="hidden" id="id" value="${customerloginUser.u_name}">
                <div class="moving-text">건전한 채팅 부탁드립니다</div>
                <div>
                    <div id="chatarea" class="chatarea" style="width: 260px; height: 300px; overflow-y: auto; background-color: white; padding: 10px; "><br></div>
                    <input type="text" class="message" id="message" style="width: 86%; height: 35px" />
                    <input type="button" id="send" class="account2" value="보내기" style="width: 65%; padding: 5px;"/>
                    <input type="button" id="exit" class="exit" value="나가기" />
                </div>
            </div>
        </aside>
    </div>
</section>

<div style="display: block; text-align: center;">
    <%--    <c:if test="${paging.startPage != 1 }">--%>
    <%--        <a href="/product_board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>--%>
    <%--    </c:if>--%>
    <%--    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">--%>
    <%--        <c:choose>--%>
    <%--            <c:when test="${p == paging.nowPage }">--%>
    <%--                <b>${p }</b>--%>
    <%--            </c:when>--%>
    <%--            <c:when test="${p != paging.nowPage }">--%>
    <%--                <a href="/product_board?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>--%>
    <%--            </c:when>--%>
    <%--        </c:choose>--%>
    <%--    </c:forEach>--%>
    <%--    <c:if test="${paging.endPage != paging.lastPage}">--%>
    <%--        <a href="/product_board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>--%>
    <%--    </c:if>--%>
</div>
</div>
<section>
    <div class="outter" style="flex-grow: 1;">
        <h1 class="hit">맞춤 추천</h1>
        <!-- 옵션선택 끝 -->
        <table border="1">
            <div class="board">
                <div class="board-body">
                    <ul>
                        <c:forEach var="product" items="${productList}" varStatus="status">
                            <li>
                                <div class="post-thumbnail">
                                    <img src="/display?fileName=${thumbnailList[status.index].uploadPath}/${thumbnailList[status.index].uuid}_${thumbnailList[status.index].fileName}" alt="게시물 썸네일">
                                </div>
                                <div class="post-content">
                                    <a href='/board/read?pno=${productList[status.index].pno}'>${productList[status.index].p_inst }</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </table>
    </div>
</section>
<%@ include file="../footer/footer.jsp"%>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        var boardWidth = $('.board-body').width();
        var boardItemCount = $('.board-item').length;
        var itemsPerRow = 3;
        var boardHeight = Math.ceil(boardItemCount / itemsPerRow) * $('.board-item').outerHeight();
        var currentIndex = 0;

        $('.board').css('height', boardHeight);

        $('.arrow-right').click(function() {
            if (currentIndex < Math.ceil(boardItemCount / itemsPerRow) - 1) {
                currentIndex++;
                $('.board-body').css('transform', 'translateX(-' + (currentIndex * boardWidth) + 'px)');
            }
        });

        $('.arrow-left').click(function() {
            if (currentIndex > 0) {
                currentIndex--;
                $('.board-body').css('transform', 'translateX(-' + (currentIndex * boardWidth) + 'px)');
            }
        });

        function loadRemainingItems() {
            var visibleItemCount = (currentIndex + 1) * itemsPerRow;
            var totalItemCount = $('.board-item').length;

            if (visibleItemCount < totalItemCount) {
                var remainingItems = $('.board-item:lt(' + totalItemCount + '):gt(' + visibleItemCount + ')').clone();
                $('.board-body').append(remainingItems);
            }
        }

        // 슬라이드 이동 완료 후에 남은 리스트를 불러오도록 호출
        $('.arrow-right, .arrow-left').on('transitionend', loadRemainingItems);
    });
</script>
<script>
    // 페이지 로드 시 실행되는 함수
    window.onload = function() {
        var movingText = document.querySelector('.moving-text');
        var containerWidth = window.innerWidth;
        var textWidth = movingText.offsetWidth;

        // 텍스트가 화면 밖으로 나가지 않도록 위치 조정
        movingText.style.left = containerWidth + 'px';

        // 텍스트가 완전히 나가면 다시 시작 위치로 이동
        movingText.addEventListener('animationiteration', function() {
            movingText.style.left = containerWidth + 'px';
        });
    };
</script>
<!-- 생략된 코드 -->
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
    function onOpen() {
        if (${customerloginUser == null}) {
            websocket.send("<div style='color: #ff731b; font-family: Helvetica, Arial, sans-serif; font-size: 16px; font-weight: bold;'>로그인 후 이용해주세요.&nbsp&nbsp&nbsp&nbsp</div>");
            document.getElementById("message").disabled = true;
            document.getElementById("send").disabled = true;
            document.getElementById("exit").disabled = true;
        } else {
            id = document.getElementById("id").value;
            websocket.send("<div style='color: #ff731b; font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold;'>" + id + "님이 입장하셨습니다.&nbsp&nbsp&nbsp&nbsp</div>");
        }
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
        data = evt.data;
        chatarea = document.getElementById("chatarea");

        // 내가 입력한 메시지인지 확인
        if (data.startsWith(id + ":")) {
            chatarea.innerHTML += "<div class='message-box'>" + data + "</div>";
        } else {
            chatarea.innerHTML += "<div class='message-box other'>" + data + "</div>";
        }

        // 스크롤을 맨 아래로 이동
        chatarea.scrollTop = chatarea.scrollHeight;
        // data= evt.data;
        // chatarea = document.getElementById("chatarea");
        // chatarea.innerHTML = chatarea.innerHTML + "<br/>" + data
    }

    // ##### 연결을 해제합니다!
    document.getElementById("exit").addEventListener("click", function() {
        disconnect();
    });

    function disconnect(){

        id = document.getElementById("id").value;
        websocket.send("<div class='message-box1'>" + id + "님이 퇴장하셨습니다.</div>");
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
