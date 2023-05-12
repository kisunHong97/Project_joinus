<%--
  Created by IntelliJ IDEA.
  User: b14
  Date: 2023-05-04
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <title>Title</title>
</head>
<%@ include file="../header/header.jsp"%>
<style>
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
  @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

  body{margin-top:20px;}
  .avatar{
    width:200px;
    height:200px;
  }
</style>
</head>
<body>
<br>
<div class="container bootstrap snippets bootdey">
  <h1 class="text-primary">Edit Profile</h1>
  <hr>
  <div class="row">
    <!-- left column -->
    <div class="col-md-3">
      <div class="text-center">
        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="avatar img-circle img-thumbnail" alt="avatar">
      </div>
    </div>

    <!-- edit form column -->
    <div class="col-md-9 personal-info">
      <div class="alert alert-info alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a>
        <i class="fa fa-coffee"></i>
        This is an <strong>.alert</strong>. Use this to show important messages to the user.
      </div>
      <h3>Personal info</h3>

      <form class="form-horizontal" role="form">
        <div class="form-group">
          <label class="col-lg-3 control-label">이름</label>
          <div class="col-lg-8">
            <input class="form-control" type="text" value="dey-dey">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">아이디</label>
          <div class="col-lg-8">
            <input class="form-control" type="text" value="bootdey">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">비밀번호</label>
          <div class="col-lg-8">
            <input class="form-control" type="text" value="">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">이메일</label>
          <div class="col-lg-8">
            <input class="form-control" type="text" value="janesemail@gmail.com">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">휴대폰 번호</label>
          <div class="col-lg-8">
            <input class="form-control" type="text" value="010-2980-5237">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">주소</label>
          <div class="col-lg-8">
            <input class="form-control" type="text" value="안양시 만안구">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<hr>
</body>
<%@ include file="../footer/footer.jsp"%>
</html>
