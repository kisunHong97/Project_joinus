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
            return "redirect:/login";
        } else {
            if (BusinessloginUser != null) {
                model.addAttribute("business", BusinessloginUser);
                List<InquiryVO> list = productService.allstoreinqu(BusinessloginUser.getBno());
                Collections.reverse(list);
                model.addAttribute("inqulist",list);
                return  "business/b_inquiry";
            } else if (customerloginUser != null) {
                String u_id = (String) session.getAttribute("customerid"); // 조회할 사용자 아이디
                List<InquiryVO> list = productService.userallinqu(u_id);
                Collections.reverse(list);
                model.addAttribute("u_id", u_id);
                model.addAttribute("inqulist",list);
                return "customer/c_inquiry";
            } else {
                return "error";
            }
        }

    }
}
