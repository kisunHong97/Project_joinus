<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link
        rel="stylesheet"
        type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
/>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css" />

<!-- fonts style -->
<link
        href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
        rel="stylesheet"
/>
<!-- Custom styles for this template -->
<!-- responsive style -->
<link href="../../../resources/css/style.css" rel="stylesheet" />
<link href="../../../resources/css/responsive.css" rel="stylesheet" />
<style>
    <%--    폰트 추가    --%>
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
    body, table, div, p ,span{font-family:'Noto Sans KR';
    }
    /*body{*/
    /*    width: 1100px;*/
    /*    position: absolute;*/
    /*    top: 50%;*/
    /*    left: 50%;*/
    /*    transform: translate(-50%, -50%);*/
    /*}*/
    /*==================================================*/
    .nav-item:hover a {
        color: red; /* 마우스를 올렸을 때의 텍스트 색상 */
    }
    .nav-link {
        margin-top: 0px;
        margin-bottom: 0px;
        font-size:17px;
        font-weight: 900;
        color:#333;
        letter-spacing:-1px;
    }
    .navbar-nav1 {
        list-style: none;
        margin: 0;
        padding: 0;
        position: relative;
    }
    .navbar-nav {
        list-style: none;
        margin:0;
        padding: 0;
        position: relative;
    }
    .navbar-nav li {
        display: inline-block;
        margin-right: 5px;
        font-size: 15px;
        border-right: 1px solid #ccc;
        padding-right: 5px;
        font-weight: bold;
    }


    .navbar-nav1 li {
        display: inline-block;
        margin-left: 10px;
        font-size: 0.8em;
        border-right: 1px solid #ccc;
        padding-right: 10px;
    }

    #ul {
        position: absolute;
        top: 0;
        right: 0;
        left: calc(69% - 205px);
    }
    .nav-link1{
        color: #3b3b3b;
    }
    .header_section{
        height: 100px;
    }
    .navbar-brand img {
        width: 200px;
        height: 70px;
        position: relative;
        left: 345px;
    }
    .dropdown-menu {
        width: 160px;
        display: none;
        position: absolute;
        background-color: #ffffff;
        list-style-type: none;
        margin: 0;
        padding: 0;
        border: solid 1px black;
        font-weight: bold
    }

    .dropdown-menu li {
        padding: 10px;
        color: #000000;
    }

    .dropdown-menu li:hover {
        background-color: #ffffff;
        color: #000000;
    }



</style>
    <!-- header section strats -->
    <header class="header_section" style="background-color:white;" id="header">
        <div class="container" >
            <div class="contact_nav"  style="top: 5px; height: 10px;">
                <ul class="navbar-nav1" id = "ul"  style="top: 5px; height: 20px;">
                    <li class="nav-item1">
                        <c:if test="${id==null}">
                            <a class="nav-link1" href="/login" style="top: 5px; height: 10px;">
                                로그인
                            </a>
                        </c:if>
                        <c:if test="${id!=null}">
                            <a class="nav-link1" href="/logout" style="top: 5px; height: 10px;">
                                로그아웃
                            </a>
                        </c:if>

                    </li>
                    <li class="nav-item1">
                        <a class="nav-link1" href="/join" style="top: 5px; height: 10px;">
                            회원가입
                        </a>
                    </li>
                    <li class="nav-item1">
                        <a class="nav-link1" href="/mycart" role="button" style="top: 5px; height: 10px;">
                            장바구니
                        </a>
                    </li>
                    <li class="nav-item1">
                        <a href="/mypage"  role="button" class="nav-link1"  style="top: 5px; height: 10px;" >마이페이지</a>
                    </li>
                    <li class="nav-item1">
                        <a class="nav-link1" role="button" href="/inquiry" style="top: 5px; height: 10px;">
                            문의내역
                        </a>
                    </li>
                    <li class="nav-item1">
                        <a class="nav-link1" href="/service.jsp" style="top: 5px; height: 10px;">
                            고객센터
                        </a>
                    </li>
                </ul>
            </div>

            <div class="logodiv">
                <h1 class="logo">
                    <a class="navbar-brand" href="/product_board">
                        <img src="../../../resources/images/JOINUSLOGOFINAL.png" alt="" />
                    </a>
                </h1>
            </div>
        </div>
    </header>
    <!-- end header section -->
    <!-- slider section -->
<div class="container" style="border-top: 1px solid #dcdcdc; border-bottom: 2px solid black;">
    <div class="custom_nav2">
        <nav class="navbar navbar-expand-lg custom_nav-container" style="background-color: white">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="d-flex flex-column flex-lg-row align-items-center">
                    <div style="margin-right: 40px">
                        <a class="nav-link active" href="javascript:void(0);" onclick="toggleDropdown()">◼ 전체 카테고리</a>
                        <ul class="dropdown-menu" id="dropdownMenu">
                            <li>
                                <a class="categorya" href="/product_board">JoinUs</a></li>
                            <li><a class="categorya" href="/Food">Food</a></li>
                            <li><a class="categorya" href="/Academy">Academy</a></li>
                            <li><a class="categorya" href="/Physical_Fitness">Physical Fitness</a></li>
                            <li><a class="categorya" href="/Traffic">Traffic</a></li>
                        </ul>
                    </div>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="/product_board">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/Food">Food</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/Academy">Academy</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/Physical_Fitness">Physical Fitness</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/Traffic">Traffic</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0" action="/search" method="GET" onsubmit="return validateForm()">
                        <input type="text" name="query" id="searchInput" value="상품을 검색해보세요!" style="color: slategrey; font-size: 14px; padding: 6px; border-radius: 5px; border: 1px solid lightgray;" onfocus="if(this.value==='상품을 검색해보세요!') this.value='';">
                        <button class="btn my-2 my-sm-0 nav_search-btn" type="submit"></button>
                    </form>
                    <script>
                        function validateForm() {
                            var searchInput = document.getElementById("searchInput");
                            if (searchInput.value === "상품을 검색해보세요!" || searchInput.value === "") {
                                alert("검색어를 입력해주세요!");
                                return false;
                            }
                            return true;
                        }
                    </script>
                </div>
            </div>
        </nav>
    </div>
</div>


<!-- end slider section -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    function toggleDropdown() {
        var dropdownMenu = document.getElementById("dropdownMenu");
        dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
    }

    document.addEventListener("click", function(event) {
        var dropdown = document.getElementsByClassName("custom_nav2")[0];
        if (!dropdown.contains(event.target)) {
            var dropdownMenu = document.getElementById("dropdownMenu");
            dropdownMenu.style.display = "none";
        }
    });
</script>


