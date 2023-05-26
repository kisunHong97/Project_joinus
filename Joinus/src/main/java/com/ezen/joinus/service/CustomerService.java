package com.ezen.joinus.service;

import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.ReviewVO;

import java.util.List;
import java.util.Map;

public interface CustomerService {

    // 중복 아이디 체크
    public int u_idCheck(String u_id);

    // 고객 로그인
    public CustomerUserVO CustomerLogin(String u_id) throws Exception;

    // b_id에 맞는 고객정보 가져오기
    public CustomerUserVO getCustomerById(String b_id);

    // 고객 테이블에 정보 삽입
    public void registerCustomer(CustomerUserVO vo);

    // 고객 테이블에 정보 수정
    public void modifyCustomer(CustomerUserVO vo); //고객정보 수정

    // 고객 테이블에 정보 삭제(회원탈퇴)
    public void removeCustomer(String u_id);

    public void update(int buypoint, String u_id);//포인트 충전

    public void insertreview(ReviewVO vo);

    public List<ReviewVO> getreview(int pno);

    public List<ReviewVO> customerreview(String u_id);




}
