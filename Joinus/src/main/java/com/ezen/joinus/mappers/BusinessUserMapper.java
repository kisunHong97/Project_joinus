package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.BusinessUserVO;
import com.ezen.joinus.vo.ReviewVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BusinessUserMapper {


    int b_idCheck(String b_id);
    BusinessUserVO MemberLogin(String b_id) throws Exception;
    int getMaxBno();
    BusinessUserVO getBusinessById(String b_id);
    void insertBusiness(BusinessUserVO vo);
    void modifyBusiness(BusinessUserVO vo);//사업자 정보 수정
    void deleteBusiness(Integer bno);//사업자회원 탈퇴

    //사업자 상품에 쓰인 리뷰들 다보기
    List<ReviewVO> selectreviewsno(int sno);

}
