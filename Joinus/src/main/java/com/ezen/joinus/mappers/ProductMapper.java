package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.InquiryVO;
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
    int getMaxPno();
    List<ProductVO> selectCategory(String  p_category);

    List<ProductVO> getProductName(String p_name);

    List<ProductVO> getProductSno(int sno);

    List<ProductVO> selectProductListBySno(int sno);

    int countProduct(String p_category);
    void saveInquiry(InquiryVO inquiryVO);
    List<InquiryVO> getInquiries(String p_name);
    int updateInquiry(String arg0, String param1);
}
