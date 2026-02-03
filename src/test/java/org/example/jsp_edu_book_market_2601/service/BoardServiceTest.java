package org.example.jsp_edu_book_market_2601.service;

import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.DTO.BoardDTO;
import org.example.jsp_edu_book_market_2601.vo.BoardVo;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2

class BoardServiceTest {
    private BoardService boardService = BoardService.getInstance();

    @Test
    public void addBoard() {
        boardService.addBoard(BoardDTO.builder()
                .memberId("test").name("테스터")
                .subject("서비스 테스트").content("서비스 테스트")
                .hit(0).ip("127.0.0.1").build());
    }

    @Test
    public void getBoard() {
        int bno = 40;
        BoardDTO boardDTO = boardService.getBoard(bno);
        log.info("boardDTO : " + boardDTO);
    }

    @Test
    public void modifyBoard() {
        BoardDTO boardDTO = BoardDTO.builder()
                .bno(102)
                .subject("Modify Title").
                content("Modify content").build();
        boardService.modifyBoard(boardDTO);
        log.info(boardService.getBoard(boardDTO.getBno()));
    }
}