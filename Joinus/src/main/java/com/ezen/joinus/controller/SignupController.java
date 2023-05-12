package com.ezen.joinus.controller;



import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.mappers.CustomerUserMapper;
import com.ezen.joinus.vo.BusinessUserVO;
import com.ezen.joinus.vo.CustomerUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
;


@Controller
public class SignupController {

    @Setter(onMethod_=@Autowired)
    private BusinessUserMapper mapper;

    @Setter(onMethod_=@Autowired)
    private CustomerUserMapper userMapper;

    @RequestMapping("/signup")
    public String signup(){
        return "business/signup";
    }
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signupinfo(BusinessUserVO BusinessUserVO){
        try {
            mapper.insert(BusinessUserVO);
        }catch (DuplicateKeyException e){
            return "redirect:/singup?error_code=-1";
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/singup?error_code=-99";
        }
        return "business/signupstore";
    }


    @RequestMapping("/join")
    public String join(){
        return "main/join";
    }
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String busersignup(){
        return "business/signup";
    }


// 고객 회원가입
    @RequestMapping("/customerjoin")
    public String customerjoin(){
        return "customer/customersignup";
    }

    @RequestMapping(value = "/customerjoin", method = RequestMethod.POST)
    public String customersignup(){
        return "redirect:/customerjoin";
    }

    @RequestMapping(value = "/customersignup" ,method = RequestMethod.POST)
    public String customersignup(CustomerUserVO customerUserVO){
        try {
            userMapper.insert(customerUserVO);
        }catch (DuplicateKeyException e){
            return "redirect:/customersignup?error_code=-1";
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/customersignup?error_code=-99";
        }
        return "main/login";
    }


}
