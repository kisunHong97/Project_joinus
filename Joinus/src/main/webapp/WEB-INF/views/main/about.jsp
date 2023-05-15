<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Site Metas -->
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Energym</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
    />

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css" />

    <!-- fonts style -->
    <link
            href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
            rel="stylesheet"
    />
    <!-- Custom styles for this template -->
    <link href="../../../resources/css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="../../../resources/css/responsive.css" rel="stylesheet" />
</head>
  <style>
    h2 {
      text-align: center;
    }
    table {
      width: 100%;
    }
    #outter {
      display: block;
      width: 60%;
      margin: auto;
    }
    a {
      text-decoration: none;
    }
    .board {
      width: 100%;
    }

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
      width: calc(33.33% - 20px);
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

  </style>
  <script>
    function selChange() {
      var sel = document.getElementById('cntPerPage').value;
      location.href="product_board?nowPage=${paging.nowPage}&cntPerPage="+sel;
    }
  </script>

  <%@ include file="../header/header.jsp"%>

  <body class="sub_page about_page">
    <!-- about section -->
    <section class="about_section layout_padding">
      <div id="outter">
        <div style="float: right;">
          <select id="cntPerPage" name="sel" onchange="selChange()">
            <option value="5"
                    <c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
            <option value="10"
                    <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
            <option value="15"
                    <c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
            <option value="20"
                    <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
          </select>
        </div>
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
                              <a href='/board/read?pno=${productList[status.index].pno}'>${productList[status.index].p_subtitle }</a>
                          </div>
                      </li>
                  </c:forEach>
              </ul>
            </div>
          </div>

        </table>
        <input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'"><br>

        <div style="display: block; text-align: center;">
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
          <c:if test="${paging.endPage != paging.lastPage}">
            <a href="/product_board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
          </c:if>
        </div>
      </div>
    </section>
    <script>
      function openNav() {
        document.getElementById("myNav").classList.toggle("menu_width");
        document
          .querySelector(".custom_menu-btn")
          .classList.toggle("menu_btn-style");
      }
    </script>
  </body>

    <%@ include file="../footer/footer.jsp"%>

</html>
