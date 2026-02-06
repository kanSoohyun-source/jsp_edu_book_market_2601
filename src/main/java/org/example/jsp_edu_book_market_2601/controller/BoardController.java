package org.example.jsp_edu_book_market_2601.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.DTO.BoardDTO;
import org.example.jsp_edu_book_market_2601.DTO.PageRequestDTO;
import org.example.jsp_edu_book_market_2601.DTO.PageResponseDTO;
import org.example.jsp_edu_book_market_2601.service.BoardService;

import java.io.IOException;

@Log4j2
@WebServlet(name = "boardController", value = {"*.do"})
// 어떤 경로로 들어오든 간에 확장자가 do 라면 아래의 코드 실행
public class BoardController extends HttpServlet {
    @Override
    // input의 method가 get일 경우
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp); // doPost로 넘기기
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService boardService = BoardService.getInstance();
        String requestURI = req.getRequestURI(); // 요청 URI
        String contextPath = req.getContextPath(); // 컨텍스트 경로
        String command = requestURI.substring(contextPath.length()); // 요청 URI에서 컨텍스트 경로를 제거한 명령어

        log.info("requestURI: {}", requestURI);
        log.info("contextPath: {}", contextPath);
        log.info("command: {}", command); // 파일 경로에서 이름을 불러오기 위한 명령어

        // 세션에서 로그인 여부 가져오기 (login_process 참조)
        // session이 내장 객체가 아니기 때문에 type 선언 해야 함
        HttpSession session = req.getSession();
        String sessionMemberId = (String) session.getAttribute("sessionMemberId");

        switch (command) {
            case "/board/boardList.do" -> { // 게시판 목록
                log.info("boardList");

                /* 게시글 목록을 가져오는 메서드 */
                // 1. request에서 값 추출 (페이지 번호, 검색 항목, 검색어 등)
                String items = req.getParameter("items");
                String keyword = req.getParameter("keyword");
                int pageNum = 1;
                if (req.getParameter("pageNum") != null) {
                    pageNum = Integer.parseInt(req.getParameter("pageNum"));
                }

                PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                        .items(items).keyword(keyword).pageNum(pageNum).build();



                PageResponseDTO pageResponseDTO = boardService.getBoardList(pageRequestDTO);
                // 전달
                req.setAttribute("pageResponseDTO", pageResponseDTO);

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/board/list.jsp");
                requestDispatcher.forward(req, resp);
            }
            case "/board/boardAddForm.do" -> {
                // 게시글 작성 폼을 요청하는 경우
                log.info("board add form");

                // 로그인 안 한 경우 로그인 페이지로 이동
                if (sessionMemberId == null || sessionMemberId.trim().isEmpty()) {
                    resp.sendRedirect("/member/login.jsp");
                    return;
                }
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/board/add.jsp");
                requestDispatcher.forward(req, resp);

            }

            case "/board/boardAdd.do" -> {
                // 게시글 등록을 원하는 경우 -> 작성 폼의 action 경로
                log.info("board add");

                if (sessionMemberId == null || sessionMemberId.trim().isEmpty()) {
                    resp.sendRedirect("/member/login.jsp");
                    return;
                }
                // 1. DTO
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setMemberId(sessionMemberId);
                boardDTO.setName(req.getParameter("name"));
                boardDTO.setSubject(req.getParameter("subject"));
                boardDTO.setContent(req.getParameter("content"));
                boardDTO.setHit(0);
                boardDTO.setIp(req.getRemoteAddr());

                // 2. Service 호출
                boardService.addBoard(boardDTO);

                resp.sendRedirect("/board/boardList.do");

            }
            case "/board/boardView.do" -> {
                // 글보기
                int bno = Integer.parseInt(req.getParameter("bno"));
                BoardDTO boardDTO = boardService.getBoard(bno);

                // boardDTO를 view에 전달 -> req 속성으로 추가
                req.setAttribute("board", boardDTO);

                req.getRequestDispatcher("/WEB-INF/board/view.jsp").forward(req, resp);
            }
            case "/board/boardModifyForm.do" -> {
                // 수정 폼
                log.info("board modify form");
                int bno = Integer.parseInt(req.getParameter("bno"));
                BoardDTO boardDTO = boardService.getBoard(bno);

                // 작성자만 접근할 수 있도록 함
                if (!boardDTO.getMemberId().equals(sessionMemberId)) {
                    resp.sendRedirect("/board/boardList.do");
                    return;
                }

                // boardDTO를 view에 전달 -> req 속성으로 추가
                req.setAttribute("board", boardDTO);

                req.getRequestDispatcher("/WEB-INF/board/modify.jsp").forward(req, resp);
            }
            case "/board/boardModify.do" -> {
                log.info("board modify");

                int bno = Integer.parseInt(req.getParameter("bno"));
                BoardDTO boardDTO = boardService.getBoard(bno);

                // 작성자만 접근할 수 있도록 함
                if (!boardDTO.getMemberId().equals(sessionMemberId)) {
                    resp.sendRedirect("/board/boardList.do");
                    return;
                }

                // 수정 처리 -> 수정 form의 action 주소
                boardDTO = new BoardDTO();
                boardDTO.setBno(bno);
                boardDTO.setSubject(req.getParameter("subject"));
                boardDTO.setContent(req.getParameter("content"));

                boardService.modifyBoard(boardDTO);

                resp.sendRedirect("/board/boardList.do");
            }
            case "/board/boardDelete.do" -> {
                log.info("Delete");

                int bno = Integer.parseInt(req.getParameter("bno"));
                BoardDTO boardDTO = boardService.getBoard(bno);

                // 작성자만 접근할 수 있도록 함
                if (!boardDTO.getMemberId().equals(sessionMemberId)) {
                    resp.sendRedirect("/board/boardList.do");
                    return;
                }

                boardService.removeBoard(bno);
                resp.sendRedirect("/board/boardList.do");
            }
        }
    }
}
