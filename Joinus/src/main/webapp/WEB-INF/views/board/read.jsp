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

  <!-- slider stylesheet -->
  <link
          rel="stylesheet"
          type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
  />
  <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
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
  .tab {
    overflow: hidden;
      border-top: 1px solid #e7e7e7; /* 위쪽에 검은색 테두리 추가 */
      border-bottom: 2px solid black; /* 아래쪽에 검은색 테두리 추가 */
    background-color: #ffffff;
  }
  .tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
  }
  .tab button:hover {
    background-color: #ddd;
  }
  .tab button.active {
    background-color: #ffffff;
  }
  .tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
  }
  .plcc_banner img {
      display: block;
      width: 100%;
  }
  .plcc_banner img {
      vertical-align: top;
  }
  .plcc_banner img {
      border: 0 none;
  }
  .plcc_banner img {
      border: 0;
      -ms-interpolation-mode: bicubic;
  }
  .btnbasket{
      height: 50px;
      width: 248px;
      background-color: #ffffff;
      border: 1px solid #000000;
      font-weight: bold;

  }
  .btnpurchase{
      height: 50px;
      width: 248px;
      background-color: #ff731b;
      border: none;
      font-weight: bold;
      color: white;
  }
  .btnwarning{
      height: 50px;
      width: 50px;
      border:none;
      border-radius: 10px;
      background-color: #ffc59b;

  }
  .rating {
      display: inline-block;
  }

  .rating input {
      display: none;
  }

  .rating label {
      float: right;
      color: #aaa;
      font-size: 20px;
      padding: 0;
      cursor: pointer;
  }

  .rating label:before {
      content: '\2606'; /* 별 아이콘의 유니코드 값을 지정합니다 */
  }

  .rating input:checked ~ label {
      color: #ffcc00; /* 선택된 별의 색상을 지정합니다 */
  }

  .rating label:hover,
  .rating label:hover ~ label {
      color: #ffcc00; /* 마우스를 올렸을 때 별의 색상을 지정합니다 */
  }

  /* 별의 크기 및 간격을 조정할 수 있습니다 */
  .rating label {
      margin-right: 5px;
  }

  /* 선택된 별 이후의 별을 비활성화합니다 */
  .rating input:checked ~ label:before {
      content: '\2605';
  }
  .reviewContent{
      width: 1110px;
      border: 1px solid #c9c9c9;
  }
  .btnreview{
      width: 1110px;
      height: 60px;
      border: none;
      background-color: #ff731b;
      border-radius: 5px;
      font-size: 17px;
      color: white;
      font-weight: bold;
  }
  #qnaForm {
      margin-bottom: 20px;
  }

  #qnaTextarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      resize: vertical;
  }

  #qnaForm button {
      padding: 8px 16px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
  }

  #qnaForm button:hover {
      background-color: #45a049;
  }

  .inquiry {
      background-color: #f7f7f7;
      padding: 10px;
      margin-bottom: 10px;
      border-radius: 5px;
  }

  .inquiry p {
      margin: 0;
      padding: 0;
  }

  .inquiry-text {
      font-weight: bold;
  }

  .inquiry-date {
      color: #888;
      font-size: 12px;
  }
  .btn-inquiry{
      width: 560px;
      height: 60px;
      border: none;
      background-color: #ff731b;
      border-radius: 5px;
      font-size: 17px;
      color: white;
      font-weight: bold;
  }
  .reviewItem {
      border-top: 2px solid #ffcaab;
      border-bottom: 2px solid #ffcaab;
      padding: 10px 0;
      margin-bottom: 10px;

  }
  .star{
      color: #ff731b;
      font-weight: bold;
      font-size: 15px;
    }
  #inquiryButton{
      width: 100px;
      height: 40px;
      border: none;
      background-color: #ff731b;
      border-radius: 5px;
      font-size: 17px;
      color: white;
      font-weight: bold;
  }
  .divtag{
      display: inline-block;
      text-align: center;
      margin-left: 15px;
      margin-right: 15px;
      /*width: 50px;*/
  }
  .title{
      font-weight: bold;
      letter-spacing:-1px;
  }



