<%--
  Created by IntelliJ IDEA.
  User: b14
  Date: 2023-05-03
  Time: 오전 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    /* @import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css'); */
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

    body{
        margin:0 auto;
    }
    /* body, table, div, p ,span{font-family:'Nanum Gothic';} */
    body, table, div, p ,span{font-family:'Noto Sans KR';}

    a{
        text-decoration: none;
        color:#333;
    }
    #con{
        width:100%;
        height: 100vh;
        background-color:#f5f1ee;
        background-position: center center;
        background-repeat: no-repeat;
        background-size:cover;
        padding:0;
    }
    #login{
        width:600px;
        height: 600px;
        margin:0 auto;
        /* position: relative; */
        /* background:#ddd; */
    }
    #login_form{
        /* text-align:center; */
        border-radius: 10px;
        padding:40px 50px;
        background: #fff;
        text-align: center;
        position: absolute;
        top:50%;
        left:50%;
        transform: translate(-50%, -50%);
    }
    .login{
        font-size:25px;
        font-weight: 900;
        color:#333;
    }

    .size{
        width:300px;
        height:30px;
        padding-left:10px;
        background-color: #f4f4f4;
        /* margin-left:10px; */
        border:none;
        border-radius: 5px;
    }
    .size2{
        width:200px;
        height:30px;
        padding-left:10px;
        background-color: #f4f4f4;
        /* margin-left:10px; */
        border:none;
        border-radius: 5px;
    }
    .size3{
        width:60px;
        height:30px;
        padding-left:10px;
        background-color: #f4f4f4;
        /* margin-left:10px; */
        border:none;
        border-radius: 5px;
    }


    .btn{
        width:310px;
        height: 40px;
        font-size:15px;
        background-color: #df3278;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;
    }
    .btn:hover{
        background:#ca296a;
    }
    hr{
        margin-top:20px;
        background:#eee;

    }
    .find{
        color:#ddd;
        font-size:12px;
    }
    .find span{
        padding-left:10px;
    }
    .find span::before{
        content:'|';
        color:#333;
        padding-right: 10px;
    }
    .find span:nth-child(1):before{
        content:none;
    }

    .find span:nth-child(1){
        padding-left:0px;
    }

    .find a:hover{
        color:#707070;
    }
</style>


<body>
<div id="con">
    <div id="login">
        <div id="login_form"><!--로그인 폼-->
            <form action="/signup" method="post">
                <h3 class="login" style="letter-spacing:-1px;">사업자 회원가입</h3>
                <hr>
                <label>
                    <!-- <span>ID</span> -->
                    <p style="text-align: left; font-size:12px; color:#666">username</p>
                    <input type="text" placeholder="이름" class="size" name="b_name" id="b_name">
                    <p></p>
                </label><!--이름-->

                <label>
                <!-- <span>ID</span> -->
                <p style="text-align: left; font-size:12px; color:#666">userid</p>
                <input type="text" placeholder="아이디" class="size"  name="b_id" id="b_id">
                    <br>
                    <div><span id="id_feedback" style="font-size: 12px;"></span></div>
<%--                    <input type="button" onclick="idOverlap()" value="중복확인" class="resultid"/>--%>
                </label><!--아이디-->

                <label>
                    <!-- <span>PW</span> -->
                    <p style="text-align: left; font-size:12px; color:#666">Password </p>
                    <input type="password" placeholder="비밀번호" class="size" name="b_pwd1" id="b_pwd1">
                </label><!--비밀번호-->

                <label>
                    <!-- <span>PW</span> -->
                    <p style="text-align: left; font-size:12px; color:#666"> </p>
                    <input type="password" placeholder="비밀번호 확인 *" class="size" name="b_pwd2" id="b_pwd2" >
                    <br>
                    <span id="result" style="font-size: 12px;"></span>
                </label><!--비밀번호 확인-->
                <label>
                    <!-- <span>PW</span> -->
                    <p style="text-align: left; font-size:12px; color:#666">phone number </p>
                    <input type="text" placeholder="-빼고 숫자만 입력" class="size" name="b_phone" id="b_phone" >
                </label><!--전화번호-->
                <label>
                    <p style="text-align: left; font-size:12px; color:#666">address </p>

                    <div class="form-group">
                        <input class="size1"  placeholder="우편번호" name="b_address" id="addr1" type="text" readonly="readonly" >
                        <button type="button" class="btn1"  onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                    </div>
                    <div class="form-group">
                        <input class="size"  placeholder="도로명 주소" name="b_address" id="addr2" type="text" readonly="readonly" />
                    </div>
                    <div class="form-group">
                        <input class="size" placeholder="상세주소" name="b_address" id="addr3" type="text"  />
                    </div>

                    <select id=city class="size3" name="b_address" >
                        <option name="city" value="서울시">서울</option>
                        <option name="city" value="수원시">수원</option>
                        <option name="city" value="안양시">안양</option>
                        <option name="city" value="부산시">부산</option>
                    </select>
                    <input type="text" placeholder="구" class="size2" name="b_address" id="b_address">

                </label>
                <label>
                    <!-- <span>PW</span> -->
                    <p style="text-align: left; font-size:12px; color:#666">E-mail</p>
                    <input type="text" placeholder="이메일" class="size" name="b_email" id="b_email" >
                </label> <!--이메일-->
                <br>
                <p>
                    <input type="submit" value="다음으로" class="btn">
                </p>
            </form>

            <hr>
            <p class="find">
                <span><a href="login" >로그인 페이지로 이동</a></span>
            </p>
        </div>
        </div><!--con-->
    </div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

    $('#b_id').keyup(function (){
        let b_id = $('#b_id').val();
        $.ajax({
            url:"/b_idCheck?b_id=" +b_id,
            type:'GET',
            dataType: 'json',
            success : function (result){

                if(result == 1){
                    $("#id_feedback").html('이미 사용중인 아이디입니다.');
                    $("#id_feedback").css('color','#dc3545');
                }else {
                    $("#id_feedback").html('사용할 수 있는 아이디입니다.');
                    $("#id_feedback").css('color','#2fb380');
                }
            },
            error:function (){
                alert('서버요청실패');
            }
        })
    })
    /* 자바 스크립트 함수 선언(비밀번호 확인) */
    $('#b_pwd2').keyup(function (){

        var b_pwd2 = $('#b_pwd2').val();
        var b_pwd1 = $('#b_pwd1').val();

        if (b_pwd1==b_pwd2){
            $("#result").html('비밀번호가 같습니다.');
            $("#result").css('color','#dc3545');
        }else {
            $("#result").html('비밀번호가 같지 않습니다.');
            $("#result").css('color','#2fb380');
        }
    })
    $('.btn').click(function () {
        var b_pwd2 = $('#b_pwd2').val();
        var b_pwd1 = $('#b_pwd1').val();
        if (b_pwd1==b_pwd2){
            pass;
        }else {
            alert('비밀번호가 같지 않습니다.');
            return false;

        }

    })


</script>
</html>
