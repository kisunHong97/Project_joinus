package com.ezen.joinus.service;

import com.ezen.joinus.vo.PurchaseVO;
import com.ezen.joinus.vo.RefundVO;

import java.util.List;


public interface PurchaseService {
    void productPurchase(PurchaseVO purchaseVO);

    void updateUserPoint(String u_id, int p_price);

    List<PurchaseVO> getPurchaseInfo(String u_id);

    List<PurchaseVO> getPurchaseInfoSno(int sno);
    List<PurchaseVO> getPurchaseInfoPname(int sno);

    List<PurchaseVO> getAllpurchase();

    void deleteProduct(int pno);

    void nowRefundPrice(String u_id, int p_price);

    void refundProduct(RefundVO refundVO);
    void getRefundProduct(int pno);
}