</style>
<%@ include file="../header/header.jsp"%>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<body class="sub_page about_page">
<table id="datatable-scroller"
       class="table table-bordered tbl_Form">
  <tbody>
  <div class="container mt-5">
      <div class="row">
          <div class="col-md-6">
              <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                      <c:forEach items="${productVO.thumbnailList}" var="thumbnail" varStatus="status">
                          <c:if test="${status.index < 1}">
                              <div class="carousel-item active">
                                  <img src="/display?fileName=${thumbnail.uploadPath}/${thumbnail.uuid}_${thumbnail.fileName}" class="d-block w-100" width="50%" alt="...">
                              </div>
                          </c:if>
                          <c:if test="${status.index >= 1}">
                              <div class="carousel-item">
                                  <img src="/display?fileName=${thumbnail.uploadPath}/${thumbnail.uuid}_${thumbnail.fileName}"  class="d-block w-100" width="50%" alt="...">
                              </div>
                          </c:if>
                      </c:forEach>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                  </a>
              </div>
          </div>
      <div class="col-md-6">
          <div style="color: #8e8e8e">🏠︎ ${store.s_name}</div>
          <hr>
        <h4 id="productname" name="p_name">${productVO.p_name }</h4>
        <form>
          <div class="form-group">
            <label for="colorSelect">종류</label>
            <select class="form-control" id="colorSelect">
              <option>${productVO.p_category}</option>
            </select>
          </div>
          <div class="form-group">
            <label for="startDate">기간</label>
              <br>
              <c:if test="${productVO.p_type == 'fixed'}">
                  <input type="text" class="form-control" id="startDate" style="display: inline-block; width: 110px;" data-type="fixed" value="<fmt:formatDate value='${productVO.p_startDate}' pattern='yyyy-MM-dd' />">
                  <b style="display: inline-block; font-size: 25px; margin-right: 15px;">&nbsp&nbsp~</b>
                  <input type="text" class="form-control" id="endDate" style="display: inline-block; width: 110px;" data-type="fixed" value="<fmt:formatDate value='${productVO.p_endDate}' pattern='yyyy-MM-dd' />">

              </c:if>
              <c:if test="${productVO.p_type == 'free'}">
                  <input type="date" id="startDate" max="2099-12-31" data-type="free" class="period-startDate" style="width: 120px; margin-right: 15px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px;">
                  <b style="display: inline-block; font-size: 25px; margin-right: 15px;">~</b>
                  <input type="date" id="endDate" max="2099-12-31" data-type="free" class="period-endDate" style="width: 120px; margin-right: 15px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px;">
              </c:if>
          </div>
          <div class="form-group">
            <label for="totalPrice">총 가격</label>
            <input type="number" class="form-control" id="totalPrice" value="${productVO.p_price}" readonly>
          </div>
            <div class="plcc_banner">
                <img src="http://pics.auction.co.kr/vip/2022/2207_pc_vip_bn_img_01.png" alt="G마켓" 옥션="" 스마일카드="" 최대="" 2만원="" 혜택!="">
            </div>
            <br>
          <c:choose>
            <c:when test="${like == 1}">
              <button type="button" class="btnwarning" id="wishBtn" data-a='${productVO.pno}' data-b='${customerUserVO.u_id}' data-c='${productVO.p_name}' data-d='${productVO.p_category}'>❤️</button>
            </c:when>
            <c:otherwise>
              <button type="button" class="btnwarning" id="wishBtn" data-a='${productVO.pno}' data-b='${customerUserVO.u_id}' data-c='${productVO.p_name}' data-d='${productVO.p_category}'>🤍</button>
            </c:otherwise>
          </c:choose>

          <c:choose>
            <c:when test="${cart == 1}">
              <button type="button" class="btnbasket" id="cartBtn" data-c='${productVO.pno}' data-d='${customerUserVO.u_id}'>🛒</button>
            </c:when>
            <c:otherwise>
              <button type="button" class="btnbasket" id="cartBtn" data-c='${productVO.pno}' data-d='${customerUserVO.u_id}'>장바구니</button>
            </c:otherwise>
          </c:choose>
          <button type="button" id="buyBtn" class="btnpurchase">구매하기</button>
        </form>
      </div>

    </div>
    <br>
    <!-- 탭 버튼 -->
      <div class="tab">
          <button class="tablinks" onclick="openTab(event, 'product_info')">상품 상세 정보</button>
          <button class="tablinks" onclick="openTab(event, 'reviews')">구매후기</button>
          <button class="tablinks" onclick="openTab(event, 'qna')">상품문의</button>
          <button class="tablinks" onclick="openTab(event, 'refund')">환불</button>
      </div>
      <!-- 탭 내용 -->
      <div id="product_info" class="tabcontent">
          <h3 class="title">상품 상세 정보</h3>
          <img src="/display?fileName=${productVO.detail.uploadPath}/${productVO.detail.uuid}_${productVO.detail.fileName}">
      </div>

      <div id="reviews" class="tabcontent">
          <h3 class="title">리뷰 작성</h3>

          <form action="/review" method="post">
              <textarea class="reviewContent" name="review" rows="5" cols="50" placeholder="리뷰를 입력하세요"></textarea>
              <br>
              <div class="rating">
                  <span style="font-weight: bold;">평점:</span>
                  <input type="radio" id="star5" name="rating" value="5">
                  <label for="star5"></label>
                  <input type="radio" id="star4" name="rating" value="4">
                  <label for="star4"></label>
                  <input type="radio" id="star3" name="rating" value="3">
                  <label for="star3"></label>
                  <input type="radio" id="star2" name="rating" value="2">
                  <label for="star2"></label>
                  <input type="radio" id="star1" name="rating" value="1">
                  <label for="star1"></label>
              </div>
              <br>
              <button class="btnreview" type="submit">리뷰 등록</button>
              <input type="hidden" value="${productVO.pno}" id="productVOpno" name="pno">
              <input type="hidden" value="${productVO.p_name}" id="productVOp_name" name="p_name">
              <input type="hidden" value="${productVO.sno}"  name="sno">
          </form>
          <hr>
          <h3 class="title">후기</h3>
          <span id=reviewAverage style="font-weight: bold; font-size: 30px; color:#ff731b;">${avg}/5</span>
          <span style="color:#ff731b; font-weight: bold; ">(${listlength}개 후기)</span>
          <br>
          <br>
          <div id="reviewList">
              <c:forEach items="${productlist}" var="review">
                  <div class="reviewItem">
                      <div class="reviewInfo">
                          &nbsp;<span class="star" style="color: #ff731b;">
                            <script>
                        var rating = ${review.rating};
                        var stars = "";
                        for (var i = 1; i <= 5; i++) {
                            if (i <= rating) {
                                stars += '<span class="star">★</span>';
                            } else {
                                stars += '<span class="star">☆</span>';
                            }
                        }
                        document.write(stars);
                    </script></span>&nbsp;
                          <script>
                              var username = '${review.u_name}';
                              var maskedUsername = username.charAt(0) + '*'.repeat(username.length - 1);
                              document.write('<span style="color: #ff731b;">' + maskedUsername + '</span>');
                          </script>&nbsp;
                          <span style="color: #ff731b;">${review.sys_date}</span>

                      </div>
                      <br>
                      <div class="reviewContent" style="border: none"><span>&nbsp; ${review.review}</span></div>
                  </div>
              </c:forEach>

              <c:if test="${empty productlist}">
                  <div class="noReviews">작성한 리뷰가 없습니다.</div>
              </c:if>
          </div>

      </div>

      <div id ="qna" class="tabcontent">

          <h3  class="title" style="font-weight: bold; ">상품 문의</h3>
          <br>
          <div class="bigdiv" style="position: relative">
              <div class="divtag" style="width: 50px;">NO</div>
              <div class="divtag" style="width: 50px;">작성자</div>
              <div class="divtag" style="width: 300px;">제목</div>
              <div class="divtag" style="width: 50px;">날짜</div>
              <div class="divtag" style="width: 200px;">상태</div>
              <form action="/cinquiry" >
                  <input type="hidden" value="${productVO.pno}"  name="pno">
                  <input type="hidden" value="${productVO.p_name}"  name="p_name">
                  <input type="hidden" value="${productVO.sno}"  name="sno">
                  <%--                 <input type="hidden" value="${inquirylist.ino}"  name="ino">--%>
                  <button id="inquiryButton" style=" position: absolute; right: 20px; top: -8px;">문의하기</button>
              </form>
          </div>

          <div id="inquirylist">
              <hr>
              <c:forEach items="${inquirylist}" var="inquiry">
                  <div class="inquirywItem">
                      <div class="inquiryInfo">
                          <div class="divtag" style="width: 50px;">
                              &nbsp;<span class="ino" style="color: #ff731b;">
                             <input type="hidden" value="${inquiry.ino}"  name="ino">
                       ${inquiry.ino}
                         </span>&nbsp;</div>
                          <div class="divtag" style="width: 50px;"><span> ${inquiry.u_name}</span></div>
                          <div class="divtag" style="width: 300px;"><a id="inqua" href="/modifyinqu/ino=${inquiry.ino}/pno=${inquiry.pno}">🔒&nbsp;${inquiry.i_title}</a></div>
                          <div class="divtag" style="width: 50px;"><span style="color: #808080;">${inquiry.inquiry_date}</span></div>
                          <div class="divtag" style="width: 200px;"> <span style="color: #ff731b;">${inquiry.status}</span></div>
                          <input type="hidden" value="${inquiry.u_id}"  id="inquiryu_id">
                      </div>
                      <hr>
                  </div>
              </c:forEach>

              <c:if test="${empty inquirylist}">
                  <div class="noinquirylist">등록된 글이 없습니다.</div>
              </c:if>
          </div>


      </div>

      <div id="refund" class="tabcontent">
          <h3 class="title">환불</h3>
          <div>
              <strong>[환불 규정]</strong><br>
              <p>1. 티켓의 사용기한으로부터 10% 이내의 기간이 지난 경우, 환불이 불가능합니다.<br>
                  2. 환불을 원하는 경우, 구매자는 티켓판매점에 신속하게 문의해야 합니다.<br>
                  3. 환불 신청은 원본 영수증 또는 구매 확인서와 함께 제출되어야 합니다.<br>
                  4. 환불은 원래 결제 수단으로 환불되며, 원래 결제 금액에서 환불 수수료 또는 처리 수수료가 공제될 수 있습니다.<br>
                  5. 환불 가능한 금액은 티켓 가격에서 환불 수수료 또는 처리 수수료를 공제한 후의 잔액입니다.<br>
                  6. 티켓을 다른사람에게 양도하거나, 사용자가 다를 경우  환불이 거부될 수 있습니다.<br>
                  7. 티켓판매점은 단독으로 환불 규정을 변경하거나 취소할 권한을 가집니다. 변경된 환불 규정은 사전 공지 후 적용됩니다.</p>
              <br>
              <strong>[환불 요청]</strong><br>
              <p>- 마이페이지 -> 환불신청
                  - 구매자는 환불을 원하는 경우 가능한 빠르게 티켓판매점에 연락하여 환불 요청을 알려야 합니다.<br>
                  - 환불 요청은 구매한 티켓의 정보와 함께 전화, 이메일, 온라인 양식 등을 통해 제출될 수 있습니다.<br></p>
              <br>
              <strong>[환불 신청 검토]</strong><br>
              <p>- 티켓판매점은 환불 신청을 검토하고, 환불 가능 여부를 확인합니다.<br>
                  - 환불 신청이 접수되면 티켓의 상태와 구매 내역을 확인하고, 환불 조건을 적용하여 처리 여부를 결정합니다.<br></p>
              <br>
              <strong>[환불 승인]</strong><br>
              <p>- 환불 신청이 승인되면 티켓판매점은 구매자에게 환불 승인을 통지합니다.<br>
                  - 승인된 환불은 원래 결제 수단으로 환불됩니다.<br></p>
              <br>
              <strong>[환불 처리]</strong><br>
              <p>- 환불 처리 단계에서는 원래 결제 금액에서 환불 수수료 또는 처리 수수료를 공제한 후의 잔액이 구매자에게 환불됩니다.<br>
                  - 환불 처리 시간은 일반적으로 결제 수단과 환불 방법에 따라 다를 수 있습니다.<br></p>
              <br>
              <strong>[환불 완료]</strong><br>
              <p>- 환불이 성공적으로 완료되면 티켓판매점은 구매자에게 환불 완료를 통지합니다.<br>
                  - 구매자는 환불된 금액이 정상적으로 받아졌는지 확인해야 합니다.<br></p>
          </div>
      </div>
  </div>
  </div>
  </tbody>
    <input type="hidden" value="${customerUserVO.u_id}" id="u_id">
    <input type="hidden" value="${customerUserVO.u_name}" id="u_name" name="u_name">
    <input type="hidden" value="${list}" id="list">
    <input type="hidden" value="${customerUserVO}" id="customerUserVO">
    <input type="hidden" value="${productVO.pno}" id="productVO" name="pno">
    <input type="hidden" value="${productlist}" id="productlist" name="productlist">
    <input type="hidden" value="${businessUser.b_id}" id="b_id" name="b_id">
    <input type="hidden" value="${productsno}" id="sno" name="sno">
    <input type="hidden" value="${businessUser.bno}" id="bno" name="bno">
    <input type="hidden" value="${productfinalsno}" id="psno" name="psno">
    <%--       <input type="hidden" value="${prosno}" id="prosno" name="prosno">--%>
