package com.ezen.joinus.controller;


import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.mappers.CustomerUserMapper;
import com.ezen.joinus.vo.BusinessUserVO;
import com.ezen.joinus.vo.CustomerUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @Setter(onMethod_=@Autowired)
    private BusinessUserMapper mapper;

    @Setter(onMethod_=@Autowired)
    private CustomerUserMapper userMapper;


    @GetMapping("/b_idCheck")
    public @ResponseBody int b_idCheck(String b_id){
        System.out.println("b_id:"+b_id);

        int result = mapper.b_idCheck(b_id);
        System.out.println("result : " + result);
        return result;

    }
    @GetMapping("/login")
    public String login(HttpSession session){
        Long b_id = (Long) session.getAttribute("userid");
        if(b_id !=null){
            return "main/login";
        }
        return "main/login";
    }

    @PostMapping("/login")
    public String login(String b_id, String b_pwd, HttpSession session, HttpServletRequest request) throws Exception {
        BusinessUserVO BusinessUserVO=mapper.MemberLogin(b_id);
        System.out.println(b_id);
        System.out.println(b_pwd);
        if(BusinessUserVO==null) return "main/login";
        else { //id는 맞음
            if(!BusinessUserVO.getB_pwd().equals(b_pwd)) { //비밀번호는 틀림
                session.setAttribute("errormessage","로그인 정보가 맞지 않습니다.");
                return "main/login";
            }else { //비밀번호도 맞음
                session.setAttribute("businessid",BusinessUserVO.getB_id());
                session.setAttribute("BusinessUserVO", BusinessUserVO);
                return "redirect:/product_board";

            }
        }

    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/product_board";

    }
    //고객
    @GetMapping("/u_idCheck")
    public @ResponseBody int u_idCheck(String u_id){
        System.out.println("u_id:"+u_id);

        int result = userMapper.u_idCheck(u_id);
        System.out.println("result : " + result);
        return result;

    }
    @PostMapping("/customerlogin")
    public String customerlogin(String u_id, String u_pwd, HttpSession session, HttpServletRequest request) throws Exception {
        CustomerUserVO customerUserVO = userMapper.CustomerLogin(u_id);

        System.out.println(u_id);
        System.out.println(u_pwd);
        if(customerUserVO==null) return "main/login";
        else { //id는 맞음
            if(!customerUserVO.getU_pwd().equals(u_pwd)) { //비밀번호는 틀림
                session.setAttribute("cerrormessage","로그인 정보가 맞지 않습니다.");
                return "main/login";
            }else { //비밀번호도 맞음
                session.setAttribute("customerid",customerUserVO.getU_id());
                session.setAttribute("customerUserVO", customerUserVO);
                return "redirect:/product_board";

            }
        }

    }
}

