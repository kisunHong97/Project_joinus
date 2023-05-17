package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.StoreVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreMapper {
    public void insertStore(StoreVO vo);
    public int s_nameCheck(String storename);
    public int getMaxSno();
}
