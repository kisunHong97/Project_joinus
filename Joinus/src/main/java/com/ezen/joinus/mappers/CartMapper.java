package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.CartVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartMapper {
    void addCart(CartVO cartVO);
    void deleteCart(Map<String, Object> paramMap);
    CartVO selectCartByPnoAndUid(Map<String, Object> paramMap);
    List<CartVO> getCartItems(String u_id);
}