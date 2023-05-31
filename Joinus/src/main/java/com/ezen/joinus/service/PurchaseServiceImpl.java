package com.ezen.joinus.service;

import com.ezen.joinus.mappers.PurchaseMapper;
import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.PurchaseVO;
import com.ezen.joinus.vo.RefundVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class PurchaseServiceImpl implements PurchaseService{
    @Setter(onMethod_=@Autowired)
    PurchaseMapper purchaseMapper;

    @Override
    public void productPurchase(PurchaseVO purchaseVO) {
        purchaseMapper.insertProduct(purchaseVO);
    }

    @Override
    public void updateUserPoint(String u_id, int p_price) {
        CustomerUserVO customerUserVO = new CustomerUserVO();
        customerUserVO.setU_id(u_id);
        customerUserVO.setPaypoint(p_price);
        purchaseMapper.updateUserPoint(customerUserVO);
    }

    @Override
    public List<PurchaseVO> getPurchaseInfo(String u_id) {
        System.out.println("구매목록 아이디 찾기 서비스 : " + u_id);
        return purchaseMapper.selectUPurchaseUserId(u_id);
    }

    @Override
    public List<PurchaseVO> getPurchaseInfoSno(int sno) {
        System.out.println("회원관리 sno : "+ sno);
        return purchaseMapper.getPurchaseInfoSno(sno);
    }

    @Override
    public List<PurchaseVO> getPurchaseInfoPname(int sno) {
        System.out.println("상품명 중복제거를 위한 sno " + sno);
        return purchaseMapper.getPurchaseInfoPname(sno);
    }

    @Override
    public List<PurchaseVO> getAllpurchase() {
        System.out.println("구매목록 전체 리스트 가져오기 : ");
        return purchaseMapper.getAllpurchase();
    }

    @Override
    public void deleteProduct(int pno) {
        purchaseMapper.deleteProduct(pno);
    }

    @Override
    public void nowRefundPrice(String u_id, int p_price) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("p_price", p_price);
        parameters.put("u_id", u_id);
        purchaseMapper.nowRefundPrice(parameters);
    }

    

    @Override
    public void refundProduct(RefundVO refundVO) {
        System.out.println("환불 목록 테이블에 저장 : " + refundVO);
        purchaseMapper.refundProduct(refundVO);
    }

    @Override
    public void getRefundProduct(int pno) {
        System.out.println("환불 제품번호 : "+pno);
        purchaseMapper.getRefundProduct(pno);
    }


}
