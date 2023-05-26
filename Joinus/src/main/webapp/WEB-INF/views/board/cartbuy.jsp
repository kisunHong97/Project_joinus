<%@ page import="com.ezen.joinus.vo.ProductVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    <c:forEach items="${combinedList}" var="combinedItem" varStatus="loop">
        <div class="product-info">
            <p>상품 설명 : ${combinedItem.productVO.p_inst}</p>
            <p>이용 기간: ${combinedItem.cartVO.c_startDate} ~ ${combinedItem.cartVO.c_endDate} </p>
            <p>가격: ${combinedItem.cartVO.c_price}메소</p>
            <p>보유 포인트 : ${customerUserVO.buypoint}메소</p>
        </div>
        <div class="customer-info">
            <label for="name${loop.index}">요청사항 : </label>
            <input type="text" id="name${loop.index}" name="memo" placeholder="전달할 요청사항을 입력하세요" style="width: 500px;">
            <hr>
        </div>
    </c:forEach>

        <c:set var="total" value = "0" />
        <c:forEach items="${cartVOList}" var="cartVO">
            <c:set var="total" value="${total + cartVO.c_price}"/>
        </c:forEach>
    <div class="customer-info">
        <c:choose>
            <c:when test="${total <= customerUserVO.buypoint}">
            <label>총 결제금액: ${total}메소</label><br>
            <label>구매 후 남은금액: ${customerUserVO.buypoint - total}메소</label>
            </div>
            <button class="buy-button">구매</button>
            </c:when>
            <c:otherwise>
            <label>보유 메소가 부족합니다</label>
            </div>
            <button class="buy-button" type="submit">구매</button>
            </c:otherwise>
        </c:choose>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>
    function getCurrentTime() {
        var now = new Date();
        now.setHours(now.getHours() + 9); // 현재 시간에 9시간을 더함
        return now; // 현재 시간을 반환
    }
    $(document).ready(function (e){
        $(".buy-button").click(function (){
            if(${customerUserVO.buypoint <= 0}) {
                alert("\n보유 메소가 부족합니다.\n충전 후 이용해 주세요.")
            } else if (confirm("\n결제 후 3시간 이내 취소 요청 시 환불 처리되며, 3시간 이후에는 환불되지 않습니다.\n\n정말로 구매하시겠습니까?")) {
                var productList = [];
                var currentTime = getCurrentTime();
                console.log("현재 시간 : " + currentTime)

                <c:forEach items="${combinedList}" var="combinedItem" varStatus="loop">
                    var memo = $("#name" + ${loop.index}).val();
                    var product = {
                        sno: ${combinedItem.productVO.sno},
                        pno: ${combinedItem.productVO.pno},
                        u_id: '${customerUserVO.u_id}',
                        p_name: '${combinedItem.productVO.p_name}',
                        p_price: ${combinedItem.cartVO.c_price},
                        memo: memo,
                        buyTime : currentTime,
                        startDate: '${combinedItem.cartVO.c_startDate}',
                        endDate: '${combinedItem.cartVO.c_endDate}'
                    };
                    productList.push(product);
                </c:forEach>

                var data = {
                    productList: productList
                };
                console.log(productList)
                $.ajax({
                    type: "POST",
                    url: "/cartPurchase",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf8",
                    success: function(response) {
                        console.log(response);
                        alert("구매가 완료되었습니다.");
                        window.location.href = "/product_board"; // 메인 페이지로 이동
                    },
                    error: function(xhr, status, error) {
                        console.log(error);
                        alert("구매에 실패하였습니다. 다시 시도해주세요.");
                    }
                });
            }
        });
    });

</script>


<%@ include file="../footer/footer.jsp"%>
</html>
