<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

  <title>Energym</title>
  <link href="../../../resources/css/logincss.css" rel="stylesheet" />
</head>
<%@ include file="../header/header.jsp"%>
<style>
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}


  .divmain{
    width: 1000px;
    height: 700px;
    margin-left: 500px;

  }
  .form-container {
    max-width: 800px;
    /*margin: 0 auto;*/
  }

  .form-group {
    margin-bottom: 20px;
  }

  label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
  }

  .input,
  textarea {
    width: 800px;
    /*width: 100%;*/
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  textarea{
    height: 250px;
  }

  .button {
    background-color: #ff731b;
    border: none;
    color: white;
    width: 100px;
    height: 30px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
    float: right;
  }
  .button1 {
    background-color: #ff731b;
    border: none;
    color: white;
    width: 100px;
    height: 30px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
    float: right;
  }
  .divmain1{
    width: 1000px;
    height: 350px;
    margin-left: 500px;

  }

</style>
<body>
<br>

<div class="divmain">
  <h1 style="font-weight: bold">문의글 <span style="font-size: 15px" class="small">NO.${inquiryVO.ino}</span></h1>
  <br>
  <div class="form-container">
    <form action="/inquirymodify/ino=${inquiryVO.ino}" method="get">
      <input type="hidden" value="${inquiryVO.pno}" name="pno">
      <input type="hidden" value="${inquiryVO.sno}" name="sno">
      <div class="form-group">
        <label for="i_title">제목:</label>
        <input class="input" type="text"  value="${inquiryVO.i_title}" id="i_title" name="i_title" required readonly>
      </div>
      <div class="form-group">
        <label for="u_name">작성자:</label>
        <input class="input" type="text" value="${inquiryVO.u_name}" id="u_name" name="u_name" required readonly>
      </div>
      <div class="form-group">
        <label for="p_name">제품:</label>
        <input class="input" type="text" value="${inquiryVO.p_name} "id="p_name" name="p_name" required readonly>
      </div>
      <div class="form-group">
        <label for="u_inquiry">문의글:</label>
        <textarea class="input" id="u_inquiry"  name="u_inquiry" rows="5" readonly required>${inquiryVO.u_inquiry}</textarea>
      </div>
      <button class="button" type="submit">문의글 수정</button>
    </form>

  </div>
</div>
<hr>
<div class="divmain1">
  <div class="form-container">


    <h4 class="title">문의글 답변</h4>
    <hr style="border: 1px solid;">

    <div id="reviewList">
      <c:if test="${not empty b_answerVO}">
        <div class="b_answerItem">
          <br>
          <div class="b_answerContent" style="border: none"><span>&nbsp; ${b_answerVO.b_answer}</span></div>
          <br>
          <div style=" text-align: right; color: #a9a9a9">${b_answerVO.sys_date}</div>
        </div>
        <hr style="border: 1px solid #dadada;">
      </c:if>

      <c:if test="${empty b_answerVO}">
        <div class="noAnswer">답변이 없습니다.</div>
      </c:if>
    </div>
    <br>
    <br>
    <c:choose>
      <c:when test="${not empty businessUser}">
        <c:choose>
          <c:when test="${not empty b_answerVO}">
            <!-- ${b_answerVO}가 존재하는 경우 -->
          </c:when>
          <c:otherwise>
            <!-- ${b_answerVO}가 없는 경우 -->
            <form action="/b_answer" method="post">
              <input type="hidden" name="ino" value="${inquiryVO.ino}">
              <input type="hidden" value="${inquiryVO.pno}" name="pno">
              <input type="hidden" value="${inquiryVO.sno}" name="sno">
              <textarea style="height: 150px" class="b_answerContent" name="b_answer" rows="5" cols="50" placeholder="답변 등록"></textarea>
              <br>
              <br>
              <button class="button1" type="submit">답변 등록</button>
            </form>
          </c:otherwise>
        </c:choose>
      </c:when>
    </c:choose>
    <%--  <c:if test="${not empty businessUser}">--%>
    <%--    <form action="/b_answer" method="post">--%>
    <%--      <input type="hidden" name="ino" value="${inquiryVO.ino}">--%>
    <%--      <input type="hidden" value="${inquiryVO.pno}" name="pno">--%>
    <%--      <textarea style="height: 150px" class="b_answerContent" name="b_answer" rows="5" cols="50" placeholder="답변 등록"></textarea>--%>
    <%--      <br>--%>
    <%--      <br>--%>
    <%--      <button class="button1" type="submit">답변 등록</button>--%>
    <%--    </form>--%>
    <%--  </c:if>--%>
  </div>
</div>
<br>
<br>
<%@ include file="../footer/footer.jsp"%>
</body>
</html>

<script>


</script>

