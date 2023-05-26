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
  .inquiry {
    display: flex;
    justify-content: center;
  }

  .inquiry > div {
    width: 1100px;
    height: 700px;
    position: relative;
  }
  #inquiryList {
    margin-left: 400px;
  }
  .divtag{
    display: inline-block;
    text-align: center;
    margin-left: 15px;
    margin-right: 15px;
    /*width: 50px;*/
  }
  .inquiryItem {
    border-top: 2px solid #ffcaab;
    border-bottom: 2px solid #ffcaab;
    padding: 0px 0;
    margin-bottom: 10px;

  }
  .date {
    position: absolute;
    right: 0;/* 원하는 만큼의 오프셋 값을 설정하세요 */
  }
</style>


<body>


<div class="inquiry" style="display: block;">
  <br>
  <br>
  <div id="inquiryList">
    <div>

      <span><h1 style="font-weight: 900; letter-spacing:-1px; display: block; margin-top: -20px">문의 내역</h1></span>
    </div>
    <br>
    <c:forEach items="${inqulist}" var="list" varStatus="loop">
      <div class="inquiryItem">
        <div class="inquiryInfo" style="height: 35px; display: block; margin-top: 6px">
          <div class="divtag">
        <span class="star" style="color: #ff731b; width: 50px">
            ${loop.index + 1}
        </span>
          </div>
          <div class="divtag" style="width: 100px; text-align: center;">
            <a href="board/read?pno=${list.pno}" class="p_name">${list.p_name}</a>
          </div>
          <div class="divtag" style="width: 35px;">
            <span class="u_name">${list.u_name}</span>
          </div>
          <div class="divtag" style="width: 600px;">
            <span class="i_title">${list.i_title}</span>
          </div>
          <div class="divtag" style="width: 100px;">
            <a href="/modifyinqu/ino=${list.ino}/pno=${list.pno}" class="status">[${list.status}]</a>
          </div>
          <span class="date" style="color: #ff731b;">${list.inquiry_date}</span>
        </div>
      </div>
    </c:forEach>

    <c:if test="${empty inqulist}">
      <br>
      <div class="noReviews" style="text-align: center; margin-left: 100px">고객이 작성한 문의글이 없습니다.</div>
    </c:if>
  </div>

  <br>
</div>
</body>
<%@ include file="../footer/footer.jsp"%>
</html>
