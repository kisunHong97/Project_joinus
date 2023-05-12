package com.ezen.joinus.controller;

import com.ezen.joinus.mappers.StoreMapper;
import com.ezen.joinus.service.StoreService;
import com.ezen.joinus.vo.BusinessStore;
import com.ezen.joinus.vo.BusinessUserVO;
import lombok.Setter;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
public class StoreController {

    @Setter(onMethod_=@Autowired)
    private StoreService service;

    @Setter(onMethod_=@Autowired)
    private StoreMapper storeMapper;

    @RequestMapping("/storesignup")
    public String storesignup(){
        return "business/storesignup";
    }

    @RequestMapping(value = "/storesignup" ,method = RequestMethod.POST)
    public String Store(BusinessStore vo){
        System.out.println("컨트롤러어 :"+vo);
        Long bno = service.getMaxBno();
        service.storeInsert(vo);
        System.out.println(bno);

        return "main/login";
    }

    @GetMapping("/s_nameCheck")
    public @ResponseBody int s_nameCheck(String storename){
        System.out.println("storename:"+storename);

        int result = storeMapper.s_nameCheck(storename);
        System.out.println("result : " + result);
        return result;

    }


    //마이페이지, 장바구니 구현 (고객, 사업자 따로)

}
