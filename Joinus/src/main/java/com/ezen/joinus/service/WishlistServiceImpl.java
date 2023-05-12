package com.ezen.joinus.service;

import com.ezen.joinus.mappers.WishlistMapper;
import com.ezen.joinus.vo.WishlistVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class WishlistServiceImpl implements WishlistService{
    @Autowired
    private WishlistMapper wishlistMapper;


    @Override
    public void addWishlist(WishlistVO wishlist) {
        System.out.println("여기는 추가 서비스 : " +wishlist);
        wishlistMapper.addWishlist(wishlist);
    }

    public WishlistServiceImpl(WishlistMapper wishlistMapper) {
        this.wishlistMapper = wishlistMapper;
    }
    @Override
    public void deleteWishlist(int pno, String u_id) {
        System.out.println("여기는 삭제 서비스 : " + pno + " uid : " + u_id);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("pno", pno);
        paramMap.put("u_id", u_id);
        wishlistMapper.deleteWishlist(paramMap);
    }

    @Override
    public WishlistVO getWishlistByPnoAndUid(int pno, String u_id) {
        System.out.println("여기는 조회 서비스 : " + pno + " uid : " + u_id);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("pno", pno);
        paramMap.put("u_id", u_id);
        System.out.println("paramMap : "+paramMap);
        return wishlistMapper.selectWishlistByPnoAndUid(paramMap);
    }


}
