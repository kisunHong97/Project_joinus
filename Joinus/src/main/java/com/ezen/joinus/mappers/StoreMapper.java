package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.ProductVO;
import com.ezen.joinus.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoreMapper {
    public void insertStore(StoreVO vo);
    public int s_nameCheck(String s_name);
    public int getMaxSno();

    StoreVO getStoreBno(int bno);
    StoreVO getStore(int bno);
    void updateStore(StoreVO vo);

    List<StoreVO> selectlocation(String location);


}
