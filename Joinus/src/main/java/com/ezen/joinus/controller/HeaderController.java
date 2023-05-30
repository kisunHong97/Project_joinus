package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.mappers.CartMapper;
import com.ezen.joinus.service.*;
import com.ezen.joinus.vo.*;
import lombok.Setter;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.naming.directory.SearchResult;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller

public class HeaderController {
    @Setter(onMethod_=@Autowired)
    private CartMapper cartMapper;

    @Setter(onMethod_=@Autowired)
    private ProductService productService;

    @Setter(onMethod_=@Autowired)
    private CustomerService customerService;

    @Setter(onMethod_=@Autowired)
    private BusinessService businessService;

    @Setter(onMethod_=@Autowired)
    private PurchaseService purchaseService;

    @Setter(onMethod_=@Autowired)
    private FileService fileService;

    @Setter(onMethod_=@Autowired)
    private WishlistService wishlistService;


    // 세션에서 로그인한 사용자 정보를 가져옵니다.
    // 로그인한 사용자가 없는 경우 로그인 페이지로 리다이렉트합니다.
    // 사용자 역할에 따라 각각 다른 마이페이지를 보여줍니다.
    // 알 수 없는 역할인 경우 에러 페이지를 보여줍니다.
    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model, @ModelAttribute("refundVO") RefundVO refundVO) {
        BusinessUserVO BusinessloginUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        if (BusinessloginUser == null && customerloginUser == null) {
            return "redirect:/login";
        } else {

            if (BusinessloginUser != null) {
                model.addAttribute("business",businessService.getBusinessById(BusinessloginUser.getB_id()));
                List<ReviewVO> reviewVOList = businessService.selectreviewsno(BusinessloginUser.getBno());
                model.addAttribute("reviewlist",reviewVOList);
                List<PurchaseVO> memberManagement = purchaseService.getPurchaseInfoSno(BusinessloginUser.getBno());
                model.addAttribute("memberManagement", memberManagement);
                model.addAttribute("refund", refundVO);
                return  "business/businessmypage";
            } else if (customerloginUser != null) {
                model.addAttribute("a" , customerService.getCustomerById(customerloginUser.getU_id()));
                try {
                    String u_id = (String) session.getAttribute("customerid");
                    if (u_id != null) {
                        List<PurchaseVO> resultList = purchaseService.getPurchaseInfo(u_id);
                        model.addAttribute("buyInfo", resultList);
                        List<WishlistVO> wishlistVOList = wishlistService.getWishlistUid(u_id);
                        model.addAttribute("wishlistVOList", wishlistVOList);
                        List<ReviewVO> reviewlist = customerService.customerreview(customerloginUser.getU_id());
                        model.addAttribute("reviewlist",reviewlist);
                    }
                } catch (Exception e) {
                }
                return "/customer/customermypage";
            } else {return "error";}
        }
    }

    // 상단바 장바구니
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
                String u_id = (String) session.getAttribute("customerid"); // 조회할 사용자 아이디
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

//    검색기능
    @GetMapping("/search")
    public String search(@RequestParam("query") String query, Model model,
                         PagingVO vo,
                         @RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage,
                         @RequestParam(value="cntPerPage", required=false, defaultValue="8") int cntPerPage) {
        System.out.println("검색어 : " + query);
        List<ProductVO> searchResultList = productService.getProductName(query);
        System.out.println("검색어를 포함한 상품명 조회 : " + searchResultList);

        int total = searchResultList.size();

        vo = new PagingVO(total, nowPage, cntPerPage, 10); // 10은 페이지 그룹 단위

        int start = (nowPage - 1) * cntPerPage;
        int end = Math.min(start + cntPerPage, total);

        List<ProductVO> paginatedSearchResultList = searchResultList.subList(start, end);

        List<AttachFileDTO> thumbnailList = new ArrayList<>();

        for (ProductVO product : paginatedSearchResultList) {
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
            System.out.println(fileService.selectMainThumbnail(product.getPno()));
        }
        System.out.println(">> " + thumbnailList);

        model.addAttribute("searchResultList", paginatedSearchResultList);
        model.addAttribute("thumbnailList", thumbnailList);
        model.addAttribute("paging", vo);

        return "/board/searchResult";
    }

    @PostMapping("/expirationDate")
    public ResponseEntity<String> expirationDate(int pno, HttpSession session) {
        System.out.println("기간만료 삭제 버튼 pno : " + pno);
        purchaseService.deleteProduct(pno);
        return new ResponseEntity<>("구매상품목록에서 삭제되었습니다.", HttpStatus.OK);
    }

    @PostMapping("/nowRefund")
    public ResponseEntity<String> nowRefund(String u_id, int pno, int p_price) {
        System.out.println("환불가격 : " + p_price);
        System.out.println("환불사용자 : " + u_id);
        System.out.println("환불상품번호 : " + pno);
        purchaseService.deleteProduct(pno);
        purchaseService.nowRefundPrice(u_id, p_price);
        return new ResponseEntity<>("환불 되었습니다.", HttpStatus.OK);
    }

    @GetMapping("/refundRequest")
    public String refundRequest(String u_id, int pno, int p_price,Model model, HttpSession session) {
        BusinessUserVO BusinessloginUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("환불 요청한 아이디 : " + u_id);
        RefundVO refundVO = new RefundVO();
        refundVO.setU_id(u_id);
        refundVO.setPno(pno);
        refundVO.setP_price(p_price);
        purchaseService.refundProduct(refundVO);
        purchaseService.getRefundProduct(refundVO.getPno());
        System.out.println("환불정보 :" + refundVO);
        model.addAttribute("refundVO", refundVO);
        return "business/businessmypage";
    }
}
