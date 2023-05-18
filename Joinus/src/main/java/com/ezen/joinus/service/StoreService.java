package com.ezen.joinus.service;

import com.ezen.joinus.vo.StoreVO;

public interface StoreService {

    // 가게 테이블에 가게 정보를 삽입
    public void registerStore(StoreVO vo);

    // 중복 가게이름 체크
    public int s_nameCheck(String s_name);

    // 최대(방금 생성된) sno 가져오기
    public int getMaxSno();

    public StoreVO getStoreBno(int bno);

    public void updateStore(StoreVO vo);
}
