package com.ezen.joinus.service;

import com.ezen.joinus.mappers.ProductMapper;
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
	ProductMapper pmapper;
	@Override
	public List<ProductVO> getListAll() {
		return pmapper.getListAll();
	}

	@Override
	public ProductVO getProductContents(int pno) {
		return pmapper.getProduct(pno);
	}

	@Override
	public void registerProduct(ProductVO vo) {
		pmapper.insertProduct(vo);
	}

	@Override
	public void modifyProduct(ProductVO vo) {
		pmapper.updateProduct(vo);
	}

	@Override
	public void removeProduct(int pno) {
		pmapper.deleteProduct(pno);
	}

	@Override
	public int getNextPno() {
		return pmapper.getNextPno();
	}


}
