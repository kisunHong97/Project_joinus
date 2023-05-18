package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.BusinessService;
import com.ezen.joinus.service.FileService;
import com.ezen.joinus.service.StoreService;
import com.ezen.joinus.vo.BusinessUserVO;
import com.ezen.joinus.vo.StoreVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
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

    @PostMapping(value = "/uploadStoreImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<AttachFileDTO> uploadImage(MultipartFile[] uploadFile) {
        System.out.println("/uploadStoreImage 들어왔다");
        return new ResponseEntity<>(FileController.uploadImage("store", uploadFile), HttpStatus.OK);
    }

    @GetMapping("/s_nameCheck")
    public @ResponseBody int s_nameCheck(String s_name){
        System.out.println("storename:"+s_name);

        int result = storeService.s_nameCheck(s_name);
        System.out.println("result : " + result);
        return result;

    }
    @GetMapping("/storeinformation")
    public String storeinformation(HttpSession session, Model model){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("스토어 정보 수정에 들어온 현재 사업자"+ businessUser);
        model.addAttribute("storeinformation",storeService.getStoreBno(businessUser.getBno()));
        return "business/storeinformation";
    }
    @GetMapping("/storemodify")
    public String storemodify(HttpSession session, Model model){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("스토어 정보 수정2에 들어온 현재 사업자"+ businessUser);
        model.addAttribute("storeinformation",storeService.getStoreBno(businessUser.getBno()));
        return "business/storemodify";
    }
    @PostMapping("/storeinfomodify")
    public String storeinfomodify(StoreVO storeVO,HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("vo: "+storeVO);
        storeVO.setBno(businessUser.getBno());
        storeService.updateStore(storeVO);
        return "redirect:/product_board";
    }


    //마이페이지, 장바구니 구현 (고객, 사업자 따로)

}
