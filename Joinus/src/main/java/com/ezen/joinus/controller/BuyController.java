package com.ezen.joinus.controller;

import com.ezen.joinus.service.*;
import com.ezen.joinus.vo.*;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class BuyController {
    @Setter(onMethod_=@Autowired)
    private StoreService storeService;
    @Setter(onMethod_=@Autowired)
    private ProductService productService;
    @Setter(onMethod_=@Autowired)
    private CustomerService customerService;
    @Setter(onMethod_=@Autowired)
    private PurchaseService purchaseService;


    @RequestMapping(value = "/board/buy", method = RequestMethod.GET)
    public String read(@ModelAttribute("ProductVO") ProductVO productVO, Model model, @RequestParam("pno") int pno, HttpSession session){
        // 스토어 정보 가져오기
//        BusinessStore = storeService.();
        // 상품 정보 가져오기
        productVO = productService.getProductContents(pno);
        System.out.println(productVO);
        model.addAttribute("productVO", productVO);

        // 사용자 정보 가져오기
        String u_id = (String) session.getAttribute("id");
        System.out.println("구매 페이지 로그인 된 사용자 아이디 불러오나?:"+u_id);
        CustomerUserVO customerUserVO = customerService.getCustomerById(u_id);
        System.out.println(customerUserVO);
        model.addAttribute("customerUserVO", customerUserVO);
        try{

        }catch (Exception e){
            System.out.println("구매 페이지 로그인 안해서 여기 진입 합니다.");
            productService.getProductContents(pno);
        }
        return "/board/buy";
    }

    // 해당 상품을 구매 목록에 추가하는 기능
    @PostMapping("/purchase")
    public ResponseEntity<String> purchase(PurchaseVO vo, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("구매 컨트롤러에 아이디 불러오나?:"+vo);

        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return ResponseEntity.badRequest().body("로그인 후 이용해주세요.");
        }

        CustomerUserVO customerUserVO = customerService.getCustomerById(id);
        System.out.println("사용자 정보:"+customerUserVO);
        // 사용자 정보가 없는 경우
        if (customerUserVO == null) {
            return ResponseEntity.badRequest().body("사용자만 이용 가능합니다.");
        }
        PurchaseVO purchaseVO = new PurchaseVO();
        purchaseVO.setPno(vo.getPno());
        purchaseVO.setU_id(customerUserVO.getU_id());
        purchaseVO.setP_name(vo.getP_name());
        purchaseVO.setP_period(vo.getP_period());
        purchaseVO.setMemo(vo.getMemo());
        purchaseVO.setP_price(vo.getP_price());
        purchaseVO.setCurrentDate(vo.getCurrentDate());
        purchaseVO.setFutureDate(vo.getFutureDate());
        System.out.println("purchaseVO:" + purchaseVO);
        purchaseService.productPurchase(purchaseVO);
        purchaseService.updateUserPoint(id, vo.getP_price());

        return new ResponseEntity(" 구매 목록에 추가되었습니다.", HttpStatus.OK);
    }

//    @GetMapping("/buyInfo")
//    public String buyInfo(Model model, HttpSession session) {
//        try {
//            String u_id = (String) session.getAttribute("id");
//            if (u_id != null) {
//                System.out.println("구매상품확인 컨트롤러 진입");
//                PurchaseVO purchaseVO = new PurchaseVO();
//                purchaseVO.setU_id(u_id);
//                purchaseService.getPurchaseInfo(purchaseVO);
//                System.out.println(purchaseVO);
//                model.addAttribute("buyInfo", purchaseVO);
//            }
//        } catch (Exception e) {
//            // 예외 처리
//        }
//        return "customer/customermypage";
//    }




}
