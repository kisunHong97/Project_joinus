<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
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

  <title>Energym</title>
  <link
          rel="stylesheet"
          type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
  />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />

  <!-- fonts style -->
  <link
          href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
          rel="stylesheet"
  />
  <!-- Custom styles for this template -->
  <link href="resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="resources/css/responsive.css" rel="stylesheet" />
  <link href="resources/css/productRegister.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
  <script>
    ////////////////////////// 업로드된 파일을 한 번 삭제하고 두번째 삭제 시 파일이 삭제가 안됨 ////////////////////////////////
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

    // 썸네일 폴더에 저장 + 보여주기
    $(document).ready(function(){
      $(".thumbnail-span").each(function(idx, thumbnailSpan){
          $(thumbnailSpan).on("click", "button.uploadBtn", function(event){
            event.preventDefault();

            // var files = event.target.files;

            var formData = new FormData();
            var inputFile = $(thumbnailSpan).find(".thumbnail-input");
            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {
              if(!checkExtension(files[i].name,files[i].size)) return false;
              formData.append("uploadFile",files[i]);
            }

            // 업로드 시 이미지 보여주기
            function showUploadedFile(thumbnail, tag){
              if(thumbnail.image === 'T'){
                var thumbnailPath = encodeURIComponent(thumbnail.uploadPath+"/s_"+thumbnail.uuid+"_"+thumbnail.fileName);	// 썸네일 파일주소 생성(기존파일에서 문자 추가)
                var originPath = thumbnail.uploadPath+"\\"+thumbnail.uuid+"_"+thumbnail.fileName;	// 원본파일 주소 생성
                originPath = originPath.replace(new RegExp(/\\/g),"/");

                $(tag).find(".thumbnail-image").attr("src", "/display?fileName="+thumbnailPath);
                $(tag).find(".deleteBtn").attr('data-file', originPath);
                $(tag).find(".deleteBtn").attr('data-type', 'image');
              }
            }

            $.ajax({
              url : "uploadImage",
              type : "POST",
              data : formData,
              dataType : 'json',
              contentType : false,
              processData : false,
              success : function(result){
                $(thumbnailSpan).find(".uploadBtn").attr("class", "upload uploadBtn");
                $(thumbnailSpan).find(".deleteBtn").attr("class", "uploadActive deleteBtn");
                $(thumbnailSpan).find(".thumbnail-input").attr("class", "input thumbnail-input");

                showUploadedFile(result, thumbnailSpan);					// 결과 화면 보여주기(showUploadedFile(태그))
              }
            });
          });
        $(thumbnailSpan).on("click", "button.deleteBtn", function(event){
          event.preventDefault();
          console.log("들어오냐????", idx)

          var targetFile = $(thumbnailSpan).find(".deleteBtn").data("file");
          var type = $(thumbnailSpan).find(".deleteBtn").data("type");
          console.log("targetFile : " + targetFile + " / type : " +  type);

          $.ajax({
            url:'deleteImage',
            data: {filePath: targetFile, type:type},
            dataType: 'text',
            type:'post',
            success : function(result){
              console.log("썸네일 삭제");
              $(thumbnailSpan).find(".uploadBtn").attr("class", "uploadActive uploadBtn");
              $(thumbnailSpan).find(".deleteBtn").attr("class", "upload deleteBtn");
              $(thumbnailSpan).find(".deleteBtn").removeAttr('data-file');
              $(thumbnailSpan).find(".deleteBtn").removeAttr('data-type');
              $(thumbnailSpan).find(".thumbnail-input").val("");
              $(thumbnailSpan).find(".thumbnail-image").attr("src", '../resources/images/no-image.png');
              $(thumbnailSpan).find(".thumbnail-input").attr("class", "inputActive thumbnail-input");
            }
          });
        })
      })
///////////////////////////////////////////////////여기부터 상세정보//////////////////////////////////////////////////////

      // <input type="file" class="inputActive detail-input">
      // <button class="uploadActive detailUploadBtn" id="uploadBtn">업로드</button>
      // <button class="upload detailDeleteBtn">삭제</button>
      // <div class="detail-image">
      $(".detailUploadBtn").on("click", function(event){
        event.preventDefault();

        var formData = new FormData();
        var inputFile = $(".detail-input");
        var files = inputFile[0].files;

        for (var i = 0; i < files.length; i++) {
          if(!checkExtension(files[i].name,files[i].size)) return false;
          formData.append("uploadFile",files[i]);
        }

        // 업로드 시 이미지 보여주기
        function showUploadedFile(detail){
          if(detail.image === 'I'){
            var originPath = detail.uploadPath+"\\"+detail.uuid+"_"+detail.fileName;	// 원본파일 주소 생성
            originPath = originPath.replace(new RegExp(/\\/g),"/");

            $(".detail-image").append("<img src='\display?fileName="+originPath+"'>")
            $(".detailDeleteBtn").attr('data-file', originPath);
            $(".detailDeleteBtn").attr('data-type', 'image');
          }
        }

        $.ajax({
          url : "uploadDetail",
          type : "POST",
          data : formData,
          dataType : 'json',
          contentType : false,
          processData : false,
          success : function(result){
            $(".detailUploadBtn").attr("class", "upload detailUploadBtn");
            $(".detailDeleteBtn").attr("class", "uploadActive detailDeleteBtn");
            $(".detail-input").attr("class", "input detail-input");

            showUploadedFile(result);					// 결과 화면 보여주기(showUploadedFile(태그))
          }
        });
      })

      $(".detailDeleteBtn").on("click", function(event){
        event.preventDefault();


        var targetFile = $(this).data("file");
        var type = $(this).data("type");
        console.log("targetFile : " + targetFile + " / type : " +  type);


        $.ajax({
          url:'deleteDetail',
          data: {filePath: targetFile, type:type},
          dataType: 'text',
          type:'post',
          success : function(result){
            console.log("상세정보 삭제");
            $(".detailUploadBtn").attr("class", "uploadActive detailUploadBtn");
            $(".detailDeleteBtn").attr("class", "upload detailDeleteBtn");
            $(".detailDeleteBtn").removeAttr('data-file');
            $(".detailDeleteBtn").removeAttr('data-type');
            $(".detail-input").val("");
            console.log("1111")
            $(".detail-image").find("img").remove();
            console.log("2222")
            $(".detail-input").attr("class", "inputActive detail-input");
          }
        });
      })

////////////////////////////////////////여기가 DB에 넣을 Controller에 전송/////////////////////////////////////////////////
      // 이미지 데이터를 DB저장 Controller에 전달
      $(".insertProduct").on("click", function(event){
        event.preventDefault();

        var imageData = {'thumbnail':[], 'detail':""};
        $(".deleteBtn").each(function() {
          imageData['thumbnail'].push($(this).data("file"));
        });
        imageData['detail'] = $(".detailDeleteBtn").data("file");
        console.log(">> , ", imageData);

        $.ajax({
          type: "post",
          url: "nextRegister",
          data: JSON.stringify(imageData),
          contentType: "application/json; charset=utf8",
          success: function (result) {
                alert("저장 성공")
          }
        });

      })
    })
  </script>
