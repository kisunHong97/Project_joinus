package com.ezen.joinus.service;

import com.ezen.joinus.vo.WishlistVO;

import java.util.List;

public interface WishlistService {
    void addWishlist(WishlistVO wishlistVO);
    void deleteWishlist(int pno, String u_id);
    WishlistVO getWishlistByPnoAndUid(int pno, String u_id);
    List<WishlistVO> getWishlistUid(String u_id);
}
