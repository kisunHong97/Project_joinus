package com.ezen.joinus.controller;

import com.ezen.joinus.mappers.BusinessUserMapper;
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
    private BusinessUserMapper businessUserMapper;

    @GetMapping("/businessinformation")//사업자 개인정보 수정화면 들어가기
    public String Businessinformation(Model model, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("현재 사업자로그인~고객"+ businessUser);
        System.out.println("사업자 정보 컨트롤러 들어오니?");
        model.addAttribute("businessvo" ,businessUser);
        return "business/businessinformation";
    }
    @GetMapping("/businessmodify")//사업자 개인정보 수정화면 들어가기 2
    public String businessmodify(Model model, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("현재 사업자로그인~고객 수정하러 들어왔니?"+ businessUser);
        System.out.println("사업자 정보 수정 컨트롤러 들어오니?");
        model.addAttribute("businessvo" ,businessUser);
        return "business/binfomodify";
    }
    @PostMapping("/binfomodify")//사업자 정보 수정
    public String binfomodify(BusinessUserVO businessUserVO, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("binfomodify 컨트롤러에 들어왔니?");
        System.out.println(businessUser);
        businessUserMapper.modify(businessUserVO);
        return "redirect:/product_board";
    }
}