</table>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        console.log($("#b_id").val());
        console.log("으아아아아악!");
        console.log("호오?"+ $("#inquiryu_id").val())
        console.log("bno:"+$("#bno").val());
        console.log("sno:"+$("#sno").val());
        console.log("psno:"+$("#psno").val());



        $("#inqua").click(function() {
            if ($("#u_id").val() === "" && $("#b_id").val() === "") {
                alert("로그인 후 다시 시도해주세요!");
                return false;
            }
            if($("#u_id").val() !== ""){
                if ($("#u_id").val() !== $("#inquiryu_id").val() ) {
                    alert("문의글은 작성자만 볼 수 있습니다.");
                    return false;
                }
            }else if($("#bno").val() !== ""){
                if($("#sno").val() !== $("#psno").val()){
                    alert("현재 제품 판매자만 가능합니다.")
                    return false;
                }
            }else {
                return true;
            }
        });

    });
</script>
<script>
    var avgValue = ${avg}; // avg 값이 0인 경우 숨김 처리

    if (avgValue === 0) {
        var spanElement = document.getElementById("reviewAverage");
        spanElement.style.display = "none";
    }
</script>
<script type="text/javascript">
    console.log("일단 작동")
    $(document).ready(function() {
        console.log("일단 작동")
        console.log($("#productname").text())
        console.log($("#productlist").val())
        console.log($("#u_id").val())
        console.log("뜨나요??" + $("#b_id").val());
        $(".btnreview").click(function (){
            if($("#u_id").val()=="") {
                if($("#u_id").val()=="" && $("#b_id").val()==""){
                    alert("로그인 후 가능합니다.")
                    return false;
                }else if($("#u_id").val()=="" && $("#b_id").val()!=""){
                    alert("사업자는 리뷰 등록이 불가능합니다.")
                    return false;
                }
            }else if($(".reviewContent").val().length <10 && $(".reviewContent").val()!=""){
                alert("리뷰는 10자 이상 작성해주세요")
                return false;
            }else if ($(".reviewContent").val()==""){
                alert("리뷰를 입력해주세요");
                return false;
            }else if($("#list").val().indexOf($("#productname").text()) === -1) {
                alert("구매한 고객만 리뷰 등록이 가능합니다.")
                return false;
            }else if($("#productlist").val().indexOf($("#u_id").val()) !== -1){
                alert("리뷰작성은 한번만 가능합니다.")
                return false;
            } else if ($('input[name="rating"]:checked').length === 0) {
                alert("평점을 선택해주세요.");
                return false;
            } else {
                var confirmation = confirm("리뷰를 등록하시겠습니까?");
                if (confirmation) {
                    alert("리뷰가 등록되었습니다.");
                    return true;
                } else {
                    return false;
                }
            }
        })
    });

