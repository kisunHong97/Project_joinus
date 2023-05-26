<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Chart.js 라이브러리 로드 -->
</head>
<%@ include file="../header/header.jsp"%>
<style>
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
    #mypage-menu {
        display: flex;
        justify-content: center;

    }

    #mypage-menu > div {
        width: 130px;
        height: 90px;
        margin-right: 20px;
        border: 1px solid #e5e5e5;
        display: flex;
        justify-content: center;
        background-color: #ffffff;
        align-items: center;
    }
    #mypage-menu > div > a {
        color: #343434;
    }
    .view {
        display: inline-block;
        padding: 6px 16px;
        font-size: 14px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        background-color: #ff731b;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        position: relative;
        top: -2px;
    }

    .view:hover {
        background-color: #ffc36c;
    }
    .review > div {
        width: 880px;
        height: 700px;
        position: relative;
    }

    .reviewInfo > div{
        display: inline-block;
    }

    .date {
        /*position: absolute;*/
        /*right: 0;!* 원하는 만큼의 오프셋 값을 설정하세요 *!*/
        letter-spacing:-1px;
    }
    .divp_name{
        margin-left: 5px;
        margin-right: 5px;

    }
    .content{
        display: flex;
        justify-content: center;
    }
    .content > div {
        width: 880px;
        height: 700px;
        margin-right: 20px;
        border: 1px solid #e5e5e5;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    table {
        border-collapse: collapse;
        width: 47%;
        margin: 0 auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #fff3ee;
    }

    .product-name {
        font-weight: bold;
        margin-top: 20px;
    }
</style>
</head>
<body>
<br>
<div id="mypage-menu">
    <div><a href="#" onclick="showPage('revenue')">수익금 조회</a></div>
    <div><a href="#" onclick="showPage('notice')">회원관리</a></div>
    <div><a href="/showMyProduct">등록글 조회</a></div>
    <div><a href="/register">상품 등록</a></div>
    <div><a href="/businessinformation?id=${business.b_id}">개인정보 수정</a></div>
    <div><a href="#" onclick="showPage('review')">리뷰 확인</a></div>
</div>
<div class="mypage-form">
    <div id="revenue-page">
        <div class="page-content">
            <div id="revenueContainer" style="display: flex; justify-content: center; align-items: center;">
                <button class="view" onclick="fetchRevenueData(); this.disabled = true;">조회</button>
                <canvas id="revenueChart" style="position: relative; height: 400px; width: 600px;"></canvas>
            </div>
        </div>
    </div>
    <div id="review-page" style="display: none;">
        <div class="page-content">
            <div id="reviewList" style="width: 1000px; margin-left: 440px">
                <div style="border-bottom: 1px solid salmon; ">
                    <span><h2 style="font-weight: 900; letter-spacing:-1px; display: block; margin-top: 30px ;margin-bottom: 20px">등록된 리뷰</h2></span>
                </div>
                <c:forEach items="${reviewlist}" var="review">
                    <div class="reviewItem">
                        <div class="reviewInfo" style="border-bottom: 1px solid #ffd3c0; height: 50px; display: block; margin-top: 30px;"  >
                            <div class="divstar"><span class="star" style="color: #ff731b; width: 100px">
                            <script>
                        var rating = ${review.rating};
                        var stars = "";
                        for (var i = 1; i <= 5; i++) {
                            if (i <= rating) {
                                stars += '<span class="star">★</span>';
                            } else {
                                stars += '<span class="star">☆</span>';
                            }
                        }
                        document.write(stars);
                    </script></span></div>
                            <div class="divp_name" style="width: 270px; text-align: center;"><a href="board/read?pno=${review.pno}" class="p_name"> ${review.p_name}</a></div>
                            <div class="divu_id" style="width: 30px; text-align: center;"><span>${review.u_id}</span></div>
                            <div class="divtextreview" style="width: 500px; text-align: center;"> <span class="textreview"> ${review.review}</span></div>
                            <span class="date" style="color: #ff731b;">${review.sys_date}</span>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty reviewlist}">
                    <br>
                    <div class="noReviews" style="text-align: center">작성된 리뷰가 없습니다.</div>
                </c:if>
            </div>

            <br>
        </div>
    </div>
    <div id="notice-page" style="display: none;">
        <div class="page-content">
            <c:forEach items="${memberManagement}" var="member" varStatus="loop">
                <c:if test="${loop.first || member.p_name != memberManagement[loop.index - 1].p_name}">
                    <div class="product-name">
                            ${member.p_name}
                    </div>
                    <table class="product-table" border="1">
                        <thead>
                        <tr>
                            <th>사용자</th>
                            <th>기간</th>
                            <th>메모</th>
