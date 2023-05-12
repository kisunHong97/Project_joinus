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
        color: #ff3b85;
    }
    .btn1{
        width:120px;
        height: 30px;
        font-size:15px;
        background-color: #ff4567;
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
        background-color: #ff4567;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;
        margin-left: 240px;

    }
    .btndelete{
        width:130px;
        height: 27px;
        font-size:14px;
        background-color: #8d8d8d;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;
        margin-left: 1110px;
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
                    This is an <strong>.alert</strong>. 수정할꺼양?
                </div>
                <h3>Personal info</h3>
                <%--        <div class="col-md-3">--%>
                <%--          <div class="text-center">--%>
                <%--            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="avatar img-circle img-thumbnail" alt="avatar">--%>
                <%--          </div>--%>
                <%--        </div>--%>
                <form class="form-horizontal" role="form" method="post" action="/binfomodify">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">이름</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${businessvo.b_name}" name="b_name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">아이디</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${businessvo.b_id}" name="b_id" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">비밀번호</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="password" value="${businessvo.b_pwd}" name="b_pwd" id="b_pwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">비밀번호 확인 *</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="password" value="${businessvo.b_pwd}" name="b_pwd1" id="b_pwd1">
                            <span id="result" style="font-size: 12px;"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">이메일</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${businessvo.b_email}" name="b_email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">휴대폰 번호</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="${businessvo.b_phone}" name="b_phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">주소</label>
                        <div class="col-lg-8">
                            <input type="text" class="size1" value="${businessvo.b_addresscode}" id="addr1" name="b_addresscode">
                            <button type="button" class="btn1"  onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                            <input class="form-control" type="text" value="${businessvo.b_addressStreet}" id="addr2" name="b_addressStreet">
                            <input class="form-control" type="text" value="${businessvo.b_addressDetail}" id="addr3" name="b_addressDetail">
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
<div class="button">
    <p>
    <form action="/businessdelete" method="get">
        <input type="submit" value="회원탈퇴" class="btndelete">
    </form>
    </p>
</div>
</form>
</body>

<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    /* 자바 스크립트 함수 선언(비밀번호 확인) */
    $('#b_pwd1').keyup(function (){

        var b_pwd1 = $('#b_pwd1').val();
        var b_pwd = $('#b_pwd').val();

        if (b_pwd==b_pwd1){
            $("#result").html('비밀번호가 같습니다.');
            $("#result").css('color','#2fb380');
        }else {
            $("#result").html('비밀번호가 같지 않습니다.');
            $("#result").css('color','#dc3545');
        }
    })
    $('.btn').click(function () {
        var b_pwd1 = $('#b_pwd1').val();
        var b_pwd = $('#b_pwd').val();
        if (b_pwd==b_pwd1){
            pass;
        }else {
            alert('비밀번호가 같지 않습니다.');
            return false;

        }

    })

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
