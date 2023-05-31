package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.RevenueVO;
import com.ezen.joinus.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface StoreMapper {
    List<RevenueVO> getRevenueList(int sno);

    public void insertStore(StoreVO vo);
    public int s_nameCheck(String s_name);
    public int getMaxSno();
    List<StoreVO> getAllStore();
    StoreVO getStoreBno(Integer bno);
    StoreVO getStore(Integer bno);
    void updateStore(StoreVO vo);
    void updateRevenue(Map<String, Object> paramMap);

    // 수익금 저장
    void insertRevenue(RevenueVO revenue);


    List<StoreVO> selectlocation(String location);

    void deletestore(Integer bno);




}
