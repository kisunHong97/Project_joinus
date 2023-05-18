<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
  <head>
    <!-- Basic -->
    <title>Energym</title>
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
  
      function showUploadedFile(file, tag){
        if(file.image){
          // var filePath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);	// 썸네일 파일주소 생성(기존파일에서 문자 추가)
          var originPath = file.uploadPath+"\\"+file.uuid+"_"+file.fileName;	                    // 원본파일 주소 생성
          originPath = originPath.replace(new RegExp(/\\/g),"/");
  
          if(file.image === 'T')  // T = Thumbnail
            $(tag).find(".file-image").attr("src", "/display?fileName="+originPath);
          if(file.image === 'I')  // I = Intro
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
  
        for (var i = 0; i < files.length; i++) {
          if(!checkExtension(files[i].name,files[i].size))
            return false;
          formData.append("uploadFile",files[i]);
        }
        console.log("1>> ", files);
        console.log("2>> ", formData);

        return formData;
      }

      // 썸네일 폴더에 저장 + 보여주기
      $(document).ready(function(){
        $(".thumbnail-span").each(function(idx, thumbnailSpan){
            $(thumbnailSpan).on("click", "button.uploadBtn", function(event){
              event.preventDefault();

              $.ajax({
                url : "uploadThumbnail",
                type : "POST",
                data : getInputFile($(thumbnailSpan)),
                dataType : 'json',
                contentType : false,
                processData : false,
                success : function(result){
                  $(thumbnailSpan).find(".uploadBtn").attr("class", "upload uploadBtn");
                  $(thumbnailSpan).find(".deleteBtn").attr("class", "uploadActive deleteBtn");
                  $(thumbnailSpan).find(".file-input").attr("class", "input file-input");

                  showUploadedFile(result, thumbnailSpan);					// 결과 화면 보여주기(showUploadedFile(태그))
                }
              });
            });

          $(thumbnailSpan).on("click", "button.deleteBtn", function(event){
            event.preventDefault();
  
            var targetFile = $(thumbnailSpan).find(".deleteBtn").data("file");
            var type = $(thumbnailSpan).find(".deleteBtn").data("type");
            console.log("TFILE : ", targetFile);
            console.log("TYPE : ", type);


            $.ajax({
              url:'deleteImage',
              data: {filePath : targetFile, type : type},
              dataType: 'text',
              type:'post',
              success : function(result){
                alert("썸네일 삭제");
                $(thumbnailSpan).find(".uploadBtn").attr("class", "uploadActive uploadBtn");
                $(thumbnailSpan).find(".deleteBtn").attr("class", "upload deleteBtn");
                $(thumbnailSpan).find(".deleteBtn").removeAttr('data-file');
                $(thumbnailSpan).find(".deleteBtn").removeAttr('data-type');
                $(thumbnailSpan).find(".file-input").val("");
                $(thumbnailSpan).find(".file-image").attr("src", '../resources/images/no-image.png');
                $(thumbnailSpan).find(".file-input").attr("class", "inputActive file-input");
              }
            });
          })
        })
  ///////////////////////////////////////////////////여기부터 상세정보//////////////////////////////////////////////////////
  
        $(".detail-span").on("click", "button.uploadBtn", function(event){
          event.preventDefault();

          $.ajax({
            url : "uploadDetail",
            type : "POST",
            data : getInputFile($(".detail-span")),
            dataType : 'json',
            contentType : false,
            processData : false,
            success : function(result){
              $(".detail-span").find(".uploadBtn").attr("class", "upload uploadBtn");
              $(".detail-span").find(".deleteBtn").attr("class", "uploadActive deleteBtn");
              $(".detail-span").find(".file-input").attr("class", "input file-input");

              showUploadedFile(result, ".detail-span");				// 결과 화면 보여주기(showUploadedFile(태그))
            }
          });
        })
  
        $(".detail-span").on("click", "button.deleteBtn", function(event){
          event.preventDefault();
  
          var targetFile = $(".detail-span").find(".deleteBtn").data("file");
          var type = $(".detail-span").find(".deleteBtn").data("type");
          console.log("targetFile : " + targetFile + " / type : " +  type);
  

          $.ajax({
            url:'deleteImage',
            data: {filePath : targetFile, type : type},
            dataType: 'text',
            type:'post',
            success : function(result){
              alert("상세정보 삭제");
              $(".detail-span").find(".uploadBtn").attr("class", "uploadActive uploadBtn");
              $(".detail-span").find(".deleteBtn").attr("class", "upload deleteBtn");
              $(".detail-span").find(".deleteBtn").removeAttr('data-file');
              $(".detail-span").find(".deleteBtn").removeAttr('data-type');
              $(".detail-span").find(".file-input").val("");
              $(".detail-span").find(".file-image").find("img").remove();
              $(".detail-span").find(".file-input").attr("class", "inputActive file-input");
            }
          });
        })
  
  ////////////////////////////////////////여기가 DB에 넣을 Controller에 전송/////////////////////////////////////////////////
        // 이미지 데이터를 DB저장 Controller에 전달
        $(".insertProduct").on("click", function(event){
          event.preventDefault();
  
          var productData = {
            'product':{},
            'thumbnail':[],
            'detail':""};

          productData['product']['p_name'] = $("#p_name").val();
          productData['product']['p_subtitle'] = $("#p_subtitle").val();
          productData['product']['p_category'] = $("#p_category").val();
          productData['product']['p_period'] = 1;


          $(".thumbnail-span").find(".deleteBtn").each(function() {
            productData['thumbnail'].push($(this).data("file"));
          });
          productData['detail'] = $(".detail-span").find(".deleteBtn").data("file");
          console.log(">> , ", productData);
  
          $.ajax({
            type: "post",
            url: "register",
            data: JSON.stringify(productData),
            contentType: "application/json; charset=utf8",
            success: function (result) {
                location.href = "/mypage";
            }
          });

        })
      })
    </script>

  </head>
  <%@ include file="../header/header.jsp"%>
  <style>
    .row{
      border: none;
    }
    .thumbnail-image{
      width: 140px;
      height: 140px;
    }
    .main{
      border-top: none;
    }
    .card-title{
      border: none;
      background-color: #ff731b;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center
    }
  </style>
  <body>
    <div class="main" style="margin: 0 auto">
      <h1 class="logo" style="color: #ff731b;">상품 등록</h1>
      <form action="register" method="post">
        <div class="container">
          <div class="card mb-3" style="max-width: 540px">
            <div class="row no-gutters">
              <div class="col-md-4">
                <h5 class="card-title">상품명</h5>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <input
                    type="text"
                    placeholder="상품명"
                    id="p_name"
                    name="p_name"
                  />
                </div>
              </div>
            </div>
          </div>
          <%-- 상품명 태그 종료 --%>
          <div class="card mb-3" style="max-width: 540px">
            <div class="row no-gutters">
              <div class="col-md-4">
                <h5 class="card-title">소개글</h5>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <input
                    type="text"
                    placeholder="소개글"
                    id="p_subtitle"
                    name="p_subtitle"
                  />
                </div>
              </div>
            </div>
          </div>
          <%-- 소개글 태그 종료 --%>
          <div class="card mb-3" style="max-width: 540px">
            <div class="row no-gutters">
              <div class="col-md-4">
                <h5 class="card-title">기간</h5>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <select name="p_period" id="p_period">
                    <option value="">-- 기간 선택 --</option>
                    <option value="2023-05-03~2023-06-03">한달</option>
                    <option value="2023-05-03~2023-08-03">세달</option>
                    <option value="2023-05-03~2024-05-03">일년</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <%-- 기간 태그 종료 --%>
          <div class="card mb-3" style="max-width: 540px">
            <div class="row no-gutters">
              <div class="col-md-4">
                <h5 class="card-title">카테고리</h5>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <select name="p_category" id="p_category">
                    <option value="">-- 카테고리 선택 --</option>
                    <option value="food">food</option>
                    <option value="academy">academy</option>
                    <option value="physical fitness">physical fitness</option>
                    <option value="traffic">traffic</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <%-- 소개글 태그 종료 --%>
          <div class="card mb-3" style="max-width: 540px">
            <div class="row no-gutters">
              <div class="col-md-4">
                <h5 class="card-title">썸네일</h5>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <c:forEach begin="1" end="2">
                  <div class="d-flex">
                    <span class="thumbnail-span">
                      <img
                        src="../resources/images/no-image.png"
                        class="file-image thumbnail-image"
                      />
                      <input type="file" class="inputActive file-input" />
                      <button class="uploadActive uploadBtn">업로드</button>
                      <button class="upload deleteBtn">삭제</button>
                    </span>
                    <span class="thumbnail-span">
                      <img
                        src="../resources/images/no-image.png"
                        class="file-image thumbnail-image"
                      />
                      <input type="file" class="inputActive file-input" />
                      <button class="uploadActive uploadBtn">업로드</button>
                      <button class="upload deleteBtn">삭제</button>
                    </span>
                  </div>
                </c:forEach>
                </div>
              </div>
            </div>
          </div>
          <%-- 상품명 태그 종료 --%>
          <div class="card mb-3" style="max-width: 540px">
            <div class="row no-gutters">
              <div class="col-md-4">
                <h5 class="card-title">상세내용</h5>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <span class="detail-span">
                    <input type="file" class="inputActive file-input" />
                    <button class="uploadActive uploadBtn">업로드</button>
                    <button class="upload deleteBtn">삭제</button>
                    <div class="file-image"></div>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <%-- 상품명 태그 종료 --%>
        </div>
        <%-- 컨테이너 끝 --%>
        <button type="submit" class="btn btn-primary insertProduct">
          등록
        </button>
        <button type="submit" class="btn btn-danger">취소</button>
      </form>
    </div>
    <%@ include file="../footer/footer.jsp"%>

  </body>
</html>
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

  function showUploadedFile(file, tag){
    if(file.image){
      // var filePath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);	// 썸네일 파일주소 생성(기존파일에서 문자 추가)
      var originPath = file.uploadPath+"\\"+file.uuid+"_"+file.fileName;	                    // 원본파일 주소 생성
      originPath = originPath.replace(new RegExp(/\\/g),"/");

      if(file.image === 'T')  // T = Thumbnail
        $(tag).find(".file-image").attr("src", "/display?fileName="+originPath);
      if(file.image === 'I')  // I = Intro
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

    for (var i = 0; i < files.length; i++) {
      if(!checkExtension(files[i].name,files[i].size))
        return false;
      formData.append("uploadFile",files[i]);
    }
    console.log("1>> ", files);
    console.log("2>> ", formData);

    return formData;
  }

  // 썸네일 폴더에 저장 + 보여주기
  $(document).ready(function(){
    $(".thumbnail-span").each(function(idx, thumbnailSpan){
      $(thumbnailSpan).on("click", "button.uploadBtn", function(event){
        event.preventDefault();

        $.ajax({
          url : "uploadThumbnail",
          type : "POST",
          data : getInputFile($(thumbnailSpan)),
          dataType : 'json',
          contentType : false,
          processData : false,
          success : function(result){
            $(thumbnailSpan).find(".uploadBtn").attr("class", "upload uploadBtn");
            $(thumbnailSpan).find(".deleteBtn").attr("class", "uploadActive deleteBtn");
            $(thumbnailSpan).find(".file-input").attr("class", "input file-input");

            showUploadedFile(result, thumbnailSpan);					// 결과 화면 보여주기(showUploadedFile(태그))
          }
        });
      });

      $(thumbnailSpan).on("click", "button.deleteBtn", function(event){
        event.preventDefault();

        var targetFile = $(thumbnailSpan).find(".deleteBtn").data("file");
        var type = $(thumbnailSpan).find(".deleteBtn").data("type");
        console.log("TFILE : ", targetFile);
        console.log("TYPE : ", type);


        $.ajax({
          url:'deleteImage',
          data: {filePath : targetFile, type : type},
          dataType: 'text',
          type:'post',
          success : function(result){
            alert("썸네일 삭제");
            $(thumbnailSpan).find(".uploadBtn").attr("class", "uploadActive uploadBtn");
            $(thumbnailSpan).find(".deleteBtn").attr("class", "upload deleteBtn");
            $(thumbnailSpan).find(".deleteBtn").removeAttr('data-file');
            $(thumbnailSpan).find(".deleteBtn").removeAttr('data-type');
            $(thumbnailSpan).find(".file-input").val("");
            $(thumbnailSpan).find(".file-image").attr("src", '../resources/images/no-image.png');
            $(thumbnailSpan).find(".file-input").attr("class", "inputActive file-input");
          }
        });
      })
    })
    ///////////////////////////////////////////////////여기부터 상세정보//////////////////////////////////////////////////////

    $(".detail-span").on("click", "button.uploadBtn", function(event){
      event.preventDefault();

      $.ajax({
        url : "uploadDetail",
        type : "POST",
        data : getInputFile($(".detail-span")),
        dataType : 'json',
        contentType : false,
        processData : false,
        success : function(result){
          $(".detail-span").find(".uploadBtn").attr("class", "upload uploadBtn");
          $(".detail-span").find(".deleteBtn").attr("class", "uploadActive deleteBtn");
          $(".detail-span").find(".file-input").attr("class", "input file-input");

          showUploadedFile(result, ".detail-span");				// 결과 화면 보여주기(showUploadedFile(태그))
        }
      });
    })

    $(".detail-span").on("click", "button.deleteBtn", function(event){
      event.preventDefault();

      var targetFile = $(".detail-span").find(".deleteBtn").data("file");
      var type = $(".detail-span").find(".deleteBtn").data("type");
      console.log("targetFile : " + targetFile + " / type : " +  type);


      $.ajax({
        url:'deleteImage',
        data: {filePath : targetFile, type : type},
        dataType: 'text',
        type:'post',
        success : function(result){
          alert("상세정보 삭제");
          $(".detail-span").find(".uploadBtn").attr("class", "uploadActive uploadBtn");
          $(".detail-span").find(".deleteBtn").attr("class", "upload deleteBtn");
          $(".detail-span").find(".deleteBtn").removeAttr('data-file');
          $(".detail-span").find(".deleteBtn").removeAttr('data-type');
          $(".detail-span").find(".file-input").val("");
          $(".detail-span").find(".file-image").find("img").remove();
          $(".detail-span").find(".file-input").attr("class", "inputActive file-input");
        }
      });
    })

    ////////////////////////////////////////여기가 DB에 넣을 Controller에 전송/////////////////////////////////////////////////
    // 이미지 데이터를 DB저장 Controller에 전달
    $(".insertProduct").on("click", function(event){
      event.preventDefault();

      var productData = {
        'product':{},
        'thumbnail':[],
        'detail':""};

      productData['product']['p_name'] = $("#p_name").val();
      productData['product']['p_subtitle'] = $("#p_subtitle").val();
      productData['product']['p_category'] = $("#p_category").val();
      productData['product']['p_period'] = 1;


      $(".thumbnail-span").find(".deleteBtn").each(function() {
        productData['thumbnail'].push($(this).data("file"));
      });
      productData['detail'] = $(".detail-span").find(".deleteBtn").data("file");
      console.log(">> , ", productData);

      $.ajax({
        type: "post",
        url: "register",
        data: JSON.stringify(productData),
        contentType: "application/json; charset=utf8",
        success: function (result) {
          alert("저장 성공")
        }
      });

    })
  })
</script>