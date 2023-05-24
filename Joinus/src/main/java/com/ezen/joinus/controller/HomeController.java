package com.ezen.joinus.controller;


import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.*;
import com.ezen.joinus.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;

@Controller
public class HomeController {

    @Setter(onMethod_=@Autowired)
    private ProductService productService;
    @Setter(onMethod_=@Autowired)
    private FileService fileService;
    @Setter(onMethod_=@Autowired)
    private CustomerService customerService;
    @Setter(onMethod_=@Autowired)
    private WishlistService wishlistService;
    @Setter(onMethod_=@Autowired)
    private CartService cartService;
    @Setter(onMethod_=@Autowired)
    private StoreService storeService;

    @Setter(onMethod_=@Autowired)
    private PurchaseService purchaseService;
    //페이징 처리
    @GetMapping("/product_board")
    public String boardList(PagingVO vo,Model model,HttpSession session
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
        System.out.println(vo);
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");

        int total = productService.countBoard();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "6";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage ="6";
        }
        System.out.println("total!!!!!!!!:"+total);
        int cntPage = (int) Math.ceil((double) total / 6.0);

        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
        model.addAttribute("paging", vo);
        List<ProductVO> productList = productService.selectBoard(vo);

        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        System.out.println("vo!!!!!!!!!!!!!!:"+vo);
        System.out.println("productList:!!!!!!!!!!!:"+productList);

        for(ProductVO product : productList){
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
            System.out.println(fileService.selectMainThumbnail(product.getPno()));
        }

        System.out.println(">>>>>>>>> " + thumbnailList);

        model.addAttribute("productList", productList);
        model.addAttribute("thumbnailList", thumbnailList);
        model.addAttribute("customerloginUser",customerloginUser);