</script>
<script>
  function openNav() {
    document.getElementById("myNav").classList.toggle("menu_width");
    document
            .querySelector(".custom_menu-btn")
            .classList.toggle("menu_btn-style");
  }
  $(document).ready(function () {
      console.log("문의글 등록버튼")
      $('#inquiryButton').click(function () {
          if($("#u_id").val()=="" && $("#b_id").val() == ""){
              alert("로그인 후 가능합니다.")
              return false;
          }else if($("#u_id").val() =="" && $("#b_id").val() != ""){
              alert("사업자는 문의글 등록을 할 수 없습니다.")
              return false;
          }else {
              return true;
          }

      });
  });
</script>
<script>
    // 페이지 로드 시 첫 번째 탭을 활성화
    document.addEventListener('DOMContentLoaded', function() {
        openTab(event, 'product_info');
    });

    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>
<script>
    $(document).ready(function(e) {
        $('#endDate').on("change", function() {
            var startDate = new Date($("#startDate").val());
            var endDate = new Date($(this).val());
            var day = (endDate - startDate) / (1000 * 60 * 60 * 24); // 일 단위로 계산
            var totalPrice = (day+1) * ${productVO.p_price};
            console.log(totalPrice)
            $("#totalPrice").val(totalPrice);
        });
    });
