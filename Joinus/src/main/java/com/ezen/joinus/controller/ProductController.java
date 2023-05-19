package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.FileService;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;



import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Log4j
@Controller
public class ProductController {

    @Setter(onMethod_=@Autowired)
    private ProductService productService;

    @Setter(onMethod_=@Autowired)
    private FileService fileService;

    // ---------------------- 레지스터 시작 ------------------------
    // 흐름 : 시퀀스 넘버에서 다음 pno만 미리 가져와서 사용한 다음
    //      등록할 때는 가져온 pno를 직접 넣어서 DB에 데이터 삽입
    @GetMapping("/register")
    public String register(HttpSession session) {
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        return "product/register";
    }


    @PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String registerPost(@RequestBody Map<String, Object> productData) throws UnsupportedEncodingException {
        // {"thumbnail" : [썸네일주소, ...]}을 가져와서 key값으로 불러오기
        List<String> thumbnails = (List<String>)productData.get("thumbnail");
        String detail = (String) productData.get("detail");

        // {"product":{"p_name":이름, "p_inst":소개글...}을 가져와서 key값이 ProductVO의 변수와 맞는 이름에 값 넣기
        ObjectMapper objectMapper = new ObjectMapper();
        ProductVO product = objectMapper.convertValue(productData.get("product"), ProductVO.class);

        // sno를 못받았기 때문에 임의의 값 지정
        int imageSno = 1;
        product.setSno(imageSno);

        // products_table에 데이터 삽입
        System.out.println("PRODUCT>>" + product);
        productService.registerProduct(product);

        // file_product_table에 넣기위한 pno구하기
        int imagePno = productService.getMaxPno();

        // attachList에 썸네일('T')과 상세정보('I') 이미지를 다 넣고 DB에 삽입
        List<AttachFileDTO> attachList = new ArrayList<>();

        for(String filePath : thumbnails){
            attachList.add(FileController.file_table_form(imagePno, filePath, 'T'));
        }
        attachList.add(FileController.file_table_form(imagePno, detail, 'I'));

        for(AttachFileDTO attach: attachList){
            fileService.registerProductImage(attach);
        }

        // ajax의 success함수에 전송, 다른 주소로 갈라면 jquey에서 local.herf="주소" 같은걸로 이동해야한다.
        return "success";
    }

    // 썸네일 파일 다운로드
    @PostMapping(value = "/uploadThumbnail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadImage(MultipartFile[] uploadFile) {
        // 이미지 파일이 있는 주소묶음을 uploadPath, fileName, uuid로 분해해서 데이터 전송 (폴더이름, 파일주소)
        return new ResponseEntity<>(FileController.uploadImage("thumbnail", uploadFile), HttpStatus.OK);
    }

    // 상세정보 파일 다운로드
    @PostMapping(value = "/uploadDetail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadDetail(MultipartFile[] uploadFile) {
        // 이미지 파일이 있는 주소묶음을 uploadPath, fileName, uuid로 분해해서 데이터 전송 (폴더이름, 파일주소)
        return new ResponseEntity<>(FileController.uploadImage("detail", uploadFile), HttpStatus.OK);
    }

    // ---------------------- 레지스터 종료 ------------------------
    // ---------------------- 데이터 수정 시작 ------------------------
    @GetMapping("/modify/{pno}")
    public String modify(Model model, @PathVariable int pno){
        // products_table에서 데이터를 가져오기
        ProductVO vo = productService.getProductContents(pno);
        // pno를 이용해서 썸네일 주소 가져오기
        vo.setThumbnailList(fileService.selectThumbnailList(vo.getPno()));
        // pno를 이용해서 상세정보 주소 가져오기
        vo.setDetail(fileService.selectDetail(vo.getPno()));

        // Date타입 -> String타입으로 변환
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDate = sdf.format(vo.getP_startDate());
        String endDate = sdf.format(vo.getP_endDate());

        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("product", vo);
        return "product/modify";
    }


    @PostMapping(value = "/modifyPost", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String modifyPost(@RequestBody Map<String, Object> productData) throws UnsupportedEncodingException {
        // 2. 디테일 삭제를 하면 2번 발동된다.

        // {"thumbnail" : [썸네일주소, ...]}을 가져와서 key값으로 불러오기
        List<String> thumbnails = (List<String>)productData.get("thumbnail");
        String detail = (String) productData.get("detail");

        // {"product":{"p_name":이름, "p_inst":소개글...}을 가져와서 key값이 ProductVO의 변수와 맞는 이름에 값 넣기
        ObjectMapper objectMapper = new ObjectMapper();
        ProductVO product = objectMapper.convertValue(productData.get("product"), ProductVO.class);

        // products_table에 데이터 수정
        System.out.println("product : " + product);
        productService.modifyProduct(product);

        // pno와 sno는 jsp파일에서 가져오기때문에 productVO에서 사용

        // attachList에 썸네일('T')과 상세정보('I') 이미지를 다 넣고 DB에 삽입
        List<AttachFileDTO> attachList = new ArrayList<>();

        for(String filePath : thumbnails){
            attachList.add(FileController.file_table_form(product.getPno(), filePath, 'T'));
        }
        attachList.add(FileController.file_table_form(product.getPno(), detail, 'I'));

        // 이미지는 전부 삭제하고 다시 넣기
        fileService.removeProductImage(product.getPno());

        for(AttachFileDTO attach: attachList){
            fileService.registerProductImage(attach);
        }

        return "success";
    }


    @DeleteMapping("/delete/{productID}")
    public String productDelete(Model model, @PathVariable int pno){
        productService.removeProduct(pno);
        return "redirect:/register";
    }


}