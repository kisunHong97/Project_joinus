package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.B_answerVO;
import com.ezen.joinus.vo.InquiryVO;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface ProductMapper {
    int countBoard();
    List<ProductVO> selectBoard(PagingVO vo);
    List<ProductVO> getListAll();
    ProductVO getProduct(int pno);
    void insertProduct(ProductVO vo);
    void updateProduct(ProductVO vo);
    void deleteProduct(int pno);
    int getMaxPno();
    List<ProductVO> selectCategory(String p_category);

    List<ProductVO> getProductName(String p_name);

    List<ProductVO> getProductSno(int sno);

    List<ProductVO> selectProductListBySno(int sno);

    int countProduct(String p_category);
    void saveInquiry(InquiryVO inquiryVO);

    //문의글 전체 가져오기
    List<InquiryVO> allinquiries(int pno);

    //해당 문의글 가져오기
    InquiryVO getInquiries(int ino);

    //고객이쓴 문의글 가져오기
    List<InquiryVO> userallinqu(String u_id);


    InquiryVO custgetinqu(Map<String, Object> paramMap);
    // void update(Map<String, Object> paramMap);
//    List<InquiryVO> getInquiries(String p_name);
//    int updateInquiry(String arg0, String param1);
    void updateinqu(InquiryVO inquiryVO);

    void insertb_answer(B_answerVO b_answerVO);

    B_answerVO selectb_answer(int ino);
    List<InquiryVO> allstoreinqu(int bno);

    void updatestatus(int ino);
}
