package com.ezen.joinus.service;

import com.ezen.joinus.vo.PurchaseVO;

import java.util.List;


public interface PurchaseService {
    void productPurchase(PurchaseVO purchaseVO);

    void updateUserPoint(String u_id, int p_price);

    List<PurchaseVO> getPurchaseInfo(String u_id);
}
