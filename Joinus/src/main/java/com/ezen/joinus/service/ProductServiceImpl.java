package com.ezen.joinus.service;

import com.ezen.joinus.mappers.ProductMapper;
import com.ezen.joinus.vo.B_answerVO;
import com.ezen.joinus.vo.InquiryVO;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class ProductServiceImpl implements ProductService{
	@Setter(onMethod_=@Autowired)
	ProductMapper productMapper;

	@Override
	public int countBoard() {
		return productMapper.countBoard();
	}

	@Override
	public List<ProductVO> selectBoard(PagingVO vo) {
		return productMapper.selectBoard(vo);
	}
	@Override
	public List<ProductVO> getProductListAll() {
		return productMapper.getListAll();
	}

	@Override
	public List<ProductVO> getListAll() {
		return productMapper.getListAll();
	}

	@Override
	public ProductVO getProductContents(int pno) {
		return productMapper.getProduct(pno);
	}

	@Override
	public void registerProduct(ProductVO vo) {
		productMapper.insertProduct(vo);
	}

	@Override
	public void modifyProduct(ProductVO vo) {
		productMapper.updateProduct(vo);
	}

	@Override
	public void removeProduct(int pno) {
		productMapper.deleteProduct(pno);
	}

	@Override
	public int getMaxPno() {
		return productMapper.getMaxPno();
	}

	@Override
	public List<ProductVO> selectCategory(String p_category) {
		return productMapper.selectCategory(p_category);
	}

	public List<ProductVO> getProductName(String p_name) { return productMapper.getProductName(p_name);	}

	@Override
	public List<ProductVO> getProductSno(int sno) {
		return productMapper.getProductSno(sno);
	}


	public List<ProductVO> selectProductListBySno(int sno) {
		return productMapper.selectProductListBySno(sno);
	}

	@Override
	public int countProduct(String p_category) {
		return productMapper.countProduct(p_category);
	}

	@Override
	public void saveInquiry(InquiryVO inquiryVO) {
		System.out.println("문의 글 등록 되나 ? : " + inquiryVO);
		productMapper.saveInquiry(inquiryVO);
	}

	@Override
	public List<InquiryVO> allinquiries(int pno) {
		return productMapper.allinquiries(pno);
	}

	@Override
	public InquiryVO getInquiries(int ino) {
		return productMapper.getInquiries(ino);
	}

	@Override
	public List<InquiryVO> userallinqu(String u_id) {
		return productMapper.userallinqu(u_id);
	}

	@Override
	public InquiryVO custgetinqu(int pno, String u_id) {
		return null;
	}

	@Override
	public void updateinqu(InquiryVO inquiryVO) {
		productMapper.updateinqu(inquiryVO);
	}

	@Override
	public void insertb_answer(B_answerVO b_answerVO) {
		productMapper.insertb_answer(b_answerVO);

	}

	@Override
	public B_answerVO selectb_answer(int ino) {
		return productMapper.selectb_answer(ino);
	}
	@Override
	public ProductVO getProduct(int pno) {
		return productMapper.getProduct(pno);
	}

	@Override
	public List<InquiryVO> allstoreinqu(int bno) {
		return productMapper.allstoreinqu(bno);
	}

	@Override
	public void updatestatus(int ino) {
		productMapper.updatestatus(ino);
	}

//	@Override
//	public List<InquiryVO> getInquiries(String p_name) {
//		System.out.println("문의글 조회 서비스:" + p_name);
//		return productMapper.getInquiries(p_name);
//	}
//
//	@Override
//	public int updateInquiry(String u_name, String u_inquiry) {
//		System.out.println("문의 내역 수정 서비스 : " + u_name + u_inquiry);
//		return productMapper.updateInquiry(u_name, u_inquiry);
//	}
}
