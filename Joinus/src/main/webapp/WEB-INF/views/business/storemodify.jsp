<%--
  Created by IntelliJ IDEA.
  User: b14
  Date: 2023-05-04
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
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

  body{margin-top:20px;}
  .avatar{
    width:200px;
    height:200px;
  }

  .main{
    margin-left: 180px;
  }
  .form-horizontal{
    width: 600px;
    margin-left: 300px;
  }
  .text{
    color: #ff731b;
  }
  .btn1{
    width:120px;
    height: 30px;
    font-size:15px;
    background-color: #ff731b;
    color:#fff;
    border:none;
    cursor: pointer;
    border-radius: 5px;
    outline: none;

  }
  .btn{
    width:140px;
    height: 40px;
    font-size:15px;
    background-color: #ff731b;
    color:#fff;
    border:none;
    cursor: pointer;
    border-radius: 5px;
    margin-left: 240px;

  }
  .size1{
    width:245px;
    height:35px;
    padding-left:10px;
    background-color: #ffffff;
    /* margin-left:10px; */
    border:1px solid #d0d0d0;
    border-radius: 5px;
    outline: none;
  }
  .size1:focus{
    box-shadow: 0 0 5px 0 #38c7ff;
  }



</style>
</head>
<body>
<br>
<div class="container bootstrap snippets bootdey">
  <div class="main">
    <h1 class="text">개인정보 확인</h1>
    <hr>
    <div class="row">
      <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a>
          <i class="fa fa-coffee"></i>
          아이디 수정은 <strong>불가능</strong>합니다.
        </div>
        <h3>Store info</h3>
        <%--        <div class="col-md-3">--%>
        <%--          <div class="text-center">--%>
        <%--            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="avatar img-circle img-thumbnail" alt="avatar">--%>
        <%--          </div>--%>
        <%--        </div>--%>
        <form class="form-horizontal" role="form" method="post" action="/storeinfomodify">

          <div class="form-group">
            <label class="col-lg-3 control-label">스토어 이름</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${storeinformation.s_name}" id="s_name" name="s_name" >
              <div><span id="id_feedback" style="font-size: 12px;"></span></div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">스토어 소개글</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${storeinformation.s_inst}" name="s_inst" >
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">스토어 이메일</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${storeinformation.s_email}" name="s_email">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">스토어 URL</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${storeinformation.s_URL}" name="s_URL">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">스토어 전화번호</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${storeinformation.s_phone}" name="s_phone" >
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">스토어 주소</label>
            <div class="col-lg-8">
              <input type="text" class="size1" value="${storeinformation.s_addrCode}" id="addr1" name="s_addrCode">
              <button type="button" class="btn1"  onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
              <input class="form-control" type="text" value="${storeinformation.s_addrStreet}" id="addr2" name="s_addrStreet">
              <input class="form-control" type="text" value="${storeinformation.s_addrDetail}" id="addr3" name="s_addrDetail">
            </div>
          </div>
          <div class="button">
          <p>
            <input type="submit" value="수정" class="btn">
          </p>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
<hr>
</form>
</body>

<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

  $('#s_name').keyup(function (){
    let s_name = $('#s_name').val();
    $.ajax({
      url:"/s_nameCheck?s_name="+s_name,
      type:'GET',
      dataType: 'json',
      success : function (result){

        if(result == 1){
          $("#id_feedback").html('이미 사용중인 이름입니다.');
          $("#id_feedback").css('color','#dc3545');
        }else {
          $("#id_feedback").html('사용할 수 있는 이름입니다.');
          $("#id_feedback").css('color','#2fb380');
        }
      },
      error:function (){
        alert('서버요청실패');
      }
    })
  })
</script>


</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
  function execPostCode() {
    new daum.Postcode({
      oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
          extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
          extraRoadAddr = ' (' + extraRoadAddr + ')';
        }
        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
        if(fullRoadAddr !== ''){
          fullRoadAddr += extraRoadAddr;
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        console.log(data.zonecode);
        console.log(fullRoadAddr);


        $("[name=addr1]").val(data.zonecode);
        $("[name=addr2]").val(fullRoadAddr);

        document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
        document.getElementById('addr2').value = fullRoadAddr;
      }
    }).open();
  }


</script>
