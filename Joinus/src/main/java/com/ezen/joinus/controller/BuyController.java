package com.ezen.joinus.controller;

import com.ezen.joinus.service.*;
import com.ezen.joinus.vo.*;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.rmi.server.ExportException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
    @Setter(onMethod_=@Autowired)
    private CartService cartService;

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
        purchaseVO.setSno(vo.getSno());
        purchaseVO.setPno(vo.getPno());
        purchaseVO.setU_id(customerUserVO.getU_id());
        purchaseVO.setP_name(vo.getP_name());
        purchaseVO.setP_price(vo.getP_price());
        purchaseVO.setMemo(vo.getMemo());
        purchaseVO.setStartDate(vo.getStartDate());
        purchaseVO.setEndDate(vo.getEndDate());
        System.out.println("purchaseVO:" + purchaseVO);
        purchaseService.productPurchase(purchaseVO);
        purchaseService.updateUserPoint(id, vo.getP_price());
        storeService.updateRevenue(vo.getP_price(), vo.getSno());
        RevenueVO revenueVO = new RevenueVO();
        revenueVO.setSno(vo.getSno());
        revenueVO.setRevenue_date(vo.getStartDate());
        revenueVO.setRevenue_amount(vo.getP_price());
        storeService.insertRevenue(revenueVO);

        return new ResponseEntity(" 구매 목록에 추가되었습니다.", HttpStatus.OK);
    }
    @PostMapping(value = "/cartPurchase", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> cartPurchase(@RequestBody Map<String, Object> cartBuyData, HttpSession session) throws UnsupportedEncodingException {
        String id = (String) session.getAttribute("id");
        System.out.println("장바구니에서 구매 컨트롤러에 아이디 불러오나?:" + id);
        System.out.println("장바구니에서 구매 컨트롤러에 구매 리스트 불러오나?:" + cartBuyData);

        List<Map<String, Object>> productList = (List<Map<String, Object>>) cartBuyData.get("productList");

        for (Map<String, Object> productData : productList) {
            PurchaseVO purchaseVO = new PurchaseVO();
            purchaseVO.setSno((int) productData.get("sno"));
            purchaseVO.setPno((int) productData.get("pno"));
            purchaseVO.setU_id((String) productData.get("u_id"));
            purchaseVO.setP_name((String) productData.get("p_name"));
            purchaseVO.setP_price((int) productData.get("p_price"));
            purchaseVO.setMemo((String) productData.get("memo"));
            purchaseVO.setStartDate((String) productData.get("startDate"));
            purchaseVO.setEndDate((String) productData.get("endDate"));

            purchaseService.productPurchase(purchaseVO);
            purchaseService.updateUserPoint(id, purchaseVO.getP_price());
            // 구매시 장바구니에 있던 목록 삭제
            cartService.getCartByPnoAndUid(purchaseVO.getPno(), id);
            cartService.deleteCart(purchaseVO.getPno(), id);
            // buyPoint 스토어 테이블에 전달
            storeService.updateRevenue(purchaseVO.getP_price(), purchaseVO.getSno());
            RevenueVO revenueVO = new RevenueVO();
            revenueVO.setSno((int) productData.get("sno"));
            revenueVO.setRevenue_date((String) productData.get("startDate"));
            revenueVO.setRevenue_amount((int) productData.get("p_price"));
            storeService.insertRevenue(revenueVO);
        }
        System.out.println("productList:" + productList);
        return new ResponseEntity<>("구매 목록에 추가되었습니다.", HttpStatus.OK);
    }



    //    @PostMapping("/board/cartbuy")
//    public String readCart(@ModelAttribute("ProductVO") ProductVO productVO, Model model, @RequestParam("pno") int pno, HttpSession session) {
//        // 스토어 정보 가져오기
////        BusinessStore = storeService.();
//        // 상품 정보 가져오기
//        productVO = productService.getProductContents(pno);
//        System.out.println(productVO);
//        model.addAttribute("productVO", productVO);
//
//        // 사용자 정보 가져오기
//        String u_id = (String) session.getAttribute("id");
//        System.out.println("장바구니 > 구매 페이지 로그인 된 사용자 아이디 불러오나?:" + u_id);
//        CustomerUserVO customerUserVO = customerService.getCustomerById(u_id);
//        System.out.println(customerUserVO);
//        model.addAttribute("customerUserVO", customerUserVO);
//        try {
//        } catch (Exception e) {
//            System.out.println("구매 페이지 로그인 안해서 여기 진입 합니다.");
//            productService.getProductContents(pno);
//        }
//        return "/board/cartbuy";
//    }
    @PostMapping("/board/cartbuy")
    public String readCart(String pno, HttpSession session, Model model){
        String u_id = (String) session.getAttribute("id");
        System.out.println("pno:"+pno);
        // 스토어 정보 가져오기
        // BusinessStore = storeService.();
        // 상품 정보 가져오기
        String[] pnoList = pno.split(",");
        List<CartVO> cartVOList = new ArrayList<>();
        List<ProductVO> productVOList = new ArrayList<>();
        List<ProductCartVO> combinedList = new ArrayList<>(); // 새로운 리스트 추가
        for (String pno_i : pnoList) {
            ProductVO productVO = productService.getProductContents(Integer.parseInt(pno_i));
            productVOList.add(productVO);

            CartVO cartVO = cartService.getCartByPnoAndUid(Integer.parseInt(pno_i), u_id);
            cartVOList.add(cartVO);

            ProductCartVO productCartVO = new ProductCartVO();
            productCartVO.setProductVO(productVO);
            productCartVO.setCartVO(cartVO);
            combinedList.add(productCartVO);
        }
        System.out.println("plist : " + productVOList);
        System.out.println("clist : " + cartVOList);
        model.addAttribute("productVOList", productVOList);
        model.addAttribute("cartVOList", cartVOList);
        model.addAttribute("combinedList", combinedList); // 새로운 리스트 추가

        // 사용자 정보 가져오기
        System.out.println("장바구니 > 구매 페이지 로그인 된 사용자 아이디 불러오나?:"+u_id);
        CustomerUserVO customerUserVO = customerService.getCustomerById(u_id);
        System.out.println(customerUserVO);
        model.addAttribute("customerUserVO", customerUserVO);
        try{
        }catch (Exception e){
            System.out.println("구매 페이지 로그인 안해서 여기 진입 합니다.");
            productService.getProductContents(Integer.parseInt(pno));
        }
        return "/board/cartbuy";
    }
}
