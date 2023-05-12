<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />

  <!-- fonts style -->
  <link
          href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
          rel="stylesheet"
  />
  <!-- Custom styles for this template -->
  <link href="resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="resources/css/responsive.css" rel="stylesheet" />
  <link href="resources/css/productRegister.css" rel="stylesheet" />
</head>
<%@ include file="../header/header.jsp"%>
<body>
<div class="main" style="margin: 0 auto">
  <h1 class="logo">상품 등록</h1>
  <form action="register" method="post">
    <div class="container">
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
          <div class="col-md-4">
            <h5 class="card-title">상품명</h5>
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <input type="text" placeholder="상품명" id="p_name" name="p_name"/>
            </div>
          </div>
        </div>
      </div><%-- 상품명 태그 종료 --%>
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
          <div class="col-md-4">
            <h5 class="card-title">소개글</h5>
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <input type="text" placeholder="소개글" id="p_subtitle" name="p_subtitle"/>
            </div>
          </div>
        </div>
      </div><%-- 소개글 태그 종료 --%>
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
          <div class="col-md-4">
            <h5 class="card-title">기간</h5>
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <select name="p_period" id="p_period">
                <option value="">-- 기간 선택 --</option>
                <option value="2023-05-03~2023-06-03">한달</option>
                <option value="2023-05-03~2023-08-03">세달</option>
                <option value="2023-05-03~2024-05-03">일년</option>
              </select>
            </div>
          </div>
        </div>
      </div><%-- 기간 태그 종료 --%>
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
          <div class="col-md-4">
            <h5 class="card-title">카테고리</h5>
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <select name="p_category" id="p_category">
                <option value="">-- 카테고리 선택 --</option>
                <option value="food">FOOD</option>
                <option value="academy">ACADEMY</option>
                <option value="physical fitness">PHYSICAL FITNESS</option>
                <option value="traffic">TRAFFIC</option>
              </select>
            </div>
          </div>
        </div>
      </div><%-- 소개글 태그 종료 --%>
    </div> <%--  컨테이너 끝 --%>
    <button type="submit" class="btn btn-primary">다음</button>
    <button type="submit" class="btn btn-danger">취소</button>
  </form>
</div>
<%@ include file="../footer/footer.jsp"%>
<script src="script.js">
  console.log(b_id);
  console.log(b_pwd1);
</script>
</body>
</html>
