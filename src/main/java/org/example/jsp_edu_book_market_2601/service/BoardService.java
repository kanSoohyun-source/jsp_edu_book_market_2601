package org.example.jsp_edu_book_market_2601.service;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.DAO.BoardDAO;
import org.example.jsp_edu_book_market_2601.DTO.BoardDTO;
import org.example.jsp_edu_book_market_2601.DTO.PageRequestDTO;
import org.example.jsp_edu_book_market_2601.DTO.PageResponseDTO;
import org.example.jsp_edu_book_market_2601.util.MapperUtil;
import org.example.jsp_edu_book_market_2601.vo.BoardVo;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;

@Log4j2

public class BoardService {

    private final int pagePerCount = 5;
    private final BoardDAO boardDAO = BoardDAO.getInstance();
    private final ModelMapper modelMapper = MapperUtil.INSTANCE.getInstance();

    private static BoardService instance;
    private BoardService() {}
    public static BoardService getInstance() {
        if (instance == null) {
            instance = new BoardService();
        }
        return instance;
    }


    public PageResponseDTO getBoardList(PageRequestDTO pageRequestDTO) {
        int limit = pagePerCount;

        // 2. 게시글 목록 조회
        int count = boardDAO.selectBoardCount(pageRequestDTO.getItems(), pageRequestDTO.getKeyword());
        List<BoardVo> boardVOList = boardDAO.selectBoards(pageRequestDTO.getPageNum(), limit,
                pageRequestDTO.getItems(), pageRequestDTO.getKeyword());

        // ***중요*** (무조건 외워야 함)
        // VO는 dao <-> service 에 쓰임
        // DTO는 service <-> controller
        // 따라서, VO를 DTO로 변경해주어야 함
        List<BoardDTO> boardDTOList = new ArrayList<>(); // 컨트롤러로 넘길 타입
        for (BoardVo boardVO : boardVOList) {
            // BoardVO를 BoardDTO로 변환
            BoardDTO boardDTO = boardVO.toDTO();
            boardDTOList.add(boardDTO);
        }

        // 3. 전체 페이지 수 계산
        int totalPage;
        // ex. totalCount : 101, limit : 5 => totalPage = 21
        //     totalCount : 100, limit : 5 => totalPage = 20
        //     totalCount :  99, limit : 5 => totalPage = 20
        if (count % limit == 0) {
            totalPage = count / limit;
        } else {
            totalPage = count / limit + 1;
        }

        // 4. request에 게시글 목록과 페이지 정보 저장
//        request.setAttribute("boardList", boardDTOList);
//        request.setAttribute("pageNum", pageRequestDTO.getPageNum());
//        request.setAttribute("totalCount", count); // 전체 게시글 개수
//        request.setAttribute("totalPage", totalPage); // 전체 페이지 수
        return PageResponseDTO.builder().boardList(boardDTOList)
                .pageNum(pageRequestDTO.getPageNum())
                .totalPage(totalPage)
                .totalCount(count).build();
    }

    public void addBoard(BoardDTO boardDTO) { // controller에서 호출할 메서드이기 때문에 DTO 입력받아야 함
        log.info("addBoard()");
        // DTO -> VO 변환
        BoardVo boardVo = boardDTO.toVO();
        log.info("boardVO : {}", boardVo);
        boardDAO.insertBoard(boardVo);
    }

    public BoardDTO getBoard(int bno) {
        boardDAO.updateHit(bno);

        BoardVo boardVo = boardDAO.selectBoard(bno);
        // VO -> DTO 후 반환
        BoardDTO boardDTO = boardVo.toDTO();
        return boardDTO;
    }

    public void modifyBoard (BoardDTO boardDTO) {
        // DTO -> Vo
        BoardVo boardVo = modelMapper.map(boardDTO, BoardVo.class); // boardDTO(원본) -> BoardVo로 바꿔달라는 요청
        boardDAO.updateBoard(boardVo);

    }

    public void removeBoard(int bno) {
        boardDAO.deleteBoard(bno);
    }


}

