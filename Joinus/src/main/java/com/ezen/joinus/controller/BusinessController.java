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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
        System.out.println("bno!!!!!!!!!!!!" + businessUser.getBno());
        System.out.println("현재 사업자로그인~고객 수정하러 들어왔니?"+ businessUser);

        StoreVO vo = storeService.getStore(businessUser.getBno());
        System.out.println("vo!!!!!!!!!"+vo);
        List<ProductVO> list = productService.getProductSno(vo.getSno());
        Integer bno = businessUser.getBno();
        System.out.println("현재로그인 bno: "+ bno);
        System.out.println("알알알" + list);
        model.addAttribute("businessvo" ,businessUserService.getBusinessById(businessUser.getB_id()));
        model.addAttribute("list",list);

        return "business/binfomodify";
    }
    @PostMapping("/binfomodify")//사업자 정보 수정
    public String binfomodify(BusinessUserVO businessUserVO, HttpSession session){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println(businessUser);

        businessUserService.modifyBusiness(businessUserVO);
        return "redirect:/product_board";
    }
    @GetMapping("/businessdelete")
    public String businessdelete(HttpSession session,Model model){
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        model.addAttribute("businessvo",businessUser);

        session.setAttribute("errormessage1", "비밀번호가 맞지 않습니다.");
        return "business/binfodelete";
    }
    @GetMapping("/businessinfodelete")
    public String businessinfodelete(HttpSession session, Integer bno,String b_pwd,Model model){
        System.out.println("businessinfodelete delete컨트롤러로 들어오나?");
        BusinessUserVO businessUser = (BusinessUserVO) session.getAttribute("BusinessUserVO");
        System.out.println("삭제"+businessUser);
        model.addAttribute("customervo",businessUser);
        System.out.println("비밀번호"+b_pwd);
        bno = businessUser.getBno();
        System.out.println("현재로그인 bno"+ bno);
        storeService.deletestore(bno);
        businessUserService.removeBusiness(bno);
        session.invalidate();
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
        System.out.println("으아아악!"+ total);


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
//        String a1 = Integer.toString((int) Math.ceil(total / 16.0));

        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
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
