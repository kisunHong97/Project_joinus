<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Title</title>
<%@ include file="../header/header.jsp"%>
  <style>
    /* 테이블 스타일 */
    table {
      border-collapse: collapse;
      width: 70%;
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

    /* 컨테이너 스타일 */
    .container {
      text-align: center;
      margin-bottom: 20px;
    }

    /* 버튼 스타일 */
    button {
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 500;
      font-size: 14px;
      padding: 10px 20px;
      border: none;
      background-color: #ff731b;
      color: white;
      cursor: pointer;
      margin-right: 10px;
    }

    button:hover {
      background-color: #ff6f84;
    }

    /* 비어있는 메시지 스타일 */
    .empty-message {
      text-align: center;
      margin-top: 20px;
      font-size: 14px;
      color: #888;
    }
    /* 총 구매 금액 스타일 */
    .total-price-container {
      text-align: center;
      margin-bottom: 20px;
      font-size: 16px;
      color: #888;
    }
  </style>

</head>
<body>
<div class="container">
  <table border="1">
    <thead>
    <tr>
      <th>상품번호</th>
      <th>상품내용</th>
      <th>수량</th>
      <th>금액</th>
      <th>선택</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${cart}" var="cart">
      <tr>
        <td>${cart.pno}</td>
        <td><a href='/board/read?pno=${cart.pno}'>${cart.product.p_content}</a></td>
        <td>${cart.quantity}</td>
        <td>
          <span class="total" data-price=${cart.product.p_price * cart.quantity}>${cart.product.p_price * cart.quantity}</span>
        </td>
        <td>
          <input type="checkbox" class="selectedItems" name="selectedItems" value="${cart.pno}">
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<%-- 장바구니가 비었을 때 메시지 표시 --%>
<c:if test="${empty cart}">
  <div class="empty-message">
    장바구니가 비었습니다.
  </div>
</c:if>
<br>
<c:if test="${!empty cart}">
  <div class="total-price-container">
    <p>총 구매 금액:
    <span id="totalPrice">0</span>
      원</p>
  </div>
  </c:if>
<div class="container">
  <div>
    <button onclick="deleteItems()">삭제</button>
    <button onclick="calculateTotal()">구매</button>
  </div>
</div>



</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function (){
    $(".selectedItems").on("change", function (){
      calculateTotalPrice();
    })
  })
  function calculateTotalPrice() {
    let totalPrice = 0;

    // 체크된 체크박스들의 가격 합산
    $(".selectedItems:checked").each(function() {
      const price = $(this).closest("tr").find(".total").data("price");
      console.log(price);
      totalPrice += price;
    });

    // 총 구매 금액 업데이트
    $("#totalPrice").text(totalPrice);
  }
</script>
<%@ include file="../footer/footer.jsp"%>
</html>
