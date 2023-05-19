package com.ezen.joinus.service;

import com.ezen.joinus.mappers.ProductMapper;
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
	public int getNextPno() {
		return productMapper.getNextPno();
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
//
//	@Override
//	public List<ProductVO> selectlocation(String location) {
//		return productMapper.selectlocation(location);
//	}


}
