package com.ezen.joinus.service;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;

import java.util.List;
public interface BoardService {
    // 게시물 총 갯수
    int countBoard();

    // 페이징 처리 게시글 조회
    List<ProductVO> selectBoard(PagingVO vo);
}