<%--                            <th>환불요청</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${memberManagement}" var="subMember">
                            <c:if test="${subMember.p_name == member.p_name}">
                                <tr>
                                    <td>${subMember.u_id}</td>
                                    <td>${subMember.startDate} ~ ${subMember.endDate}</td>
                                    <td>${subMember.memo}</td>
<%--                                    <td>--%>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${refundVO != ''}">--%>
<%--                                                <button id="refundResponse" onclick="refundResponse('${refundVO.u_id}', ${refundVO.pno}, ${refundVO.p_price})">환불요청</button>--%>
<%--                                            </c:when>--%>
<%--                                            <c:otherwise>--%>
<%--                                                ${refundVO.u_id} 요청없음--%>
<%--                                            </c:otherwise>--%>
<%--                                        </c:choose>--%>
<%--                                    </td>--%>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:forEach>
        </div>
    </div>

</div>
</body>
<script>
    function showPage(pageName) {
        // 모든 페이지 숨기기
        var pages = document.getElementsByClassName("mypage-form")[0].children;
        for (var i = 0; i < pages.length; i++) {
            pages[i].style.display = "none";
        }

        // 선택한 페이지 보이기
        var selectedPage = document.getElementById(pageName + "-page");
        selectedPage.style.display = "block";
    }

    function refundResponse(u_id, pno, p_price){
        if(confirm("환불해주시겠습니까?")){
            $.ajax({
                type:'POST',
                url: "/nowRefund",
                data: {
                    u_id:u_id,
                    pno:pno,
                    p_price:p_price
                },
                success: function (response){
                    alert("환불 되었습니다.")
                    location.reload()
                },
                error: function (xhr, status, error){
                    alert("에러 발생")
                }
            })
        }else{
            alert("취소되었습니다.")
        }

    }
    function fetchRevenueData() {
        $.ajax({
            url: '/storeRevenue?sno='+${business.bno},
            method: 'GET',
            dataType: "json",
            success: function(response) {
                console.log(response);
                // 수익 데이터 추출
                drawRevenueChart(response.map(i=>i.revenue_date) , response.map(i=>i.revenue_amount) ); // 데이터를 받아와 차트를 그리는 함수 호출
            },
            error: function() {
                console.log('데이터를 불러오는데 실패했습니다.');
            }
        });
    }
    var chart; // 전역 변수로 차트 객체를 선언

    function drawRevenueChart(dates, amounts) {
        console.log("date: " + dates, amounts);
        var ctx = document.getElementById('revenueChart').getContext('2d');

        var dayOfWeek = ["월", "화", "수", "목", "금", "토", "일"];
        var labels = dates.map(function(date) {
            var parts = date.split("/");
            console.log(parts);
            var year = parseInt(parts[0]);
            if (year < 100) {
                // 두 자리 수 연도인 경우 처리
                year += 2000; // 예: 23 -> 2023
            }
            var month = parseInt(parts[1]) - 1; // 1을 빼줌
            var dayOfMonth = parseInt(parts[2]);
            var dateObj = new Date(year, month, dayOfMonth);
            console.log(dateObj);
            var dayIndex = dateObj.getDay();
            console.log(dayIndex);
            return parseInt(month + 1) + "월" + " " + dayOfMonth + "일" + " " + dayOfWeek[dayIndex - 1] + "요일";
        });

        // labels.reverse(); // 날짜 배열을 역순으로 변경
        console.log(labels);
        if (chart) {
            chart.destroy(); // 이전 차트 객체를 파괴하여 초기화
        }

        // 주간 총 수익금 계산
        var weekTotalAmounts = [];
        var currentWeekTotal = 0;

        for (var i = 0; i < amounts.length; i++) {
            currentWeekTotal += amounts[i];
            if (labels[i].startsWith("월") || i === labels.length - 1) {
                weekTotalAmounts.push(currentWeekTotal);
                currentWeekTotal = 0;
            }
        }

        console.log(weekTotalAmounts)
        chart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: '요일별 매출',
                    data: amounts,
                    backgroundColor: 'rgba(255, 154, 30, 0.3)',
                    borderColor: 'rgba(255, 154, 30, 0.3)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: false,
                maintainAspectRatio: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return value + ' 원';
                            }
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                var label = context.dataset.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed.y !== null) {
                                    label += context.parsed.y + ' 원';
                                }
                                return label;
                            }
                        }
                    }
                },
                layout: {
                    padding: {
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 20
                    }
                }
            }
        });
    }

</script>
<%@ include file="../footer/footer.jsp"%>
</html>
