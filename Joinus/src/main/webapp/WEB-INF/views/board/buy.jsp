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
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

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

        .buy-button {
            display: inline-block;
            background-color: #ed969e;
            color: #ffffff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .buy-button:hover {
            background-color: #ff6f84;
        }
    </style>
</head>
<%@ include file="../header/header.jsp"%>
<body>
<div class="container">
    <h1>상품 구매 페이지</h1>
    <div class="product-info">
        <p>상품 설명 : ${productVO.p_subtitle}</p>
        <p>이용 기간 : ${productVO.p_period}개월</p>
    <p>이용 기간:
        <%
            ProductVO productVO = (ProductVO) request.getAttribute("productVO"); // 컨트롤러에서 전달된 productVO 객체 가져오기
            java.util.Calendar cal = java.util.Calendar.getInstance();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy년 MM월 dd일");
            String currentDate = sdf.format(cal.getTime());
            cal.add(java.util.Calendar.MONTH, productVO.getP_period()); // productVO에서 p_period 가져오기
            cal.add(java.util.Calendar.DAY_OF_MONTH, -1); // 딱 한 달째 되는 날의 하루 전으로 설정
            String futureDate = sdf.format(cal.getTime());
            out.println(currentDate + " ~ " + futureDate);
        %>

    </p>
        <p>가격: ${productVO.p_price}메소</p>
        <p>보유 포인트 : ${customerUserVO.buypoint}메소</p>

    </div>
    <div class="customer-info">
        <label for="name">요청사항 : </label>
        <input type="text" id="name" name="memo" placeholder="전달할 요청사항을 입력하세요" style="width: 500px;">
        <hr>
        <c:choose>
            <c:when test="${productVO.p_price <= customerUserVO.buypoint}">
                <label for="name">총 결제금액: ${productVO.p_price}메소</label><br>
                <label for="name">구매 후 남은금액: ${customerUserVO.buypoint - productVO.p_price}메소</label>
                </div>
                <button class="buy-button">구매</button>
            </c:when>
            <c:otherwise>
                <label for="name">보유 메소가 부족합니다ㅋㅋ.</label>
                </div>
                <button class="buy-button">구매</button>
            </c:otherwise>
        </c:choose>
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
                <%--let currentDate = new Date('<%=currentDate%>');--%>
                <%--let futureDate = new Date('<%=futureDate%>');--%>

                // AJAX 요청 생성
                $.ajax({
                    url: "/purchase", // 데이터를 전송할 서버의 URL
                    method: "POST", // 요청 메소드 (POST, GET 등)
                    data: { // 전송할 데이터
                        <%--sno: ${}--%>
                        pno: ${productVO.pno}, // 상품 ID
                        u_id: '${customerUserVO.u_id}',
                        p_name: '${productVO.p_name}',
                        p_period: ${productVO.p_period},
                        memo: memo,
                        p_price: ${productVO.p_price},
                        currentDate : '<%=currentDate%>',
                        futureDate : '<%=futureDate%>'
                    },
                    success: function (response) {
                        // 요청이 성공적으로 완료되었을 때의 처리
                        alert("구매가 완료되었습니다.");
                        // window.location.href = "/purchase-success"; // 구매 완료 페이지로 이동
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
