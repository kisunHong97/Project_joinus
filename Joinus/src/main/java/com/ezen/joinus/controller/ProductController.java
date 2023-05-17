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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Log4j
@Controller
public class ProductController {


    @Setter(onMethod_ = @Autowired)
    private ProductService pservice;

    @Setter(onMethod_ = @Autowired)
    private FileService fservice;


    @Setter(onMethod_=@Autowired)
    private ProductService productService;

    @Setter(onMethod_=@Autowired)
    private FileService fileService;

    // ---------------------- 레지스터 시작 ------------------------
    // (1) 똑같은 곳에서 썸네일 2번째 삭제부터 삭제가 안된다.
    // 흐름 : 시퀀스 넘버에서 다음 pno만 미리 가져와서 사용한 다음
    //      등록할 때는 가져온 pno를 직접 넣어서 DB에 데이터 삽입
    @GetMapping("/register")
    public String register(HttpSession session) {
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        return "product/register";
    }


    @PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String registerPost(@RequestBody Map<String, Object> productData) throws UnsupportedEncodingException {
        List<String> thumbnails = (List<String>) productData.get("thumbnail");
        String detail = (String) productData.get("detail");

        ObjectMapper objectMapper = new ObjectMapper();
        ProductVO product = objectMapper.convertValue(productData.get("product"), ProductVO.class);

        int imagePno = productService.getNextPno();
        int imageSno = 1;

        // p_content가 없어서 오류(not null 해제해야함)
        product.setP_content("임시데이터");
        product.setSno(imageSno);
        product.setPno(imagePno);

        product.setP_period(1);
        pservice.registerProduct(product);


        productService.registerProduct(product);


        List<AttachFileDTO> attachList = new ArrayList<>();

        for (String filePath : thumbnails) {
            attachList.add(FileController.file_table_form(imagePno, filePath, 'T'));
        }
        attachList.add(FileController.file_table_form(imagePno, detail, 'I'));

        System.out.println("33333");

        for (AttachFileDTO attach : attachList) {
            fservice.insertThumbnail(attach);

        for(AttachFileDTO attach: attachList){
            fileService.registerProductImage(attach);

        }

        return "redirect:/product_board";
    }

    // 썸네일 파일 다운로드
    @PostMapping(value = "/uploadThumbnail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadImage(MultipartFile[] uploadFile) {
        return new ResponseEntity<>(FileController.uploadImage("thumbnail", uploadFile), HttpStatus.OK);
    }

    // 상세정보 파일 다운로드
    @PostMapping(value = "/uploadDetail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadDetail(MultipartFile[] uploadFile) {
        System.out.println("Upload Detail Controller!!!");
        return new ResponseEntity<>(FileController.uploadImage("detail", uploadFile), HttpStatus.OK);
    }

    // ---------------------- 레지스터 종료 ------------------------

    @GetMapping("/update/{productID}")
    public String productUpdate(Model model, @PathVariable int pno) {
        ProductVO vo = pservice.getProductContents(pno);
        return "product_update";

    @GetMapping("/modify/{pno}")
    public String productUpdate(Model model, @PathVariable int pno){
        model.addAttribute("product", productService.getProductContents(pno));
        return "product/modify";

    }

    // 상품 수정 데이터가 들어오면 DB내용 수정
    // method=전송방식(method)형태, value=주소, consumes=받을데이터타입, produces=데이터반환타입

    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/update", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String productUpdatePost(@RequestBody ProductVO vo) {
        pservice.modifyProduct(vo);

    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH }, value = "/update", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public String productUpdatePost(@RequestBody ProductVO vo){
        productService.modifyProduct(vo);

        return "redirect:product/register";
    }

    @DeleteMapping("/delete/{productID}")

    public String productDelete(Model model, @PathVariable int pno) {
        pservice.removeProduct(pno);

    public String productDelete(Model model, @PathVariable int pno){
        productService.removeProduct(pno);

        return "redirect:/register";
    }


}