package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.BusinessService;
import com.ezen.joinus.service.FileService;
import com.ezen.joinus.service.StoreService;
import com.ezen.joinus.vo.StoreVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;
import java.util.Map;

@Controller
public class StoreController {

    @Setter(onMethod_=@Autowired)
    private BusinessService businessService;

    @Setter(onMethod_=@Autowired)
    private StoreService storeService;

    @Setter(onMethod_=@Autowired)
    private FileService fileService;

    @RequestMapping("/storesignup")
    public String storesignup(){
        return "business/storesignup";
    }

    @PostMapping(value = "/uploadStoreImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadImage(MultipartFile[] uploadFile) {
        System.out.println("/uploadStoreImage 들어왔다");
        return new ResponseEntity<>(FileController.uploadImage("store", uploadFile), HttpStatus.OK);
    }

    // '/storesignup' 실행 전
    @PostMapping(value = "/storesignup", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String Store(@RequestBody Map<String, Object> storeData) throws UnsupportedEncodingException {
        String image = (String) storeData.get("storeImage");

        ObjectMapper objectMapper = new ObjectMapper();
        StoreVO store = objectMapper.convertValue(storeData.get("store"), StoreVO.class);

        System.out.println("image : " + image);
        System.out.println("store : " + store );

        store.setStoreimages("임시 이미지");

        store.setBno(businessService.getMaxBno());

        System.out.println("STORE REGISTER : " + store);

        storeService.registerStore(store);
//         sno 미리 받아서 파일_테이블 형식으로 만들고 넣기
        fileService.registerStoreImage(FileController.file_table_form(storeService.getMaxSno(), image, 'S'));

        return "main/login";
    }

    @GetMapping("/s_nameCheck")
    public @ResponseBody int s_nameCheck(String storename){
        System.out.println("storename:"+storename);

        int result = storeService.s_nameCheck(storename);
        System.out.println("result : " + result);
        return result;

    }


    //마이페이지, 장바구니 구현 (고객, 사업자 따로)

}