        return "main/about";
    }
    // 게시물 이동

    @RequestMapping(value = "/board/read", method = RequestMethod.GET)
    public String read(@ModelAttribute("ProductVO") ProductVO productVO, Model model, @RequestParam("pno") int pno, HttpSession session){
        // 상품 정보 가져오기(썸네일, 상세정보 포함)
        System.out.println("pno가져오니???"+pno);
        productVO = productService.getProductContents(pno);
        productVO.setThumbnailList(fileService.selectThumbnailList(productVO.getPno()));
        productVO.setDetail(fileService.selectDetail(productVO.getPno()));
        System.out.println(productVO);
        model.addAttribute("productVO", productVO);
        Integer sno = productVO.getSno();
        System.out.println("sno!!!!!!!!!!"+sno);
        model.addAttribute("store", storeService.getStore(sno));


//        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
//        model.addAttribute("store",storeService.getStore(businessUser.getBno()));

        // 사용자 정보 가져오기
        String u_id = (String) session.getAttribute("id");
        System.out.println("로그인 된 사용자 아이디 불러오나?:"+u_id);
        CustomerUserVO customerUserVO = customerService.getCustomerById(u_id);
        System.out.println(customerUserVO);
        model.addAttribute("customerUserVO", customerUserVO);

        try{
            WishlistVO wishlist = wishlistService.getWishlistByPnoAndUid(pno, u_id);
            System.out.println("wishlist : " + wishlist );
            if (wishlist != null) {
                model.addAttribute("like", 1);
            } else {
                model.addAttribute("like", 0);
            }

            CartVO cart = cartService.getCartByPnoAndUid(pno, u_id);
            System.out.println("cart : " + cart);
            if (cart != null) {
                model.addAttribute("cart", 1);
            } else {
                model.addAttribute("cart", 0);
            }
        }catch (Exception e) {
            System.out.println("로그인 안해서 여기 진입 합니다.");
            productService.getProductContents(pno);
        }
        System.out.println("프로덕트네임!!:" + productVO.getP_name());
        String P_name = productVO.getP_name();
        List<ReviewVO> list2 = customerService.getreview(pno);
        System.out.println("왜 ??"+list2);
        float totalRating = 0;
        float avg = 0;
        for (ReviewVO review : list2) {
            totalRating += review.getRating();
            avg = totalRating / list2.size();
        }
// 소수점 아래 2번째 자리까지만 표시하는 DecimalFormat 객체 생성
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        String formattedAvg = decimalFormat.format(avg);

        System.out.println("평균: " + formattedAvg);

        if (u_id==null){
            model.addAttribute("productlist",list2);
            model.addAttribute("avg",formattedAvg);
            model.addAttribute("listlength", list2.size());
           // model.addAttribute("customerid",customerUserVO.getU_id());
            return "/board/read";
        }else {
            List<PurchaseVO> list = purchaseService.getPurchaseInfo(u_id);
            model.addAttribute("list",list);
            model.addAttribute("productlist",list2);
            model.addAttribute("avg",formattedAvg);
            model.addAttribute("listlength", list2.size());
            model.addAttribute("customerid",customerUserVO.getU_id());
            System.out.println("구매한 목록list!!!!!!!!!!!"+list);
            return "/board/read";
        }
    }

    // 해당 상품을 찜 목록에 추가하는 기능
    @PostMapping("/wishlist/add")
    public ResponseEntity<String> addWishlist(WishlistVO vo, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("찜 컨트롤러에 아이디 불러오나?:"+vo);

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
        WishlistVO wishlistVO = new WishlistVO();
        wishlistVO.setPno(vo.getPno());
        wishlistVO.setU_id(vo.getU_id());
        wishlistVO.setW_date(new Date());
        System.out.println("WISHLISTVO:" + wishlistVO);
        wishlistService.addWishlist(wishlistVO);

        return new ResponseEntity<>("찜 목록에 추가되었습니다.", HttpStatus.OK);
    }

    // 해당 상품을 찜 목록에서 삭제하는 기능
    @GetMapping("/wishlist/delete")
    public ResponseEntity<String> deleteWishlist(int pno, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("찜 삭제 컨트롤러에 pno 불러오나?:"+pno);
        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return new ResponseEntity<>("로그인 후 이용해 주세요.", HttpStatus.OK);
        }

        wishlistService.getWishlistByPnoAndUid(pno, id);
        wishlistService.deleteWishlist(pno, id);
        System.out.println("삭제 성공");

        // 찜 목록에서 해당 상품 삭제
        System.out.println(pno);
        System.out.println("상품번호 pno :" + pno);
        return new ResponseEntity<>("찜 목록에서 삭제되었습니다.", HttpStatus.OK);
    }

    // 해당 상품을 장바구니에 추가하는 기능
    @PostMapping(value = "/cart/add", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> addCart(@RequestBody Map<String, Object> cartData,HttpSession session) throws UnsupportedEncodingException {
        System.out.println("/CARD/ADD >>>>");
        System.out.println(">> " + cartData);

        ObjectMapper objectMapper = new ObjectMapper();
        CartVO cart = objectMapper.convertValue(cartData, CartVO.class);

        System.out.println("CART : " + cart);

        String id = (String) session.getAttribute("id");
//        System.out.println("장바구니 컨트롤러에 아이디 불러오나?:" + vo);

//         로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return ResponseEntity.badRequest().body("로그인 후 이용해주세요.");
        }

        CustomerUserVO customerUserVO = customerService.getCustomerById(id);
        System.out.println("사용자 정보:" + customerUserVO);
        // 사용자 정보가 없는 경우
        if (customerUserVO == null) {
            return ResponseEntity.badRequest().body("사용자만 이용 가능합니다.");
        }

        cartService.addCart(cart);

        return new ResponseEntity<>("장바구니에 추가되었습니다.", HttpStatus.OK);
    }

    // 해당 상품을 장바구니에서 삭제하는 기능
    @GetMapping("/cart/delete")
    public ResponseEntity<String> deleteCart(int pno, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("장바구니 삭제 컨트롤러에 pno 불러오나?:"+pno);
        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return new ResponseEntity<>("로그인 후 이용해 주세요.", HttpStatus.OK);
        }

        cartService.getCartByPnoAndUid(pno, id);
        cartService.deleteCart(pno, id);
        System.out.println("삭제 성공");

        // 찜 목록에서 해당 상품 삭제
        System.out.println(pno);
        System.out.println("상품번호 pno :" + pno);
        return new ResponseEntity<>("장바구니에서 삭제되었습니다.", HttpStatus.OK);
    }

    //상단바 장바구니 진입 시 삭제 컨트롤러
    @PostMapping("/cart/delete")
    @ResponseBody
    public void deleteCart(@RequestBody List<Integer> pnoList, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("상단바 장바구니 삭제 컨트롤러: " + pnoList);
        for (int pno : pnoList) {
            System.out.println("pno: " + pno);
            cartService.getCartByPnoAndUid(pno, id);
            cartService.deleteCart(pno, id);
        }
    }

    @PostMapping("/submitInquiry")
    @ResponseBody
    public String submitInquiry(@RequestParam("inquiryText") String inquiryText,
                                String p_name, int sno,
                                HttpSession session) {
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        String id = (String) session.getAttribute("id");
        // 현재 시간을 가져옵니다.
        LocalDateTime currentTime = LocalDateTime.now();
        // java.time.LocalDateTime 객체를 java.sql.Timestamp 객체로 변환합니다.
        Timestamp timestamp = Timestamp.valueOf(currentTime);
        System.out.println("상품문의 컨트롤러 들어오나? :" + inquiryText);
        InquiryVO inquiryVO = new InquiryVO();
        inquiryVO.setSno(sno);
        inquiryVO.setP_name(p_name);
        inquiryVO.setU_name(customerloginUser.getU_name());
        inquiryVO.setU_inquiry(inquiryText);
        inquiryVO.setInquiry_date(timestamp);
        System.out.println("문의 : " + inquiryVO);

        productService.saveInquiry(inquiryVO);
        // 상품 문의 등록이 완료되었음을 클라이언트에 응답합니다.
        return "success";
    }

    @GetMapping("/getInquiries")
    @ResponseBody
    public List<InquiryVO> getInquiries(String p_name) {
        System.out.println("문의글 조회 : " + p_name);
        // 서비스 레이어에서 등록된 상품 문의 목록을 조회하는 메서드를 호출하여 결과를 반환합니다.
        List<InquiryVO> inquiries = productService.getInquiries(p_name);
        System.out.println("문의글 리스트 : " + inquiries);

        return inquiries;
    }



    @PostMapping("/updateInquiry")
    @ResponseBody
    public String updateInquiry(String u_name, String u_inquiry, HttpSession session) {
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        System.out.println("문의 내역 수정 들어오나 ? 이름 : " + u_name + "수정 내용 : " + u_inquiry);
        // 수정된 문의 내용을 업데이트하는 비즈니스 로직 수행
        try {
            System.out.println(customerloginUser.getU_name() + u_name);
            if(customerloginUser.getU_name().equals(u_name)){
                System.out.println("문의 내역 작성자와 수정하려는 사용자의 아이디가 일치합니다.");
                productService.updateInquiry(u_name, u_inquiry);
            }
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}