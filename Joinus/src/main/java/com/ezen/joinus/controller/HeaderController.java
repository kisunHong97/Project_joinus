package com.ezen.joinus.controller;

import com.ezen.joinus.mappers.CartMapper;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.vo.BusinessUserVO;
import com.ezen.joinus.vo.CartVO;
import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.ProductVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class HeaderController {
    @Setter(onMethod_=@Autowired)
    private CartMapper cartMapper;

    @Setter(onMethod_=@Autowired)
    private ProductService productService;


    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        System.out.println("작동되나요? 마이페이지 컨트롤러");
        // 세션에서 로그인한 사용자 정보를 가져옵니다.
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
                System.out.println("작동되나요? 사업자가 로그인되어있어요");
                return  "business/businessmypage";
            } else if (customerloginUser != null) {
                // 고객용 마이페이지를 보여줍니다.
                model.addAttribute("customer", customerloginUser);
                System.out.println("작동되나요? 고객이 로그인되어있어요");
                return "customer/customermypage";
            } else {
                // 알 수 없는 역할인 경우 에러 페이지를 보여줍니다.
                return "error";
            }
        }
    }
    @GetMapping("/mycart")
    public String myCart(HttpSession session, Model model) {
        System.out.println("작동되나요? 장바구니 컨트롤러");
        // 세션에서 로그인한 사용자 정보를 가져옵니다.
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
                System.out.println("장바구니 페이지 작동되나요? 사업자");
                return  "business/businessbasket";
            } else if (customerloginUser != null) {
                // 고객용 마이페이지를 보여줍니다.
                String u_id = (String) session.getAttribute("id"); // 조회할 사용자 아이디
                List<CartVO> cart = cartMapper.getCartItems(u_id); // 장바구니 상품 조회 메서드 호출

                for (CartVO item : cart) {
                    int pno = item.getPno();
                    ProductVO product = productService.getProductContents(pno); // 해당 상품 정보 조회 메서드 호출
                    item.setProduct(product); // CartVO 객체에 상품 정보 설정
                }

                System.out.println("장바구니 vo: " + cart);
                System.out.println("장바구니 페이지 로그인된 사용자 아이디: " + u_id);
                model.addAttribute("cart", cart);
                return "customer/customerbasket";

            } else {
                // 알 수 없는 역할인 경우 에러 페이지를 보여줍니다.
                return "error";
            }
        }
    }
}
