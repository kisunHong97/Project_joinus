<%@ page import="com.ezen.joinus.vo.ProductVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>상품 구매 페이지</title>
    <style>
        /*body {*/
        /*    font-family: Arial, sans-serif;*/
        /*    background-color: #f5f5f5;*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*}*/

        /*.container {*/
        /*    !*max-width: 600px;*!*/
        /*    margin: 0 auto;*/
        /*    padding: 20px;*/
        /*}*/

        h1 {
            color: #333333;
        }

        .product-info {
            margin-bottom: 20px;
        }

        .product-info img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .product-info p {
            margin: 0;
        }

        .customer-info {
            margin-bottom: 20px;
        }

        .customer-info label {
            font-weight: bold;
        }

        .customer-info input[type="text"] {
            width: 100%;
            padding: 5px;
            font-size: 14px;
        }
        .nobuy-button{
            display: inline-block;
            background-color: #ff374a;
            color: #ffffff;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .nobuy-button:hover {
            border: 2px solid #ff374a;
            color: #ff374a;
            background-color: #ffffff;
            border-radius: 4px;
            padding: 10px 20px;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .buy-button {
            display: inline-block;
            background-color: #ff374a;
            color: #ffffff;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .buy-button:hover {
            border: 2px solid #ff374a;
            color: #ff374a;
            background-color: #ffffff;
            border-radius: 4px;
            padding: 10px 20px;
            font-weight: bold;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        /*.container {*/
        /*    !*display: flex;*!*/
        /*    justify-content: center;*/
        /*    align-items: center;*/

        /*}*/
        /*.product-info{*/
        /*    text-align: center;*/
        /*}*/

    </style>
</head>
<%@ include file="../header/header.jsp"%>
<script>
    // URL에서 매개변수 추출하는 함수
    function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    // 날짜 형식을 변경하는 함수
    function formatDate(dateString) {
        var date = new Date(dateString);
        var year = date.getFullYear();
        var month = String(date.getMonth() + 1).padStart(2, '0');
        var day = String(date.getDate()).padStart(2, '0');
        return year + "년 " + month + "월 " + day + "일";
    }

    // 구매 페이지 로드 시 선택된 날짜와 p_price 값을 추출하여 표시
    $(document).ready(function() {
        var startDate = getParameterByName('startDate');
        var endDate = getParameterByName('endDate');
        var p_price = getParameterByName('p_price');
        startDate = formatDate(startDate);
        endDate = formatDate(endDate);
        $("#startDateDisplay").text(startDate);
        $("#endDateDisplay").text(endDate);
        $("#p_price").text(p_price);
    });

    $(document).ready(function() {
        let p_price = getParameterByName('p_price');
        let buypoint = ${customerUserVO.buypoint};
        $("#p_price_span").text(p_price);
        $("#remaining_price_span").text(buypoint - p_price);
    });

</script>
<body>
<br>
<div class="container" style="height: 650px; align-items: center;">
    <h1 style="letter-spacing: -1px; font-weight: bold">구매 페이지</h1>
    <br>
    <div class="buydiv" style="text-align: center;">
      <div class="product-info">
        <div style="width: 300px; height: 40px; border-bottom: 2px solid black; margin-left: 420px">
            <p style="font-size: 20px; font-weight: bold;">구매 상품</p>
        </div>
        <div><p style=" height: 40px; margin-top: 10px;">${productVO.p_name}</p></div>
        <br>
        <div style="width: 300px; height: 40px; border-bottom: 2px solid black; margin-left: 420px">
            <p style="font-size: 20px; font-weight: bold">이용 기간</p>
        </div>
        <div><p style=" height: 40px; margin-top: 10px;"> <span id="startDateDisplay"></span> ~
            <span id="endDateDisplay"></span></p></div>
        <br>
<%--        <p>가격: ${productVO.p_price}메소</p>--%>
        <p>가격: <span id="p_price"></span>&nbsp;포인트</p>
        <p>보유 포인트 : ${customerUserVO.buypoint}&nbsp;포인트</p>
    </div>
    <div class="customer-info">
        <label for="name">요청사항 : </label>
        <input type="text" id="name" name="memo" placeholder="전달할 요청사항을 입력하세요" style="width: 500px; border: 1px solid #afafaf">
        <hr>
        <c:set var="p_price" value="${param.p_price}" />
        <c:choose>
            <c:when test="${p_price <= customerUserVO.buypoint}">
                <label for="name">총 결제 포인트 : <span id="p_price_span" style="font-size: 30px">${p_price}</span>&nbsp;포인트</label><br>
                <label for="name">구매 후 남은 포인트 : <span id="remaining_price_span" style="font-size: 20px"></span>&nbsp;포인트</label>
                </div>
                <button class="buy-button">구매</button>
            </c:when>
            <c:otherwise>
                <label for="name">보유 포인트가 부족합니다.</label>
                </div>
                <button class="nobuy-button" onclick="window.location.href='/customerpoint?point=${customerUserVO.buypoint}'">충전하기</button>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function (e){
        $(".buy-button").click(function (){
            if(${customerUserVO.buypoint <= 0}) {
                alert("\n보유 메소가 부족합니다.\n충전 후 이용해 주세요.")
            }else if (confirm("\n결제 후 3시간 이내 취소 요청 시 환불 처리되며, 3시간 이후에는 환불되지 않습니다.\n\n정말로 구매하시겠습니까?")) {
                let memo = $("#name").val();
                let p_price = $('#p_price_span').text();
                let startDate = $("#startDateDisplay").text();
                let endDate = $("#endDateDisplay").text();
                // AJAX 요청 생성
                $.ajax({
                    url: "/purchase", // 데이터를 전송할 서버의 URL
                    method: "POST", // 요청 메소드 (POST, GET 등)
                    data: { // 전송할 데이터
                        sno: ${productVO.sno},
                        pno: ${productVO.pno}, // 상품 ID
                        u_id: '${customerUserVO.u_id}',
                        p_name: '${productVO.p_name}',
                        memo: memo,
                        p_price: p_price,
                        startDate: startDate,
                        endDate: endDate
                    },
                    success: function (response) {
                        // 요청이 성공적으로 완료되었을 때의 처리
                        alert("구매가 완료되었습니다.");
                        window.location.href = "/product_board"; // 메인 페이지로 이동
                    },
                    error: function (xhr, status, error) {
                        // 요청이 실패하였을 때의 처리
                        alert("구매에 실패하였습니다. 다시 시도해주세요.");
                    }
                });
            }
        });
    });
</script>
<%@ include file="../footer/footer.jsp"%>
</html>
