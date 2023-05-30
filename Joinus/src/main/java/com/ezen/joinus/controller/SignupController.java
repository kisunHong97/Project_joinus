package com.ezen.joinus.controller;



import com.ezen.joinus.service.BusinessService;
import com.ezen.joinus.service.CustomerService;
import com.ezen.joinus.service.StoreService;
import com.ezen.joinus.vo.BusinessUserVO;
import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.StoreVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
;import java.io.UnsupportedEncodingException;
import java.util.Map;


@Controller
public class SignupController {

    @Setter(onMethod_=@Autowired)
    private BusinessService businessService;

    @Setter(onMethod_=@Autowired)
    private CustomerService customerService;

    @Setter(onMethod_=@Autowired)
    private StoreService storeService;



    @RequestMapping("/signup")
    public String signup(){
        return "business/signup";
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signupinfo(BusinessUserVO BusinessUserVO){
        try {
            businessService.registerBusiness(BusinessUserVO);
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
            customerService.insertCustomer(customerUserVO);
        }catch (DuplicateKeyException e){
            return "redirect:/customersignup?error_code=-1";
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/customersignup?error_code=-99";
        }
        return "main/login";
    }

    //스토어 등록
    // '/storesignup' 실행 전
    @PostMapping("/storesignup")
    public String Store(StoreVO store) {
        store.setBno(businessService.getMaxBno());
        try {storeService.insertStore(store);
        }catch (DuplicateKeyException e){return "redirect:/storesignup?error_code=-1";
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/storesignup?error_code=-99";
        }return "main/login";
    }



}
