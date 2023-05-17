package com.ezen.joinus.service;

import com.ezen.joinus.vo.BusinessUserVO;

public interface BusinessService {
    // 중복 사업자 아이디 체크(존재하면 b_id 총 갯수 가져온다)
    public int b_idCheck(String b_id);

    // b_id에 맞는 사업자 데이터 가져오기
    public BusinessUserVO MemberLogin(String b_id) throws Exception;

    // 최대(최근에 만든) Bno 가져오기
    public int getMaxBno();

    // b_id에 맞는 데이터 가져오기
    public BusinessUserVO getBusinessById(String b_id);

    // 사업자 데이터 삽입
    public void registerBusiness(BusinessUserVO vo);

    // 사업자 데이터  수정
    public void modifyBusiness(BusinessUserVO vo);//사업자 정보 수정

    // 사업자 데이터 삭제
    public void removeBusiness(String b_id);//사업자회원 탈퇴
}
