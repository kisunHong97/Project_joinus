package com.ezen.joinus.service;

import com.ezen.joinus.vo.ProductVO;

import java.util.List;

public interface ProductService {
    public List<ProductVO> getListAll();
    public ProductVO getProductContents(int pno);
    public void registerProduct(ProductVO vo);
    public void modifyProduct(ProductVO vo);
    public void removeProduct(int pno);
    public int getNextPno();
}
