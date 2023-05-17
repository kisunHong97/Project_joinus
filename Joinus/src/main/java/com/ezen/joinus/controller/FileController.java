package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.UUID;

@Controller
@Log4j
public class FileController {
    // 이미지 파일 관리
    // 삽입 Register는 각 Controller에 있고 display, 삭제 Delete는 FileController에서 처리


    // 데이터 삽입 시 문자열로된 이미지파일 주소를 분해
    public static AttachFileDTO file_table_form(int imageNumber, String path, char type){
        // 폴더 경로 분해
        String folderPath = path.substring(0, path.lastIndexOf('/'));
        // UUID 분해
        String fileNameWithExtension = path.substring(path.lastIndexOf('/') + 1);
        String uuid = fileNameWithExtension.split("_")[0];
        // 파일 이름 분해
        String fileName = fileNameWithExtension.split("_")[1];
        AttachFileDTO dto = new AttachFileDTO();
        dto.setFileName(fileName);
        dto.setUploadPath(folderPath);
        dto.setUuid(uuid);
        dto.setImage(type);
        if(type == 'S')
            dto.setSno(imageNumber);
        if(type == 'T' || type == 'I')
            dto.setPno(imageNumber);
        return dto;
    }

    // 이미지 파일의 판단
    private static boolean checkImageType(File file) {
        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 폴더 생성 : 가게를 구분할 폴더를 추가할 예정
    private static String getFolder(String dataTile) {
        return dataTile; // File.separator 이게 url의 '\'를 나타낸다.
    }

    // 화면 보여주기
    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName){
        File file = new File("c:\\upload\\" +fileName);

        // 이미지파일에 직접 접근하여 가져올 수 없기 때문에, byte로 변환 후 이미지파일을 가져온다.
        ResponseEntity<byte[]> result =null;
        try {
            HttpHeaders header =new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<> (FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static AttachFileDTO uploadImage(String folderName, MultipartFile[] uploadFile){
        AttachFileDTO attachDTO = new AttachFileDTO();

        // 업로드되는 파일 기본 위치
        String uploadFolder = "c:\\upload";

        // 폴더 상세 위치 지정(없으면 폴더 생성)
        // 이제 파일명만 구분하면 줄이기 가능인데..... 기능 일부분만 분해하자
        String fileFolderPath = getFolder(folderName);
        File filePath = new File(uploadFolder, fileFolderPath);
        if(filePath.exists() == false) {
            filePath.mkdirs();
        }

        // 주소를 포함한 파일경로를 가져와서, 원본 파일 이름만 빼오기
        String fileName = uploadFile[0].getOriginalFilename();
        // * : '\\'기준으로 나누고, 마지막 인덱스만 가져온다.
        fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
        attachDTO.setFileName(fileName); // 파일 이름 저장

        // 중복 방지를 위한 난수 생성
        UUID uuid = UUID.randomUUID();
        attachDTO.setUuid(uuid.toString());

        // 원본 파일명에 난수 추가
        fileName = uuid.toString() + "_" + fileName;

        try {
            // File(업로드 위치, 파일 이름)으로 새 파일 만듬
            File saveFile = new File(filePath, fileName);
            // 임시저장소(temp)에서 실제 저장소로 이동(업로드 위치에 실제로 저장)
            uploadFile[0].transferTo(saveFile);
            attachDTO.setUploadPath(fileFolderPath); // 업로드 위치 저장
            // 폴더 이름에 따라 이미지 종류 판단
            if(checkImageType(saveFile)) {
                String path = attachDTO.getUploadPath();
                if(path.startsWith("thumbnail"))                        // startsWith("ABC"); "ABC"로 시작하는 문자열이면
                    attachDTO.setImage('T');
                if(path.startsWith("detail"))
                    attachDTO.setImage('I');
                if(path.startsWith("store"))
                    attachDTO.setImage('S');
                // >>> 썸네일 파일 생성
//                FileOutputStream thumbnail = new FileOutputStream(new File(thumbnailPath, "s_" + thumbnailName));     // 파일 생성 : s_난수 + 파일 이름
//                Thumbnailator.createThumbnail(uploadFile[0].getInputStream(), thumbnail, 400, 400);                   // 썸네일 생성 : (파일업로드, 원본파일, width, hegith)
//                thumbnail.close();
            }

        } catch (Exception e) {
            log.error(e.getMessage());
        }
        System.out.println("파일 정보 : " + attachDTO);
        return attachDTO;
    }

    @PostMapping("/deleteImage")
    @ResponseBody
    public ResponseEntity<String> deleteImage(String filePath, String type){
        // 삭제할 폴더 기본 위치 지정
        String uploadFolder = "c:\\upload\\";
        File file;
        try {
            // 주소를 디코딩하여 실제 이미지 파일에 접근
            file = new File(uploadFolder+ URLDecoder.decode(filePath, "UTF-8"));
            // 이미지 파일 삭제
            file.delete();
            // >>> 파일데이터가 이미지면 썸네일 파일도 삭제
//            if(type.equals("image")) {
//                String largeFileName = file.getAbsolutePath().replace("s_", "");
//                file = new File(largeFileName);
//                file.delete();
//            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
}



// ------------------------------ 이미지 업로드용 컨트롤러(통합 전) ---------------------
//    // 썸네일 파일 다운로드
//    @PostMapping(value = "/uploadImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//    @ResponseBody
//    public ResponseEntity<AttachFileDTO> uploadImage(MultipartFile[] uploadFile) {
//        // 파일 정보 저장할 DTO(파일이름, 파일위치, 중복방지 난수, 이미지 종류)
//        AttachFileDTO attachDTO = new AttachFileDTO();
//        // 업로드되는 파일 기본 위치
//        String uploadFolder = "c:\\upload";
//
//        // 폴더 상세 위치 지정(없으면 폴더 생성)
//        // 이제 파일명만 구분하면 줄이기 가능인데..... 기능 일부분만 분해하자
//        String fileFolderPath = getFolder("thumbnail");
//        File filePath = new File(uploadFolder, fileFolderPath);
//        if(filePath.exists() == false) {
//            filePath.mkdirs();
//        }
//
//        // 주소를 포함한 파일경로를 가져와서, 원본 파일 이름만 빼오기
//        String fileName = uploadFile[0].getOriginalFilename();
//        // * : '\\'기준으로 나누고, 마지막 인덱스만 가져온다.
//        fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
//        attachDTO.setFileName(fileName); // 파일 이름 저장
//
//        // 중복 방지를 위한 난수 생성
//        UUID uuid = UUID.randomUUID();
//        attachDTO.setUuid(uuid.toString());
//
//        // 원본 파일명에 난수 추가
//        fileName = uuid.toString() + "_" + fileName;
//
//        try {
//            // File(업로드 위치, 파일 이름)으로 새 파일 만듬
//            File saveFile = new File(filePath, fileName);
//            // 임시저장소(temp)에서 실제 저장소로 이동(업로드 위치에 실제로 저장)
//            uploadFile[0].transferTo(saveFile);
//            attachDTO.setUploadPath(fileFolderPath); // 업로드 위치 저장
//            // 폴더 이름에 따라 이미지 종류 판단
//            if(checkImageType(saveFile)) {
//                String path = attachDTO.getUploadPath();
//                if(path.startsWith("thumbnail"))                        // startsWith("ABC"); "ABC"로 시작하는 문자열이면
//                    attachDTO.setImage('T');
//                if(path.startsWith("detail"))
//                    attachDTO.setImage('I');
//                if(path.startsWith("store"))
//                    attachDTO.setImage('S');
//                // >>> 썸네일 파일 생성
////                FileOutputStream thumbnail = new FileOutputStream(new File(thumbnailPath, "s_" + thumbnailName));     // 파일 생성 : s_난수 + 파일 이름
////                Thumbnailator.createThumbnail(uploadFile[0].getInputStream(), thumbnail, 400, 400);                   // 썸네일 생성 : (파일업로드, 원본파일, width, hegith)
////                thumbnail.close();
//            }
//
//        } catch (Exception e) {
//            log.error(e.getMessage());
//        }
//        System.out.println("파일 정보 : " + attachDTO);
//        return new ResponseEntity<>(attachDTO, HttpStatus.OK);
//    }
