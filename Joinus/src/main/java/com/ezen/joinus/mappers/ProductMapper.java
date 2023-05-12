package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.ProductVO;

import java.util.List;

public interface ProductMapper {
    public List<ProductVO> getListAll();
    public ProductVO getProduct(int pno);
    public void insertProduct(ProductVO vo);
    public void updateProduct(ProductVO vo);
    public void deleteProduct(int pno);
    public int getPnoByNameAndSubTitle(ProductVO vo);
}
