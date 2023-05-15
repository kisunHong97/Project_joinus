package com.ezen.joinus.service;

import com.ezen.joinus.vo.PurchaseVO;


public interface PurchaseService {
    void productPurchase(PurchaseVO purchaseVO);

    void updateUserPoint(String u_id, int p_price);

}
