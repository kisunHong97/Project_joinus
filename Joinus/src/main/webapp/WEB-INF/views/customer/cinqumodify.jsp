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

</style>
<body>
<br>

<div class="divmain">
    <h1>문의글 NO.${inquiryVO.ino}</h1>
    <br>
    <div class="form-container">
        <form action="/inqu_modify/ino=${inquiryVO.ino}" method="post">
            <input type="hidden" value="${inquiryVO.pno}" name="pno">
            <div class="form-group">
                <label for="i_title">제목:</label>
                <input class="input" type="text"  value="${inquiryVO.i_title}" id="i_title" name="i_title" required>
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
                <textarea class="input" id="u_inquiry"  name="u_inquiry" rows="5" required>${inquiryVO.u_inquiry}</textarea>
            </div>
            <button class="button" type="submit">수정</button>
        </form>

    </div>

</div>
<hr>

<br>
<br>
<%@ include file="../footer/footer.jsp"%>
</body>
</html>

<script>


</script>

