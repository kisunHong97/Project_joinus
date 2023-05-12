package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.BusinessUserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BusinessUserMapper {

    public void insert(BusinessUserVO vo);
    public int b_idCheck(String b_id);
    public BusinessUserVO MemberLogin(String b_id) throws Exception;
    public Long getMaxBno();
    BusinessUserVO getBusinessById(String b_id);

    public void modify(BusinessUserVO vo);//사업자 정보 수정

    public void delete(String b_id);//사업자회원 탈퇴




}
