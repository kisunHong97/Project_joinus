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
        width:140px;
        height: 40px;
        font-size:15px;
        background-color: #ff731b;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;

    }
    .btn{
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 300px;
    }
    .point{
        width:400px;
        height:40px;
        padding-left:10px;
        background-color: #f4f4f4;
        /* margin-left:10px; */
        border:none;
        border-radius: 5px;
    }
    .pointlabel{
        margin-right: 50px;
    }

</style>
</head>
<body>
<br>
<div class="container bootstrap snippets bootdey">
    <div class="main">
        <h1 class="text">JOINUS 포인트</h1>
        <hr>
        <div class="row">
            <div class="col-md-9 personal-info">
                <form class="form-horizontal" role="form" action="/customerpointcharge" method="get">
                    <label class="pointlabel">
                        <p style="text-align: left; font-size:15px; color:#666">포인트 충전 (최대 50만포인트까지 가능) </p>

                        <div class="form-group">
                            <input class="point"  placeholder="숫자만 입력해주세요" name="buypoint" id="buypoint" type="text">
                            <input type="submit" class="btn1" value="즉시충전"><i class="fa fa-search"></i></input>
                            <span id="result" style="font-size: 14px;"></span>
                        </div>
                    </label>
                </form>
            </div>
        </div>
    </div>
</div>
<hr>

</body>
<%@ include file="../footer/footer.jsp"%>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    $('.btn1').click(function (){
        var point = $('.point').val();
        if (isNaN(point)){
            console.log("숫자만 입력");
            $("#result").html('숫자만 입력해주세요.');
            $("#result").css('color','#dc3545');
            return false;
        } else if (point > 500000){
            console.log("50만원 이하로 입력");
            $("#result").html('최대 50만원 까지 가능합니다.');
            $("#result").css('color','#dc3545');
            return false;
        } else if (point === ""){
            $("#result").html('충전 포인트를 입력해주세요.');
            $("#result").css('color','#dc3545');
            return false;
        } else {
            var confirmation = confirm(point + "포인트를 충전하시겠습니까?");
            if (confirmation) {
                return true;
            } else {
                return false;
            }
        }
    });




</script>
