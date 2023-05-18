package com.ezen.joinus.service;

import com.ezen.joinus.vo.CartVO;

import java.util.List;

public interface CartService {
    // 장바구니에 데이터 추가
    public void addCart(CartVO cartVO);

    // 장바구니에 데이터 삭제
    public void deleteCart(int pno, String u_id);

    // 장바구니 데이터 가져오기
    public CartVO getCartByPnoAndUid(int pno, String u_id);

    public List<CartVO> getCartItems(String u_id);
}
