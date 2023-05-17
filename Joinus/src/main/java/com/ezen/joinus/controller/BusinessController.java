package com.ezen.joinus.controller;

import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.service.BusinessService;
import com.ezen.joinus.vo.BusinessUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class BusinessController {

    @Setter(onMethod_=@Autowired)
    private BusinessService businessUserService;

    @GetMapping("/businessinformation")//사업자 개인정보 수정화면 들어가기
    public String Businessinformation(Model model, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

        System.out.println("현재 사업자로그인~고객"+ businessUser);

        model.addAttribute("businessvo" ,businessUserService.getBusinessById(businessUser.getB_id()));
        return "business/businessinformation";
    }
    @GetMapping("/businessmodify")//사업자 개인정보 수정화면 들어가기 2
    public String businessmodify(Model model, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

        System.out.println("현재 사업자로그인~고객 수정하러 들어왔니?"+ businessUser);

        model.addAttribute("businessvo" ,businessUserService.getBusinessById(businessUser.getB_id()));
        return "business/binfomodify";
    }
    @PostMapping("/binfomodify")//사업자 정보 수정
    public String binfomodify(BusinessUserVO businessUserVO, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

        System.out.println(businessUser);

        businessUserService.modifyBusiness(businessUserVO);
        return "redirect:/product_board";
    }
}
