package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.service.BusinessService;
import com.ezen.joinus.service.FileService;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.service.StoreService;
import com.ezen.joinus.vo.*;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class BusinessController {

    @Setter(onMethod_=@Autowired)
    private BusinessService businessUserService;

    @Setter(onMethod_=@Autowired)
    private StoreService storeService;

    @Setter(onMethod_=@Autowired)
    private ProductService productService;

    @Setter(onMethod_=@Autowired)
    private FileService fileService;

    // 수익금 조회 메서드
    @GetMapping("/storeRevenue")
    public ResponseEntity<List<RevenueVO>> getRevenueList(Model model, HttpSession session,Integer  sno) {
        System.out.println("수익금 ajax 들오나");
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        List<RevenueVO> revenueList = storeService.getRevenueList(businessUser.getBno());
        System.out.println("수익금조회 리스트 : " + revenueList);
        List<RevenueVO> result = revenueList.stream().filter(i -> i.getSno() == sno).collect(Collectors.toList());
        return new ResponseEntity<>(result,HttpStatus.OK);
    }

    @GetMapping("/businessinformation")//사업자 개인정보 수정화면 들어가기
    public String Businessinformation(Model model, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

        System.out.println("현재 사업자로그인~고객"+ businessUser);

        model.addAttribute("businessvo" ,businessUserService.getBusinessById(businessUser.getB_id()));
        return "business/businessinformation";
    }

    @GetMapping("/businessmodify")//사업자 개인정보 수정화면 들어가기 2
    public String businessmodify(Model model, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

        System.out.println("현재 사업자로그인~고객 수정하러 들어왔니?"+ businessUser);

        model.addAttribute("businessvo" ,businessUserService.getBusinessById(businessUser.getB_id()));
        return "business/binfomodify";
    }
    @PostMapping("/binfomodify")//사업자 정보 수정
    public String binfomodify(BusinessUserVO businessUserVO, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");

        System.out.println(businessUser);

        businessUserService.modifyBusiness(businessUserVO);
        return "redirect:/product_board";
    }

    
    // 페이징 안될 확률 매우 높음!!
    @GetMapping("/showMyProduct")
    public String showMyProduct(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage
            , HttpSession session){

        // business -> store(bno)로 접근 -> product(sno)로 접근
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        StoreVO store = storeService.getStore(businessUser.getBno());
        List<ProductVO> myProductList = productService.selectProductListBySno(store.getSno());
        
        int total = myProductList.size();

        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", vo);

        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        for (ProductVO product : myProductList) {
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
        }


        System.out.println("ProductList : " + myProductList);
        System.out.println("ThumbnailList : " + thumbnailList);
        model.addAttribute("myProductList", myProductList);
        model.addAttribute("thumbnailList", thumbnailList);

        return "business/businessMyProduct";
    }
}
