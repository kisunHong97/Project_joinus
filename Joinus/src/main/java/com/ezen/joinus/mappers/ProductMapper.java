package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;

import java.util.List;

public interface ProductMapper {
    int countBoard();
    List<ProductVO> selectBoard(PagingVO vo);
    List<ProductVO> getListAll();
    ProductVO getProduct(int pno);
    void insertProduct(ProductVO vo);
    void updateProduct(ProductVO vo);
    void deleteProduct(int pno);
    int getNextPno();
}