</head>
<%@ include file="../header/header.jsp"%>
<body>
<div class="main" style="margin: 0 auto">
  <h1 class="logo">상품 등록</h1>
  <form action="register" method="post">
    <div class="container">
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
          <div class="col-md-4">
            <h5 class="card-title">썸네일</h5>
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <div class="d-flex">
                <span  class="thumbnail-span">
                  <img src="../resources/images/no-image.png" class="thumbnail-image">
                  <input type="file" class="inputActive thumbnail-input">
                  <button class="uploadActive uploadBtn" >업로드</button>
                  <button class="upload deleteBtn">삭제</button>
                </span>
                <span class="thumbnail-span">
                  <img src="../resources/images/no-image.png" class="thumbnail-image">
                  <input type="file" class="inputActive thumbnail-input">
                  <button class="uploadActive uploadBtn">업로드</button>
                  <button class="upload deleteBtn">삭제</button>
                </span>
              </div>
              <div class="d-flex">
                <span  class="thumbnail-span">
                  <img src="../resources/images/no-image.png" class="thumbnail-image">
                  <input type="file" class="inputActive thumbnail-input">
                  <button class="uploadActive uploadBtn">업로드</button>
                  <button class="upload deleteBtn">삭제</button>
                </span>
                <span class="thumbnail-span">
                  <img src="../resources/images/no-image.png" class="thumbnail-image">
                  <input type="file" class="inputActive thumbnail-input">
                  <button class="uploadActive uploadBtn">업로드</button>
                  <button class="upload deleteBtn">삭제</button>
                </span>
              </div>
            </div>
          </div>
        </div>
      </div><%-- 상품명 태그 종료 --%>
      <div class="card mb-3" style="max-width: 540px;">
        <div class="row no-gutters">
          <div class="col-md-4">
            <h5 class="card-title">상세내용</h5>
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <input type="file" class="inputActive detail-input">
              <button class="uploadActive detailUploadBtn">업로드</button>
              <button class="upload detailDeleteBtn">삭제</button>
              <div class="detail-image">
              </div>
            </div>
          </div>
        </div>
      </div><%-- 상품명 태그 종료 --%>
    </div> <%--  컨테이너 끝 --%>
    <button type="submit" class="btn btn-primary insertProduct">등록</button>
    <button type="submit" class="btn btn-secondary">이전</button>
    <button type="submit" class="btn btn-danger">취소</button>
  </form>
</div>
<%@ include file="../footer/footer.jsp"%>
<script src="script.js">
  console.log(b_id);
  console.log(b_pwd1);
</script>
</body>
</html>