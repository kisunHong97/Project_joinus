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
    .size1{
        width:200px;
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
        background-color: #ff731b;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;
    }
    .btn1{
        width:97px;
        height: 25px;
        font-size:13px;
        background-color: #ff731b;
        color:#fff;
        border:none;
        cursor: pointer;
        border-radius: 5px;
    }
    .btn:hover{
        background:#ff731b;
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
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	// 정규 표현식(Regular Expression)
    var maxSize = 5242880;	// 5MB

    // 파일 규격 확인
    function checkExtension(fileName, fileSize){
        if(fileSize >= maxSize){
            alert("파일 사이즈 초과");
            return false;
        }
        if(regex.test(fileName)){
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
        }
        return true
    }

    function showUploadedFile(file, tag){
        if(file.image){
            // var filePath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);	// 썸네일 파일주소 생성(기존파일에서 문자 추가)
            var originPath = file.uploadPath+"\\"+file.uuid+"_"+file.fileName;	                    // 원본파일 주소 생성
            originPath = originPath.replace(new RegExp(/\\/g),"/");


            $(tag).find(".file-image").append("<img src='/display?fileName=" + originPath + "'>")
            $(tag).find(".deleteBtn").attr('data-file', originPath);
            $(tag).find(".deleteBtn").attr('data-type', 'image');
        }
    }

    // input[type='file']의 데이터 가져오기
    function getInputFile(tag){
        var formData = new FormData();
        var inputFile = $(tag).find(".file-input");
        var files = inputFile[0].files;

        console.log("3>> ", files);
        for (var i = 0; i < files.length; i++) {
            if(!checkExtension(files[i].name,files[i].size))
                return false;
            formData.append("uploadFile",files[i]);
        }
        console.log("4>> ", formData);
        return formData;
    }

    $(document).ready(function(){
        $(".storeImage-span").on("click", "button.uploadBtn", function(event){
            event.preventDefault();

            $.ajax({
                url : "uploadStoreImage",
                type : "POST",
                data : getInputFile(".storeImage-span"),
                dataType : 'json',
                contentType : false,
                processData : false,
                success : function(result){
                    $(".storeImage-span").find(".uploadBtn").attr("class", "upload uploadBtn");
                    $(".storeImage-span").find(".deleteBtn").attr("class", "uploadActive deleteBtn");
                    $(".storeImage-span").find(".file-input").attr("class", "input file-input");

                    showUploadedFile(result, ".storeImage-span");					// 결과 화면 보여주기(showUploadedFile(태그))
                }
            });
        })

        $(".storeImage-span").on("click", "button.deleteBtn", function(event){
            event.preventDefault();

            var targetFile = $(".storeImage-span").find(".deleteBtn").data("file");
            var type = $(".storeImage-span").find(".deleteBtn").data("type");
            console.log("targetFile : " + targetFile + " / type : " +  type);


            $.ajax({
                url:'deleteImage',
                data: {filePath : targetFile, type : type},
                dataType: 'text',
                type:'post',
                success : function(result){
                    alert("상세정보 삭제");
                    $(".storeImage-span").find(".uploadBtn").attr("class", "uploadActive uploadBtn");
                    $(".storeImage-span").find(".deleteBtn").attr("class", "upload deleteBtn");
                    $(".storeImage-span").find(".deleteBtn").removeAttr('data-file');
                    $(".storeImage-span").find(".deleteBtn").removeAttr('data-type');
                    $(".storeImage-span").find(".file-input").val("");
                    $(".storeImage-span").find(".file-image").find("img").remove();
                    $(".storeImage-span").find(".file-input").attr("class", "inputActive file-input");
                }
            });
        })

        $(".insertStore").on("click", function (event){
            event.preventDefault();

            console.log("insertStore에 들어왔다.")

            var storeData = {
                'store':{},
                'storeImage':""};

            storeData['store']['storename'] = $("#storename").val();
            storeData['store']['storeinst'] = $("#storeinst").val();
            storeData['store']['storenumber'] = $("#storenumber").val();
            storeData['store']['storeurl'] = $("#storeurl").val();
            storeData['store']['storeaddresscode'] = $("#addr1").val();
            storeData['store']['storeaddressStreet'] = $("#addr2").val();
            storeData['store']['storeaddressDetail'] = $("#addr3").val();

            storeData['storeImage'] = $(".storeImage-span").find(".deleteBtn").data("file");

            console.log(">>> ", storeData)

            $.ajax({
                type: "post",
                url: "storesignup",
                data: JSON.stringify(storeData),
                contentType: "application/json; charset=utf8",
                success: function (result) {
                    location.href = "/login";
                }
            });
        })

        $("button").click(function (event){
            event.preventDefault();
        })
    })
</script>

<body>
<div id="con">
    <div id="login">
        <div id="login_form"><!--로그인 폼-->
            <form action="/storesignup" method="post">
                <h3 class="login" style="letter-spacing:-1px;">사업자 회원가입</h3>
                <hr>
                <label>
                    <!-- <span>ID</span> -->
                    <p style="text-align: left; font-size:12px; color:#666">Store Name</p>
                    <input type="text" placeholder="스토어 이름" class="size" name="storename" id="storename">
                    <div><span id="id_feedback" style="font-size: 12px;"></span></div>
                    <p></p>
                </label><!--이름-->
                <label>
                <!-- <span>ID</span> -->
                <p style="text-align: left; font-size:12px; color:#666">Store URL</p>
                <input type="text" placeholder="스토어 URL" class="size"  name="storeurl" id="storeurl">
                    <br>
<%--                    <input type="button" onclick="idOverlap()" value="중복확인" class="resultid"/>--%>
                </label><!--아이디-->
                <label>
                    <p style="text-align: left; font-size:12px; color:#666">Store address </p>
                    <div class="form-group">
                        <input class="size1"  placeholder="우편번호" name="storeaddresscode" id="addr1" type="text" readonly="readonly" >
                        <button type="button" class="btn1"  onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                    </div>
                    <div class="form-group">
                        <input class="size"  placeholder="도로명 주소" name="storeaddressStreet" id="addr2" type="text" readonly="readonly" />
                    </div>
                    <div class="form-group">
                        <input class="size" placeholder="상세주소" name="storeaddressDetail" id="addr3" type="text"  />
                    </div>

                </label>

                <label>
                    <p style="text-align: left; font-size:12px; color:#666">Store Number </p>
                    <input type="text" placeholder="스토어 연락처" class="size" name="storenumber" id="storenumber" >
                    <br>
                    <span id="result" style="font-size: 12px;"></span>
                </label>
                <label>
                    <!-- <span>PW</span> -->
                    <p style="text-align: left; font-size:12px; color:#666">Store Introduction</p>
                    <input type="text" placeholder="스토어 소개글(한줄로)" class="size" name="storeinst" id="storeinst" >
                </label>
                <label>

                    <!-- <span>PW</span> -->
                    <p style="text-align: left; font-size:12px; color:#666">Store Image</p>
                    <span class="storeImage-span">
                        <input type="file" class="inputActive file-input" />
                        <button class="uploadActive uploadBtn">업로드</button>
                        <button class="upload deleteBtn">삭제</button>
                        <div class="file-image"></div>
                    </span>
                </label>
                <br>
                <p>
                    <input type="submit" value="Create Account" class="btn insertStore">
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

    $('#storename').keyup(function (){
        let storename = $('#storename').val();
        $.ajax({
            url:"/s_nameCheck?storename="+storename,
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
</html>