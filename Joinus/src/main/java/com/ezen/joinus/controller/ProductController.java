package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.FileService;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.vo.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Log4j
@Controller
public class ProductController {
    private int imagePno;

    @Setter(onMethod_=@Autowired)
    private ProductService pservice;

    @Setter(onMethod_=@Autowired)
    private FileService fservice;

    // ---------------------- 레지스터 시작 ------------------------
    // (1) 똑같은 곳에서 썸네일 2번째 삭제부터 삭제가 안된다.
    // (2) 썸네일 파일을 만들지만 원본파일을 보여주는데 썸네일파일과 상세정보 파일을 어떻게 해야할까
    @GetMapping("/register")
    public String register(){
        return "product/register";
    }

    // p_content가 없어서 오류(not null 해제해야함)
    @PostMapping("/register")
    public String registerPost(ProductVO vo){
        // Sno를 강제로 고정했음
        vo.setSno(1);

        vo.setP_content("임시데이터");
        System.out.println("VO : " + vo);
        pservice.registerProduct(vo);
        imagePno = pservice.getPnoByNameAndSubTitle(vo);
        System.out.println("PNO!!!! : " + imagePno);;
        return "redirect:/nextRegister";
    }

    @GetMapping("/nextRegister")
    public String nextRegister(){
        return "product/nextRegister";
    }

    public AttachFileDTO file_table_form(String path, char type){
        // 폴더 경로 분해
        String folderPath = path.substring(0, path.lastIndexOf('/'));
        // UUID 분해
        String fileNameWithExtension = path.substring(path.lastIndexOf('/') + 1);
        String uuid = fileNameWithExtension.split("_")[0];
        // 파일 이름 분해
        String fileName = fileNameWithExtension.split("_")[1];
        return new AttachFileDTO(imagePno, imagePno, fileName, folderPath, uuid, type);
    }


    @PostMapping(value = "/nextRegister", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> nextRegisterPost(@RequestBody Map<String, Object> imageData) throws UnsupportedEncodingException {
        System.out.println("Detail Arr : " + imageData.get("detail"));

        List<String> thumbnails = (List<String>) imageData.get("thumbnail");
        String detail = (String)imageData.get("detail");
        List<AttachFileDTO> attachList = new ArrayList<>();

        for(String filePath : thumbnails){
            attachList.add(file_table_form(filePath, 'T'));
        }
        attachList.add(file_table_form(detail, 'I'));

        for(AttachFileDTO attach: attachList){
            fservice.insertThumbnail(attach);
        }

        return new ResponseEntity<>("success", HttpStatus.OK);
    }
    // ---------------------- 레지스터 종료 ------------------------
    @GetMapping("/update/{productID}")
    public String productUpdate(Model model, @PathVariable int pno){
        ProductVO vo = pservice.getProductContents(pno);
        return "product_update";
    }

    // 상품 수정 데이터가 들어오면 DB내용 수정
    // method=전송방식(method)형태, value=주소, consumes=받을데이터타입, produces=데이터반환타입
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH }, value = "/update", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String productUpdatePost(@RequestBody ProductVO vo){
        pservice.modifyProduct(vo);
        return "redirect:product/register";
    }