</script>
<script>
    // 로그인 여부 확인 함수
  function isLoggedIn() {
    // 로그인 여부를 확인하는 코드 작성
    // 로그인되어 있으면 true 반환, 아니면 false 반환
    // 예시:
      if (${customerUserVO == null || customerUserVO.u_id == null}) {
      return false;
    } else {
      return true;
    }
  }
  $(document).ready(function (e) {
    $('#wishBtn').click(function (e) {
      var data_like = $("#wishBtn").text()
      // console.log("data_like : " + data_like)
      let f1 = $('#wishBtn').data('a');
      let f2 = $('#wishBtn').data('b');
      // p_name, p_category 추가
      let p_name = $('#wishBtn').data('c');
      let p_category = $('#wishBtn').data('d');

      var flag = false
      if(data_like == "❤️"){
        deleteWishlist();
        if (($("#customerUserVO") != null || $("#u_id") != null)){
          flag = !flag
          $('#wishBtn').text("🤍");
          console.log('여기는 삭제');
        }
      } else {
        addWishlist(f1, f2, p_name, p_category);
        if (($("#customerUserVO") != null || $("#u_id") != null)){
          flag = !flag
          $('#wishBtn').text("❤️");
          console.log('여기는 추가');
        }
      }
    });
  });
  function addWishlist(pno, u_id, p_name, p_category) {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }
      $.ajax({
          type: 'POST',
          url: "/wishlist/add",
          data: {
              pno,
              u_id,
              p_name,
              p_category
          },
          success: function(data) {
              alert("찜 목록에 추가되었습니다.");
          },
          error: function(request, status, error) {
              console.log("에러")
              alert(error);
          }
      });
  }

  function deleteWishlist() {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    $.ajax({
      type: "GET",
      url: "/wishlist/delete?pno="+${productVO.pno},
      success: function(data) {
        console.log("삭제 들어오나");
        alert("찜 목록에서 삭제되었습니다.");
      },
      error: function (xhr, status, error) {
        alert(error);
      },
    });
  }
