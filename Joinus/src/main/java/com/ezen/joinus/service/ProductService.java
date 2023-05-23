package com.ezen.joinus.service;

import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;

import java.util.List;

public interface ProductService {
    // 게시물(상품) 총 갯수
    public int countBoard();

    // 페이징 처리 게시글(상품) 조회(역순)
    public List<ProductVO> selectBoard(PagingVO vo);

    // 상품 정보 전부 가져오기
    public List<ProductVO> getProductListAll();

    // pno에 맞는 상품 정보 가져오기
    public ProductVO getProductContents(int pno);

    // 상품 정보 삽입
    public void registerProduct(ProductVO vo);

    // 상품 정보 수정
    public void modifyProduct(ProductVO vo);

    // 상품 정보 삭제
    public void removeProduct(int pno);

    // 최대(최근에 만든) pno 가져오기
    public int getMaxPno();

    public List<ProductVO> selectCategory(String  p_category);


    // 상품명 조회
    List<ProductVO> getProductName(String p_name);

    List<ProductVO> getProductSno(int sno);

    // business에 있는 sno로 접근하여 ProductVO 가져오기
    public List<ProductVO> selectProductListBySno(int sno);

    int countProduct(String p_category);

}
