package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.FileService;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.service.StoreService;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;
import com.ezen.joinus.vo.StoreVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CategoryController {

    @Setter(onMethod_=@Autowired)
    private ProductService productService;

    @Setter(onMethod_=@Autowired)
    private FileService fileService;

    @Setter(onMethod_=@Autowired)
    private StoreService storeService;

    @GetMapping("/Food")
    public String food(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage){
        int total = productService.countBoard();
        int Foodproducttotal = productService.countProduct("food");
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "12";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "12";
        }
        int cntPage= 0;
        if ((Foodproducttotal / 12.0)>0){
            cntPage = (int) Math.ceil(Foodproducttotal / 12.0);
        }else{
            cntPage = 1;
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
        model.addAttribute("paging", vo);

        List<ProductVO> Foodlist = productService.selectCategory("food");
        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        for (ProductVO product : Foodlist) {
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
        }
        model.addAttribute("Foodlist",Foodlist);
        model.addAttribute("thumbnailList",thumbnailList);
        return "/main/food";
    }

    @GetMapping("/Academy")
    public String Academy(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage){
        int total = productService.countBoard();
//        System.out.println("@@@@@@@@@@@@@@@@"+total);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "12";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "12";
        }
        int academyproducttotal = productService.countProduct("academy");
        int cntPage= 0;
        if ((academyproducttotal / 12.0)>0){
            cntPage = (int) Math.ceil(academyproducttotal / 12.0);
        }else{
            cntPage = 1;
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
        model.addAttribute("paging", vo);


        List<ProductVO> Academylist = productService.selectCategory("academy");
        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        for (ProductVO product : Academylist) {
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
        }
        System.out.println("thumbnailList:"+thumbnailList);
        System.out.println("Academylist:" + Academylist);
        model.addAttribute("Academylist",Academylist);
        model.addAttribute("thumbnailList",thumbnailList);
        return "/main/academy";
    }

    @GetMapping("/Physical_Fitness")
    public String PhysicalFitness (PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage){
        int total = productService.countBoard();
//        System.out.println("@@@@@@@@@@@@@@@@"+total);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "12";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "12";
        }
        int Physical_Fitnessproductcount = productService.countProduct("physical fitness");
        int cntPage= 0;
        if ((Physical_Fitnessproductcount / 12.0)>0){
            cntPage = (int) Math.ceil(Physical_Fitnessproductcount / 12.0);
        }else{
            cntPage = 1;
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
        model.addAttribute("paging", vo);


        List<ProductVO> physical_fitnesslist = productService.selectCategory("physical fitness");
        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        for (ProductVO product : physical_fitnesslist) {
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
        }
        System.out.println("thumbnailList:"+thumbnailList);
        System.out.println("physical_fitnesslist:" + physical_fitnesslist);
        model.addAttribute("physical_fitnesslist",physical_fitnesslist);
        model.addAttribute("thumbnailList",thumbnailList);
        return "/main/physical_fitness";
    }
    @GetMapping("/Traffic")
    public String Traffic (PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage){
        int total = productService.countBoard();
//        System.out.println("@@@@@@@@@@@@@@@@"+total);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "12";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "12";
        }
        int trafficproductcount = productService.countProduct("traffic");
        int cntPage= 0;
        if ((trafficproductcount / 12.0)>0){
            cntPage = (int) Math.ceil(trafficproductcount / 12.0);
        }else{
            cntPage = 1;
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
        model.addAttribute("paging", vo);


        List<ProductVO> trafficlist = productService.selectCategory("traffic");
        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        for (ProductVO product : trafficlist) {
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
        }
        System.out.println("thumbnailList:"+thumbnailList);
        System.out.println("trafficlist:" + trafficlist);
        model.addAttribute("trafficlist",trafficlist);
        model.addAttribute("thumbnailList",thumbnailList);
        return "/main/traffic";
    }

    //지역선택 컨트롤러
    @PostMapping("/location")
    public String location(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage
            , @RequestParam(value="location",required=false) String location
            , @RequestParam(value="name",required=false) String name
            , @RequestParam(value="name1" ,required = false) String name1){
        int total = productService.countBoard();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "12";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "12";
        }
        model.addAttribute("paging", vo);
        List<StoreVO> locationlist = storeService.selectlocation(location);
        List<ProductVO> lselectproduct = new ArrayList<>();
        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        List<ProductVO> filteredList = new ArrayList<>();
        //특정 지역이 포함된 store에서 store가 올린 product가져오기
        for (StoreVO location1 : locationlist) {
            List<ProductVO> productList = productService.getProductSno(location1.getSno());
            if (!productList.isEmpty()) {
                lselectproduct.addAll(productList);
            }
        }
        //가져온 product에서 특정 카테고리를 포함한 product만 가져오기
        for (ProductVO lselect : lselectproduct){
            if(lselect.getP_category().contains(name)){
                filteredList.add(lselect);
            }else{
            }
        }
        for (ProductVO filteredList1 : filteredList) {
            thumbnailList.add(fileService.selectMainThumbnail(filteredList1.getPno()));
        }
        int locationcount = filteredList.size();
        int cntPage =0;
        if ((locationcount / 12.0)>0){
            cntPage = (int) Math.ceil(locationcount / 12.0);
        }else{
            cntPage = 1;
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),cntPage);
        model.addAttribute("paging", vo);
        model.addAttribute("filteredList",filteredList);
        model.addAttribute("thumbnailList",thumbnailList);
        model.addAttribute("name",name);
        model.addAttribute("name1",name1);
        return "/main/location";
    }
}
