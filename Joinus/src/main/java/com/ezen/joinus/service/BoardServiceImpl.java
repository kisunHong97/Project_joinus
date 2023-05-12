package com.ezen.joinus.service;

import com.ezen.joinus.mappers.BoardMapper;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@Log4j
public class BoardServiceImpl implements BoardService{
    @Setter(onMethod_=@Autowired)
    BoardMapper mapper;
    @Override
    public int countBoard() {
        return mapper.countBoard();
    }

    @Override
    public List<ProductVO> selectBoard(PagingVO vo) {
        return mapper.selectBoard(vo);
    }
}
