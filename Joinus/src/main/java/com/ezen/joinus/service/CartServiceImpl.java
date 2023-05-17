package com.ezen.joinus.service;

import com.ezen.joinus.mappers.CartMapper;
import com.ezen.joinus.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService{
    @Autowired
    private CartMapper cartMapper;

    @Override
    public void addCart(CartVO cartVO) {
        System.out.println("여기는 장바구니 추가 서비스 : " +cartVO);
        cartMapper.addCart(cartVO);
    }

    @Override
    public void removeCart(int pno, String u_id) {
        System.out.println("여기는 삭제 서비스 : " + pno + " uid : " + u_id);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("pno", pno);
        paramMap.put("u_id", u_id);
        cartMapper.deleteCart(paramMap);
    }

    @Override
    public CartVO getCartByPnoAndUid(int pno, String u_id) {
        System.out.println("여기는 조회 서비스 : " + pno + " uid : " + u_id);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("pno", pno);
        paramMap.put("u_id", u_id);
        System.out.println("paramMap : "+paramMap);
        return cartMapper.selectCartByPnoAndUid(paramMap);
    }

    @Override
    public List<CartVO> getCartItems(String u_id) {
        return cartMapper.getCartItems(u_id);
    }
}
