package com.ezen.joinus.controller;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.FileService;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CategoryController {

    @Setter(onMethod_=@Autowired)
    private ProductService productService;

    @Setter(onMethod_=@Autowired)
    private FileService fileService;

    @GetMapping("/Food")
    public String food(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage){
        int total = productService.countBoard();
//        System.out.println("@@@@@@@@@@@@@@@@"+total);
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


        List<ProductVO> Foodlist = productService.selectCategory("food");
        List<AttachFileDTO> thumbnailList = new ArrayList<>();
        for (ProductVO product : Foodlist) {
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
        }
        System.out.println("thumbnailList:"+thumbnailList);
        System.out.println("Foodlist:" + Foodlist);
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
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
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
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
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
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
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
}