</script>
<script>
  $(document).ready(function (e) {
    $('#cartBtn').click(function (e) {
    if (${productVO.p_type == 'free'}){
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;

        if (startDate === "" || endDate === "") {
            alert("기간을 선택해주세요.");
        } else {
            var data_cart = $("#cartBtn").text()
            // console.log("data_like : " + data_like)
            var f3 = $('#cartBtn').data('c');
            var f4 = $('#cartBtn').data('d');
            var f5 = $('#totalPrice').val();
            var f6 = $("#startDate").val();
            var f7 = $("#endDate").val();
            console.log(f5,f6,f7)
            var flag = false
            if(data_cart == "🛒"){
                deleteCart();
                if ($("#customerUserVO") != null || $("#u_id") != null){
                    flag = !flag
                    $('#cartBtn').text("장바구니담기");
                    console.log('여기는 삭제');
                }
            } else {
                addCart(f3, f4, f5, f6, f7);
                if ($("#customerUserVO") != null || $("#u_id") != null){

                    flag = !flag
                    $('#cartBtn').text("🛒");
                    console.log('여기는 추가');
                }
            }
        }
    }

    });
  });
  function addCart(pno, u_id, c_price, c_startDate, c_endDate) {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    var start = "";
    var end = "";

      $("#startDate").each(function(idx, input) {
          if ($(input).data("type") === "free" || $(input).data("type") === "fixed") {
              var date = c_startDate.split("-");
              start = date[0] + "년 " + date[1] + "월 " + date[2] + "일";
          } else {
              start = c_startDate;
          }
      });

      $("#endDate").each(function(idx, input) {
          if ($(input).data("type") === "free" || $(input).data("type") === "fixed") {
              var date = c_endDate.split("-");
              end = date[0] + "년 " + date[1] + "월 " + date[2] + "일";
          } else {
              end = c_endDate;
          }
      });
      var cartData = {
          'pno': pno,
          'u_id': u_id,
          'c_price': c_price,
          'c_startDate': start,
          'c_endDate': end,
      }
    $.ajax({
      type: 'POST',
      url: "/cart/add",
        data: JSON.stringify(cartData),
        contentType: "application/json; charset=utf8",
      success: function(data) {
        alert("장바구니에 추가되었습니다.");
      },
      error: function(request, status, error) {
        console.log("에러")
        alert(error);
      }
    });
  }


  function deleteCart() {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    $.ajax({
      type: "GET",
      url: "/cart/delete?pno="+${productVO.pno},
      success: function(data) {
        console.log("삭제 들어오나");
        alert("장바구니에서 삭제되었습니다.");
      },
      error: function (xhr, status, error) {
        alert(error);
      },
    });
  }
</script>
<script>
    $(document).ready(function() {
        $("#buyBtn").click(function() {
            if (!isLoggedIn()) {
                alert("로그인 후 이용해주세요.");
                return;
            }
            if (${productVO.p_type == 'free'}){
                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;

                if (startDate === "" || endDate === "") {
                    alert("기간을 선택해주세요.");
                } else {
                    var pno = $("#productVO").val();
                    var p_price = $('#totalPrice').val();
                    var startDate = $("#startDate").val(); // 선택된 시작 날짜
                    var endDate = $("#endDate").val(); // 선택된 종료 날짜
                    var url = "/board/buy?pno=" + pno + "&startDate=" + startDate + "&endDate=" + endDate + "&p_price=" + p_price; // 구매 페이지 URL에 선택된 날짜와 가격을 추가합니다.
                    window.location.href = url;
                }
            }
        });
    });
</script>
</body>
<%@ include file="../footer/footer.jsp"%>

</html>