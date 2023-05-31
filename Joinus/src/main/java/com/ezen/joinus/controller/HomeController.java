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

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

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

        // 페이징 처리에 필요한 vo
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), cntPage);
        model.addAttribute("paging", vo);

        List<StoreVO> storeVOList = storeService.getAllStore();
        List<ProductVO> productList = productService.getListAll();
        List<PurchaseVO> purchaseVOList = purchaseService.getAllpurchase();
        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        List<AttachFileDTO> thumbnailList1 = new ArrayList<>();
        for(PurchaseVO product : purchaseVOList){
            thumbnailList1.add(fileService.selectMainThumbnail(product.getPno()));
            System.out.println(fileService.selectMainThumbnail(product.getPno()));
        }
        for(ProductVO product : productList){
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
            System.out.println(fileService.selectMainThumbnail(product.getPno()));
        }
        model.addAttribute("productList", productList);
        model.addAttribute("purchaseVOList", purchaseVOList);
        model.addAttribute("storeVOList", storeVOList);
        model.addAttribute("thumbnailList", thumbnailList);
        model.addAttribute("thumbnailList1", thumbnailList1);



        model.addAttribute("customerloginUser",customerloginUser);
        model.addAttribute("businessUser",businessUser);

        return "main/about";
    }
    // 게시물 이동

    @RequestMapping(value = "/board/read", method = RequestMethod.GET)
    public String read(@ModelAttribute("ProductVO") ProductVO productVO, Model model, @RequestParam("pno") int pno, HttpSession session) {
        productVO = productService.getProductContents(pno);
        productVO.setThumbnailList(fileService.selectThumbnailList(productVO.getPno()));
        productVO.setDetail(fileService.selectDetail(productVO.getPno()));
        model.addAttribute("productVO", productVO);
        Integer sno = productVO.getSno();
        model.addAttribute("store", storeService.getStore(sno));
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        String u_id = (String) session.getAttribute("customerid");
        CustomerUserVO customerUserVO = customerService.getCustomerById(u_id);
        model.addAttribute("customerUserVO", customerUserVO);
        try {
            WishlistVO wishlist = wishlistService.getWishlistByPnoAndUid(pno, u_id);
            System.out.println("wishlist : " + wishlist);
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
        } catch (Exception e) {
            productService.getProductContents(pno);
        }
        String P_name = productVO.getP_name();
        List<ReviewVO> list2 = customerService.getreview(pno);
        Collections.reverse(list2);
        float totalRating = 0;
        float avg = 0;
        for (ReviewVO review : list2) {
            totalRating += review.getRating();
            avg = totalRating / list2.size();
        }
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        String formattedAvg = decimalFormat.format(avg);
        List<InquiryVO> inquiryList = productService.allinquiries(pno);
        Collections.reverse(inquiryList);
        Map<String, Integer> numbers = new LinkedHashMap<>();
        for (int i = 1; i <= 1000; i++) {
            numbers.put(Integer.toString(i), i);
        }
        if (customerloginUser == null && businessUser == null) {
            model.addAttribute("productlist", list2);
            model.addAttribute("avg", formattedAvg);
            model.addAttribute("listlength", list2.size());
            model.addAttribute("inquirylist", inquiryList);
            model.addAttribute("numbers",numbers);
            return "/board/read";
        } else if (u_id != null && businessUser == null) {
            List<PurchaseVO> list = purchaseService.getPurchaseInfo(u_id);
            model.addAttribute("list", list);
            model.addAttribute("productlist", list2);
            model.addAttribute("avg", formattedAvg);
            model.addAttribute("listlength", list2.size());
            model.addAttribute("customerid", customerUserVO.getU_id());
            model.addAttribute("inquirylist", inquiryList);
            model.addAttribute("numbers",numbers);
            return "/board/read";
        } else if (businessUser != null && businessUser.getB_id() != null) {
            model.addAttribute("productlist", list2);
            model.addAttribute("avg", formattedAvg);
            model.addAttribute("listlength", list2.size());
            model.addAttribute("inquirylist", inquiryList);
            model.addAttribute("businessUser", businessUser);
            StoreVO getstoreVO = storeService.getStore(businessUser.getBno());
            List<ProductVO> productVOList = productService.selectProductListBySno(getstoreVO.getSno());
            ProductVO productVOListfinal = productService.getProduct(pno);
            int productsno = 0;
            for(ProductVO productVO1 : productVOList){
                productsno = productVO1.getSno();
            }
            model.addAttribute("productsno",productsno);
            model.addAttribute("productfinalsno",productVOListfinal.getSno());
            model.addAttribute("numbers",numbers);
            return "/board/read";
        } else {
            return "/board/read";
        }
    }
    
    // 해당 상품을 찜 목록에 추가하는 기능
    @PostMapping("/wishlist/add")
    public ResponseEntity<String> addWishlist(WishlistVO vo, HttpSession session) {
        String id = (String) session.getAttribute("customerid");
        String bid = (String) session.getAttribute("businessid");
        System.out.println("찜 컨트롤러에 아이디 불러오나?:"+vo);

        // 로그인한 사용자 정보가 없는 경우
        if (id == null && bid ==null) {
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
        wishlistVO.setP_name(vo.getP_name());
        wishlistVO.setP_category(vo.getP_category());
        wishlistVO.setU_id(vo.getU_id());
        wishlistVO.setW_date(new Date());
        System.out.println("WISHLISTVO:" + wishlistVO);
        wishlistService.addWishlist(wishlistVO);

        return new ResponseEntity<>("찜 목록에 추가되었습니다.", HttpStatus.OK);
    }

    // 해당 상품을 찜 목록에서 삭제하는 기능
    @GetMapping("/wishlist/delete")
    public ResponseEntity<String> deleteWishlist(int pno, HttpSession session) {
        String id = (String) session.getAttribute("customerid");
        String bid = (String) session.getAttribute("businessid");
        System.out.println("찜 삭제 컨트롤러에 pno 불러오나?:"+pno);
        // 로그인한 사용자 정보가 없는 경우
        if (id == null && bid ==null) {
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

    //상단바 마이페이지 진입 시 찜삭제 컨트롤러
    @PostMapping("/wishlist/delete")
    @ResponseBody
    public void deleteWishlist(@RequestBody List<Integer> pnoList, HttpSession session) {
        String id = (String) session.getAttribute("customerid");
        for (int pno : pnoList) {
            System.out.println("pno: " + pno);
            wishlistService.getWishlistByPnoAndUid(pno, id);
            wishlistService.deleteWishlist(pno, id);
        }
    }

    // 해당 상품을 장바구니에 추가하는 기능
    @PostMapping(value = "/cart/add", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> addCart(@RequestBody Map<String, Object> cartData,HttpSession session) throws UnsupportedEncodingException {
        ObjectMapper objectMapper = new ObjectMapper();
        CartVO cart = objectMapper.convertValue(cartData, CartVO.class);
        String id = (String) session.getAttribute("customerid");
        String bid = (String) session.getAttribute("businessid");

//         로그인한 사용자 정보가 없는 경우
        if (id == null && bid ==null) {
            return ResponseEntity.badRequest().body("로그인 후 이용해주세요.");
        }

        CustomerUserVO customerUserVO = customerService.getCustomerById(id);
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
        String id = (String) session.getAttribute("customerid");
        String bid = (String) session.getAttribute("businessid");
        // 로그인한 사용자 정보가 없는 경우
        if (id == null && bid==null) {
            return new ResponseEntity<>("로그인 후 이용해 주세요.", HttpStatus.OK);
        }
        cartService.getCartByPnoAndUid(pno, id);
        cartService.deleteCart(pno, id);
        // 찜 목록에서 해당 상품 삭제
        return new ResponseEntity<>("장바구니에서 삭제되었습니다.", HttpStatus.OK);
    }

    //상단바 장바구니 진입 시 삭제 컨트롤러
    @PostMapping("/cart/delete")
    @ResponseBody
    public void deleteCart(@RequestBody List<Integer> pnoList, HttpSession session) {
        String id = (String) session.getAttribute("customerid");
        System.out.println("상단바 장바구니 삭제 컨트롤러: " + pnoList);
        for (int pno : pnoList) {
            System.out.println("pno: " + pno);
            cartService.getCartByPnoAndUid(pno, id);
            cartService.deleteCart(pno, id);
        }
    }

    //문의글 등록

    @GetMapping("/cinquiry")
    public String cinquiry(HttpSession session, @RequestParam("pno") int pno, @RequestParam("p_name") String p_name,@RequestParam("sno") int sno,Model model){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        System.out.println("자자customerloginUser!"+customerloginUser);
        System.out.println("자자!pno"+pno);
        System.out.println("자자!p_name"+p_name);
        System.out.println("자자!prosno:"+sno);
        model.addAttribute("pno",pno);
        model.addAttribute("p_name",p_name);
        model.addAttribute("sno",sno);
        model.addAttribute("customerloginUser",customerloginUser);
        return "customer/cinquiry";
    }
    @GetMapping("/inquirysubmit")
    public String getinquirysubmit(HttpSession session,@RequestParam("pno") int pno){
        System.out.println("inquirysubmit에서 pno 갖고 와요?"+pno);
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        return "redirect:/board/read?pno=" + pno;
    }
    @PostMapping("inquirysubmit")
    public String inquirysubmit(HttpSession session, @RequestParam("pno") int pno,@RequestParam("sno") int sno, InquiryVO inquiryVO){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        LocalDate now = LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        // 포맷 적용
        String formatedNow = now.format(formatter);
        inquiryVO.setPno(pno);
        inquiryVO.setInquiry_date(formatedNow);
        inquiryVO.setStatus("답변 대기중");
        inquiryVO.setU_id(customerloginUser.getU_id());
        inquiryVO.setSno(sno);
        System.out.println("snoooo!!!!:"+sno);
        productService.saveInquiry(inquiryVO);
        return "redirect:/board/read?pno=" + pno;
    }
    @GetMapping("/modifyinqu/ino={ino}/pno={pno}")
    public String modifyinqu(HttpSession session,InquiryVO inquiryVO,Model model,@PathVariable("ino") int ino,@PathVariable("pno") int pno){
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

        System.out.println("ino:"+ino);
        inquiryVO = productService.getInquiries(ino);
        System.out.println("inquiryVO:"+inquiryVO);
        model.addAttribute("inquiryVO",inquiryVO);
        model.addAttribute("businessUser",businessUser);
        model.addAttribute("b_answerVO",productService.selectb_answer(ino));
        System.out.println("좀 떠라!:"+ productService.selectb_answer(ino));
        return "customer/cinquinfo";
    }

    @GetMapping("/inquirymodify/ino={ino}")
    public String inquirymodify(HttpSession session,InquiryVO inquiryVO,Model model,@PathVariable("ino") int ino){
        inquiryVO = productService.getInquiries(ino);
        System.out.println("inquiryVO:"+inquiryVO);
        model.addAttribute("inquiryVO",inquiryVO);
        return "customer/cinqumodify";
    }
    @PostMapping("/inqu_modify/ino={ino}")
    public String modifyinquiry(HttpSession session,InquiryVO inquiryVO,Model model,@PathVariable("ino") int ino){
        LocalDate now = LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        // 포맷 적용
        String formatedNow = now.format(formatter);
        inquiryVO.setInquiry_date(formatedNow);
        productService.updateinqu(inquiryVO);
        return "redirect:/board/read?pno=" + inquiryVO.getPno();
    }

}