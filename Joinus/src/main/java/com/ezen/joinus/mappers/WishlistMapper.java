package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.WishlistVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WishlistMapper {
    void addWishlist(WishlistVO wishlist);
    void deleteWishlist(Map<String, Object> paramMap);
    WishlistVO selectWishlistByPnoAndUid(Map<String, Object> paramMap);
    List<WishlistVO> getWishlistUid(String u_id);
}

