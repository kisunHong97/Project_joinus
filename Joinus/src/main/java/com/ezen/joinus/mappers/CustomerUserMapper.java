package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.CustomerUserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface CustomerUserMapper {
    void insert(CustomerUserVO vo);//고객정보 저장
    int u_idCheck(String u_id); //중복 아이디 체크
    CustomerUserVO CustomerLogin(String u_id) throws Exception;//고객 로그인
    CustomerUserVO getCustomerById(String b_id);
    void modify(CustomerUserVO vo); //고객정보 수정

    void delete(String u_id); //회원탈퇴
    void update(Map<String, Object> paramMap);//포인트 충전

}