package com.ezen.joinus.service;

import com.ezen.joinus.vo.CartVO;

public interface CartService {
    void addCart(CartVO cartVO);
    void deleteCart(int pno, String u_id);
    CartVO getCartByPnoAndUid(int pno, String u_id);
}
