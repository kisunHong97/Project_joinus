package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.ProductVO;
import com.ezen.joinus.vo.PurchaseVO;

import java.util.List;

public interface PurchaseMapper {
    void insertProduct(PurchaseVO purchaseVO);
    void updateUserPoint(CustomerUserVO customerUserVO);
    List<PurchaseVO> selectUPurchaseUserId(String u_id);
    List<PurchaseVO> getPurchaseInfoSno(int sno);
    List<PurchaseVO> getAllpurchase();
    void deleteProduct(int pno);
}
