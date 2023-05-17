package com.ezen.joinus.controller;

import com.ezen.joinus.service.CustomerService;
import com.ezen.joinus.vo.CustomerUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CustomerController {

    @Setter(onMethod_=@Autowired)
    private CustomerService customerService;

    //개인정보 불러오기
    @GetMapping("/myinformation")
    public String customerinfo( Model model, HttpSession session ){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        System.out.println("현재 로그인~고객"+ customerloginUser);
        System.out.println("고객정보 컨트롤러 들어오니?");
        model.addAttribute("customervo",customerService.getCustomerById(customerloginUser.getU_id()));
        return "customer/customerinformation";
    }

    @GetMapping("/customermodify")
    public String customermodify( Model model, HttpSession session){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        System.out.println("현재 로그인~고객 modifycontroller"+ customerloginUser);
        model.addAttribute("customervo",customerService.getCustomerById(customerloginUser.getU_id()));
        return "customer/cinfomodify";
    }

    @PostMapping ("/cinfomodify")
    public String customerinfomodify(CustomerUserVO customerUserVO, HttpSession session){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        System.out.println("cinfomodify 컨트롤러에 들어왔니?");
        int uno = customerloginUser.getUno();
        System.out.println("현재 로그인사람의 uno"+uno);
        System.out.println(customerUserVO);
        customerService.modifyCustomer(customerUserVO);
        return "redirect:/product_board";

    }
    @GetMapping("/customerdelete")
    public String cinfodelete(HttpSession session,Model model){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        model.addAttribute("customervo",customerloginUser);
        session.setAttribute("errormessage", "비밀번호가 맞지 않습니다.");
        return "customer/cinfodelete";
    }

    @GetMapping("/customerinfodelete")
    public String customerinfodelete(HttpSession session, String u_id,String u_pwd,Model model){
        System.out.println("delete컨트롤러로 들어오나?");
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        System.out.println("삭제"+customerloginUser);
        model.addAttribute("customervo",customerloginUser);
        System.out.println("비밀번호"+u_pwd);
        u_id = customerloginUser.getU_id() ;
        System.out.println("현재로그인 아이디"+u_id);
        customerService.removeCustomer(u_id);
        session.invalidate();
        return "redirect:/product_board";
    }

    //고객 포인트 조회 //0512 선기 추가
    @GetMapping("/customerpoint")
    public String customerpoint(HttpSession session,Model model,int point){

        System.out.println("고객 포인트 컨트롤러 들어오나?" +point);
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        System.out.println("customerloginUser 100): " +customerloginUser);
        model.addAttribute("customervo",customerloginUser);
        model.addAttribute("point",point);
        return "customer/customerpoint";
    }

    @PostMapping("/customerpoint")
    public String customerbuypoint(HttpSession session,Model model,int point){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        model.addAttribute("customervo",customerloginUser);
        model.addAttribute("point",point);
        return "customer/customerpointcharge";
    }
    //고객 포인트 충전하기
    @GetMapping("/customerpointcharge")
    public String customerpointcharge(HttpSession session, CustomerUserVO vo,int buypoint,Model model){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
//        String id = (String) session.getAttribute("id");
        String id = customerloginUser.getU_id();
        System.out.println("id : " + id);
        System.out.println("현재 포인트 충전할 고객의 아이디"+customerloginUser.getU_id());
        System.out.println("충전 포인트"+buypoint);
        System.out.println("현재 포인트"+customerloginUser.getBuypoint());
        int point = customerloginUser.getBuypoint();
        int buypointt = buypoint;
        int total = point + buypointt;
        vo.setBuypoint(total);
        customerService.update(total, id);
        model.addAttribute("customervo",customerloginUser);
        return "redirect:/mypage";
    }

//담주에.. 성공하면 포인트 알맞게나오게하기
}
