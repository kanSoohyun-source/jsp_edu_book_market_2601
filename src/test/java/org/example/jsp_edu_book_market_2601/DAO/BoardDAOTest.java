package org.example.jsp_edu_book_market_2601.DAO;

import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.vo.BoardVo;
import org.junit.jupiter.api.Test;

import java.util.List;

@Log4j2

class BoardDAOTest {
    private final BoardDAO boardDAO = BoardDAO.getInstance();

    @Test
    public void insertBoard() {
        BoardVo boardVo = BoardVo.builder().memberId("test")
                .name("tester").subject("제목").content("내용")
                .hit(0).ip("111.111.111.111").build();

        boardDAO.insertBoard(boardVo);
    }

    @Test
    public void insertBoardDummy() {
        for (int i = 1; i < 100; i++) {
            BoardVo boardVo = BoardVo.builder().memberId("test")
                    .name("tester" + i).subject("제목" + i).content("내용" + i)
                    .hit(0).ip("111.111.111." + (i % 255)).build();
            boardDAO.insertBoard(boardVo);
        }
    }

    @Test
    public void selectBoardCount() {
        // 1. 검색어가 없는 경우
        int count = boardDAO.selectBoardCount(null, null);
        log.info("검색어가 없는 경우 : {}", count);

        // 2. 검색어가 있는 경우
        String items = "subject";
        String keyword = "21";
        count = boardDAO.selectBoardCount(items, keyword);
        log.info("검색어가 있는 경우 : {}", count);
    }

    @Test
    public void selectBoardList() {
        // 1. 검색어가 없는 경우
        int pageNum = 2;
        int limit = 10;
        List<BoardVo> boardVOList = boardDAO.selectBoards(pageNum, limit, null, null);

        for (BoardVo boardVO : boardVOList) {
            log.info(boardVO);
        }

        // 2. 검색어가 있는 경우
        pageNum = 1;
        String items = "subject";
        String keyword = "0";
        List<BoardVo> boardVOKeywordList = boardDAO.selectBoards(pageNum, limit, items, keyword);
        for (BoardVo boardVO : boardVOKeywordList) {
            log.info(boardVO);
        }
    }

    @Test
    public void selectBoard() {
        int bno = 40;
        BoardVo boardVO = boardDAO.selectBoard(bno);
        log.info("boardVO : " + boardVO);
    }

    @Test
    public void updateHit() {
        int bno = 40;
        boardDAO.updateHit(bno);
        BoardVo boardVo = boardDAO.selectBoard(bno);
        if (boardVo.getHit() > 0) {
            log.info("success");
        }
        log.info("boardVo : " + boardVo);
    }

    @Test
    public void updateBoard() {
        int bno = 40;
        BoardVo boardVo = BoardVo.builder().bno(bno).subject("Modify Title").
                content("Modify content").build();
        boardDAO.updateBoard(boardVo);
        log.info(boardDAO.selectBoard(bno));
    }

    @Test
    public void deleteBoard() {
        int bno = 50;
        log.info(boardDAO.selectBoard(bno));
        boardDAO.deleteBoard(bno);
        if (boardDAO.selectBoard(bno) == null) {
            log.info("delete success");
        }
    }
}