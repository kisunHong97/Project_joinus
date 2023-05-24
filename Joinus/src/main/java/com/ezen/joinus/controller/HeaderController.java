package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.mappers.CartMapper;
import com.ezen.joinus.service.*;
import com.ezen.joinus.vo.*;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        System.out.println("작동되나요? 마이페이지 컨트롤러");
        // 세션에서 로그인한 사용자 정보를 가져옵니다.
        BusinessUserVO BusinessloginUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
//        CustomerUserVO customer = customerService.getCustomerById(customerloginUser.getU_id());
//        BusinessUserVO business = businessService.getBusinessById(BusinessloginUser.getB_id());
//        System.out.println("포인트" + customer.getBuypoint());
//        System.out.println("사업자정보"+business);

        if (BusinessloginUser == null && customerloginUser == null) {
            // 로그인한 사용자가 없는 경우 로그인 페이지로 리다이렉트합니다.
            return "redirect:/login";
        } else {
            // 사용자 역할에 따라 각각 다른 마이페이지를 보여줍니다.
            if (BusinessloginUser != null) {
                // 사업자용 마이페이지를 보여줍니다.
                model.addAttribute("business",businessService.getBusinessById(BusinessloginUser.getB_id()));
                System.out.println("작동되나요? 사업자가 로그인되어있어요");
                return  "business/businessmypage";
            } else if (customerloginUser != null) {
                // 고객용 마이페이지를 보여줍니다.
                model.addAttribute("a" , customerService.getCustomerById(customerloginUser.getU_id()));
                System.out.println("작동되나요? 고객이 로그인되어있어요");
                try {
                    String u_id = (String) session.getAttribute("id");
                    if (u_id != null) {
                        System.out.println("구매상품확인 컨트롤러 진입");
                        List<PurchaseVO> resultList = purchaseService.getPurchaseInfo(u_id);
                        System.out.println(resultList);
                        model.addAttribute("buyInfo", resultList);
                        List<WishlistVO> wishlistVOList = wishlistService.getWishlistUid(u_id);
                        System.out.println("찜한 리스트 : " + wishlistVOList);
                        model.addAttribute("wishlistVOList", wishlistVOList);
                        List<ReviewVO> reviewlist = customerService.customerreview(customerloginUser.getU_id());
                        System.out.println("고객이 작성한 리뷰!"+reviewlist);
                        model.addAttribute("reviewlist",reviewlist);
                    }
                } catch (Exception e) {
                    // 예외 처리
                }
                return "/customer/customermypage";
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

    @GetMapping("/search")
    public String search(@RequestParam("query") String query, Model model,
                         PagingVO vo, ChatMessage chat1,
                         @RequestParam(value="nowPage", required=false)String nowPage,
                         @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
        System.out.println("검색어 : " + query);
        List<ProductVO> searchResultList = productService.getProductName(query);
        System.out.println("검색어를 포함한 상품명 조회 : " + searchResultList);

        int total = productService.countBoard();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "16";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "16";
        }
        int cntPage= 0;
        if ((total / 16.0)>0){
            cntPage = (int) Math.ceil(total / 16.0);
        }else{
            cntPage = 1;
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
        model.addAttribute("paging", vo);

        List<AttachFileDTO> thumbnailList = new ArrayList<>();

        for(ProductVO product : searchResultList){
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
            System.out.println(fileService.selectMainThumbnail(product.getPno()));
        }
        System.out.println(">> " + thumbnailList);

        model.addAttribute("searchResultList", searchResultList);
        model.addAttribute("thumbnailList", thumbnailList);

        return "/board/searchResult";
    }

}