    @DeleteMapping("/delete/{productID}")
    public String productDelete(Model model, @PathVariable int pno){
        pservice.removeProduct(pno);
        return "redirect:/register";
    }
    //////////////////////////////// 이미지 관련 ////////////////////////////////////////
    // 이미지 파일의 판단
    private boolean checkImageType(File file) {
        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    // 폴더 생성 : 가게넘버\\상품넘버
    private String getFolder(ProductVO vo, String dataTile) {
        return dataTile+File.separator+vo.getSno()+File.separator+vo.getPno();
    }

    // 썸네일 파일 다운로드
    @PostMapping(value = "/uploadImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadImage(MultipartFile[] uploadFile) {
        AttachFileDTO attachDTO = new AttachFileDTO();                       // 파일 정보 저장할 DTO(파일이름, 파일위치, 중복방지 난수, 이미지판단)
        String uploadFolder = "c:\\upload";                                // 업로드되는 위치

        // pno를 2로 고정했다.
        ProductVO vo = pservice.getProductContents(imagePno);
        System.out.println(">> " + vo);
        String thumbnailFolderPath = getFolder(vo, "thumbnail");                           // 폴더 생성

        // 폴더 없으면 생성(있으면 유지)
        File thumbnailPath = new File(uploadFolder, thumbnailFolderPath);
        if(thumbnailPath.exists() == false) {
            thumbnailPath.mkdirs();
        }

        // 주소를 포함한 파일경로를 가져와서, 원본 파일 이름만 빼오기
        String thumbnailName = uploadFile[0].getOriginalFilename();
        thumbnailName = thumbnailName.substring(thumbnailName.lastIndexOf("\\") + 1);    // '\\'기준으로 나누고, 마지막 인덱스만 가져온다.
        attachDTO.setFileName(thumbnailName);

        // 중복 방지를 위한 난수 생성
        UUID uuid = UUID.randomUUID();
        attachDTO.setUuid(uuid.toString());

        thumbnailName = uuid.toString() + "_" + thumbnailName;                // 난수 + 파일 이름

        try {
            File saveFile = new File(thumbnailPath, thumbnailName);           // File(업로드 위치, 파일 이름)으로 새 파일 만듬
            uploadFile[0].transferTo(saveFile);                               // 임시저장소에서 실제 저장소로 이동(업로드 위치에 실제로 저장)
            attachDTO.setUploadPath(thumbnailFolderPath);           // 파일 정보 : 업로드 위치 저장

            if(checkImageType(saveFile)) {	                                  // 파일이 이미지인지 검사
                attachDTO.setImage('T');                                     // 파일 정보 : 이미지 파일 확정(true)
                FileOutputStream thumbnail = new FileOutputStream(new File(thumbnailPath, "s_" + thumbnailName));     // 파일 생성 : s_난수 + 파일 이름
                Thumbnailator.createThumbnail(uploadFile[0].getInputStream(), thumbnail, 400, 400);                   // 썸네일 생성 : (파일업로드, 원본파일, width, hegith)
                thumbnail.close();
            }

        } catch (Exception e) {
            log.error(e.getMessage());
        }
        System.out.println("파일 정보 : " + attachDTO);
        return new ResponseEntity<>(attachDTO, HttpStatus.OK);
    }

    // 상세정보 파일 다운로드
    @PostMapping(value = "/uploadDetail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadDetail(MultipartFile[] uploadFile) {
        AttachFileDTO attachDTO = new AttachFileDTO();                       // 파일 정보 저장할 DTO(파일이름, 파일위치, 중복방지 난수, 이미지판단)
        String uploadFolder = "c:\\upload";                                // 업로드되는 위치

        ProductVO vo = pservice.getProductContents(imagePno);
        System.out.println(">> " + vo);
        String detailFolderPath = getFolder(vo, "detail");                           // 폴더 생성

        // 폴더 없으면 생성(있으면 유지)
        File detailPath = new File(uploadFolder, detailFolderPath);
        if(detailPath.exists() == false) {
            detailPath.mkdirs();
        }

        // 주소를 포함한 파일경로를 가져와서, 원본 파일 이름만 빼오기
        String detailName = uploadFile[0].getOriginalFilename();
        detailName = detailName.substring(detailName.lastIndexOf("\\") + 1);    // '\\'기준으로 나누고, 마지막 인덱스만 가져온다.
        attachDTO.setFileName(detailName);

        // 중복 방지를 위한 난수 생성
        UUID uuid = UUID.randomUUID();
        attachDTO.setUuid(uuid.toString());

        detailName = uuid.toString() + "_" + detailName;                // 난수 + 파일 이름

        try {
            File saveFile = new File(detailPath, detailName);           // File(업로드 위치, 파일 이름)으로 새 파일 만듬
            uploadFile[0].transferTo(saveFile);                               // 임시저장소에서 실제 저장소로 이동(업로드 위치에 실제로 저장)
            attachDTO.setUploadPath(detailFolderPath);           // 파일 정보 : 업로드 위치 저장

            if(checkImageType(saveFile)) {	                                  // 파일이 이미지인지 검사
                attachDTO.setImage('I');                                     // 파일 정보 : 이미지 파일 확정(true)
            }

        } catch (Exception e) {
            log.error(e.getMessage());
        }
        System.out.println("파일 정보 : " + attachDTO);
        return new ResponseEntity<>(attachDTO, HttpStatus.OK);
    }

    // 화면 보여주기
    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName){
        log.info("display controller에서 fileName은 " +  fileName);
        File file = new File("c:\\upload\\" +fileName);
        log.info("file: " +file);
        ResponseEntity<byte[]> result =null;
        try {
            HttpHeaders header =new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<> (FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 썸네일 파일 삭제
    @PostMapping("/deleteImage")
    @ResponseBody
    public ResponseEntity<String> deleteImage(String filePath, String type){
        String uploadFolder = "c:\\upload\\";
        File file;
        try {
            file = new File(uploadFolder+ URLDecoder.decode(filePath, "UTF-8"));
            file.delete();
            System.out.println("type : " + type);
            if(type.equals("image")) {
                String largeFileName = file.getAbsolutePath().replace("s_", "");
                file = new File(largeFileName);
                file.delete();
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

    // 썸네일 파일 삭제
    @PostMapping("/deleteDetail")
    @ResponseBody
    public ResponseEntity<String> deleteDetail(String filePath, String type){
        String uploadFolder = "c:\\upload\\";
        File file;
        try {
            file = new File(uploadFolder+URLDecoder.decode(filePath, "UTF-8"));
            file.delete();
            System.out.println("type : " + type);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

}

//File saveFile = new File(".\\Thumbnail\\1\\2", "env.jfif");
//uploadFile[0].transferTo(saveFile);