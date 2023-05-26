package com.ezen.joinus.controller;

import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.vo.*;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;
//전체 주가!
@Controller
public class InquiryController {

    @Setter(onMethod_=@Autowired)
    private ProductService productService;

    @GetMapping("/inquiry")
    public String inquiry(HttpSession session, Model model){
        BusinessUserVO BusinessloginUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");

        if (BusinessloginUser == null && customerloginUser == null) {
            // 로그인한 사용자가 없는 경우 로그인 페이지로 리다이렉트합니다.
            return "redirect:/login";
        } else {
            // 사용자 역할에 따라 각각 다른 마이페이지를 보여줍니다.
            if (BusinessloginUser != null) {
                // 사업자용 마이페이지를 보여줍니다.
                model.addAttribute("business", BusinessloginUser);
                System.out.println("문의 내역 페이지 작동되나요? 사업자");
                List<InquiryVO> list = productService.allstoreinqu(BusinessloginUser.getBno());
                System.out.println("들어오나요list?:"+list);
                Collections.reverse(list);
                model.addAttribute("inqulist",list);
                return  "business/b_inquiry";
            } else if (customerloginUser != null) {
                // 고객용 마이페이지를 보여줍니다.
                String u_id = (String) session.getAttribute("customerid"); // 조회할 사용자 아이디
                List<InquiryVO> list = productService.userallinqu(u_id);
                Collections.reverse(list);
                System.out.println("문의 내역 페이지 로그인된 사용자 아이디: " + u_id);
                model.addAttribute("u_id", u_id);
                model.addAttribute("inqulist",list);
                return "customer/c_inquiry";

            } else {
                // 알 수 없는 역할인 경우 에러 페이지를 보여줍니다.
                return "error";
            }
        }

    }
}
