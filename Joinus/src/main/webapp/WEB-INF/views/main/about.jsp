<%@ page import="com.ezen.joinus.vo.ProductVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
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
        opacity: 0; /* 초기에는 텍스트가 보이지 않도록 설정 */
        overflow: hidden; /* 텍스트의 너비를 넘어가는 부분은 숨깁니다 */
    }

    @keyframes moveText {
        /*0% { left: 10%; opacity: 1; }*/
        0% { left: 0%; opacity: 0; } /* 천천히 보여지도록 애니메이션 추가 */
        100% { left: 30%; opacity: 1; }
    }

    .message-box {
        text-align: left;
        align-self: flex-start; /* 내가 입력한 메시지는 왼쪽에 정렬 */
        background-color: #fd8d48; /* 내가 입력한 메시지의 배경색 */
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 10px;
        color: white; /* 글씨 색상 */
        font-family: Helvetica, Arial, sans-serif; /* 폰트 */
        font-size: 14px; /* 폰트 크기 */
        /*font-weight: bold; !* 글씨 굵기 *!*/
    }

    .message-box.other {
        text-align: right;
        align-self: flex-end; /* 다른 사람이 입력한 메시지는 오른쪽에 정렬 */
        background-color: #e7e7e7; /* 다른 사람이 입력한 메시지의 배경색 */
        color: black;
        /*font-weight: bold; !* 글씨 굵기 *!*/
    }

    /* 첫번째 섹션 */
    .board-body ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-wrap: wrap;
    }

    .board-body li {
        width: calc(25% - 20px);
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
        height: 180px;
    }

    .post-content {
        padding: 10px;
        text-align: center;
        margin-top: 10px;
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

    /* 두번째 섹션 */
    .board-body1{
        width: 75%;
    }

    .board-body1 ul {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        flex-wrap: wrap;
    }

    .board-body1 li {
        width: calc(33.33% - 20px);
        margin-right: 20px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(0,0,0,0.3);
        transition: box-shadow 0.2s ease-in-out;
    }

    .board-body1 li:hover {
        box-shadow: 0 4px 4px rgba(0,0,0,0.3);
    }

    .post-thumbnail1 img {
        display: block;
        width: 100%;
        height: 180px;
    }


    .post-content1 {
        padding: 10px;
        text-align: center;
        margin-top: 10px;
    }

    .post-content1 h3 {
        margin-top: 0;
        margin-bottom: 10px;
    }

    .post-content1 p {
        margin: 0;
        line-height: 1.5;
    }

    .post-content1 a {
        display: block;
        text-align: center;
        margin-top: 10px;
        font-size: 13px;
        font-weight: bold;
        font-family: "Poppins", sans-serif;
        color : peru;
    }
    .hit1{
        margin-top: 0px;
        margin-bottom: 10px;
        font-size:40px;
        font-weight: 900;
        color:#333;
        letter-spacing:-1px;
    }
</style>
<body class="sub_page about_page">
<img src="../../../resources/images/banner.png" style="margin-left: 367px; width: 1170px; height: 400px">
<br>
<br>
<section>
    <div class="outter">
        <div class="hit"><span style="color: #ff731b;">히트</span>상품</div>
        <hr>
        <div class="board">
            <div class="board-body">
                <ul>
                    <c:choose>
                        <c:when test="${!empty purchaseVOList}">
                            <c:forEach var="product" items="${purchaseVOList}" varStatus="status" end="3">
                                <li>
                                    <div class="post-thumbnail1">
                                        <img src="/display?fileName=${thumbnailList1[status.index].uploadPath}/${thumbnailList1[status.index].uuid}_${thumbnailList1[status.index].fileName}" alt="게시물 썸네일"/>
                                    </div>
                                    <div class="post-content">
                                        <a href="/board/read?pno=${purchaseVOList[status.index].pno}">${purchaseVOList[status.index].p_name}</a>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:when test="${empty purchaseVOList}">
                            <c:forEach var="product" items="${productList}" varStatus="status" end="3">
                                <li>
                                    <div class="post-thumbnail1">
                                        <img src="/display?fileName=${thumbnailList[status.index].uploadPath}/${thumbnailList[status.index].uuid}_${thumbnailList[status.index].fileName}" alt="게시물 썸네일"/>
                                    </div>
                                    <div class="post-content">
                                        <a href="/board/read?pno=${productList[status.index].pno}">${productList[status.index].p_name}</a>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</section>
<%-- 현재 로그인된 사용자 주소 --%>
<p>${customerloginUser.u_addrStreet}</p>
${customerloginUser.u_addrStreet.substring(0, 6)}
<p>${businessUser.b_addrStreet}</p>
${businessUser.b_addrStreet.substring(0, 6)}
<section>
    <div class="outter" style="flex-grow: 1;">
        <hr>
        <div class="hit1">내 <span style="color: #ff731b;">주변</span> 가게</div>
        <!-- 옵션선택 끝 -->
        <div class="board1">
            <div class="board-body1">
                <ul>
                    <c:choose>
                        <c:when test="${empty customerloginUser && empty businessUser}">
                            <div style="height: 521px; width: 850px;">
                                <img src="../../../resources/images/store.png" style="margin-left: 290px; width: 240px; height: 250px; margin-top: 50px">
                                <span style="margin-left: -170px; letter-spacing: -1px">로그인 해주세요</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:set var="noMatchingProducts" value="true" />
                            <c:forEach var="product" items="${productList}" varStatus="productStatus">
                                <c:forEach var="store" items="${storeVOList}" varStatus="storeStatus">
                                    <c:if test="${!empty customerloginUser && product.sno == store.sno && store.s_addrStreet.indexOf(customerloginUser.u_addrStreet.substring(0, 6)) != -1}">
                                        <li>
                                            <div class="post-thumbnail1">
                                                <img src="/display?fileName=${thumbnailList[productStatus.index].uploadPath}/${thumbnailList[productStatus.index].uuid}_${thumbnailList[productStatus.index].fileName}" alt="게시물 썸네일">
                                            </div>
                                            <div class="post-content1">
                                                <a href='/board/read?pno=${product.pno}'>${product.p_name}</a>
                                            </div>
                                        </li>
                                        <c:set var="noMatchingProducts" value="false" />
                                    </c:if>
                                    <c:if test="${!empty businessUser && product.sno == store.sno && store.s_addrStreet.indexOf(businessUser.b_addrStreet.substring(0, 6)) != -1}">
                                        <li>
                                            <div class="post-thumbnail1">
                                                <img src="/display?fileName=${thumbnailList[productStatus.index].uploadPath}/${thumbnailList[productStatus.index].uuid}_${thumbnailList[productStatus.index].fileName}" alt="게시물 썸네일">
                                            </div>
                                            <div class="post-content1">
                                                <a href='/board/read?pno=${product.pno}'>${product.p_name}</a>
                                            </div>
                                        </li>
                                        <c:set var="noMatchingProducts" value="false" />
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            <c:if test="${noMatchingProducts}">
                                <div style="height: 521px; width: 850px;">
                                    <img src="../../../resources/images/store.png" style="margin-left: 290px; width: 240px; height: 250px; margin-top: 50px">
                                    <span style="margin-left: -220px; letter-spacing: -1px">근처에 등록된 상품이 없습니다.</span>
                                </div>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>

        <aside style="position: absolute; top: 975px; right: 360px;">
            <div style="flex-shrink: 0; width: 300px;">
                <h1 class="hit">Let's Join Us!</h1>
                <input type="hidden" id="id" value="${customerloginUser.u_name}">
                <div class="moving-text">건전한 채팅 부탁드립니다</div>
                <div>
                    <div id="chatarea" class="chatarea" style="width: 260px; height: 270px; overflow-y: auto; background-color: white; padding: 10px; "><br></div>
                    <input type="text" class="message" id="message" style="width: 86%; height: 35px" />
                    <input type="button" id="send" class="account2" value="보내기" style="width: 65%; padding: 5px;"/>
                    <input type="button" id="exit" class="exit" value="나가기" />
                </div>
            </div>
            <img src="../../../resources/images/friends.png" style="max-width: 280px; margin-top: 30px">
        </aside>
    </div>
</section>
<%@ include file="../footer/footer.jsp"%>
</body>
<script>
    // 페이지 로드 시 실행되는 함수
    window.onload = function() {
        var movingText = document.querySelector('.moving-text');
        var containerWidth = window.innerWidth;
        var textWidth = movingText.offsetWidth;

        // 텍스트가 왼쪽에서 오른쪽으로 이동하도록 위치 조정
        movingText.style.left = -textWidth + 'px';

        // 텍스트가 완전히 나가면 다시 시작 위치로 이동
        movingText.addEventListener('animationiteration', function() {
            movingText.style.left = -textWidth + 'px';
        });
    };
</script>
<!-- 생략된 코드 -->
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
        if (${customerloginUser == null && businessUser == null}) {
            websocket.send("<div style='color: #7c7c7c; font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; text-align: center'>로그인 후 이용해주세요.</div>");
            document.getElementById("message").disabled = true;
            document.getElementById("send").disabled = true;
            document.getElementById("exit").disabled = true;
        }else if(${businessUser != null && customerloginUser == null}){
            websocket.send("<div style='color: #7c7c7c; font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; text-align: center;'>사업자는 채팅이 불가능합니다.</div>");
            document.getElementById("message").disabled = true;
            document.getElementById("send").disabled = true;
            document.getElementById("exit").disabled = true;
        } else {
            id = document.getElementById("id").value;
            websocket.send("<div style='color: black; font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-weight: bold; text-align: center;'>" + id + "님이 입장하셨습니다.</div>");
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
</html>
