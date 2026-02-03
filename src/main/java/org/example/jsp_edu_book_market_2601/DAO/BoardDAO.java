package org.example.jsp_edu_book_market_2601.DAO;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.example.jsp_edu_book_market_2601.database.DBConnection;
import org.example.jsp_edu_book_market_2601.vo.BoardVo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Log4j2

public class BoardDAO {
    private static BoardDAO instance;

    private BoardDAO() {
    }

    public static BoardDAO getInstance() {
        if (instance == null) {
            instance = new BoardDAO();
        }
        return instance;
    }

    public void  insertBoard(BoardVo boardVo) {
        log.info(boardVo);
        // DB에 개시글을 추가하는 메서드
        String sql = "insert into board (member_id, name, subject, content, hit, ip, add_date)" +
                " values (?,?,?,?,?,?,now())";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, boardVo.getMemberId());
            statement.setString(2, boardVo.getName());
            statement.setString(3, boardVo.getSubject());
            statement.setString(4, boardVo.getContent());
            statement.setInt(5, boardVo.getHit());
            statement.setString(6, boardVo.getIp());

            statement.executeUpdate(); // INSERT 실행

        } catch (SQLException | ClassNotFoundException e ) {
            throw new RuntimeException();
        }
    }

    public int selectBoardCount(String items, String keyword) { // 페이징 처리
        /* DB에서 게시글의 개수를 조회하는 메서드
        items: 검색 항목 (ex. 제목, 내용 등)
        keyword: 검색어
         */
        String sql;
        if (items == null || items.isEmpty() || keyword == null || keyword.isEmpty()) {
            // 검색 항목이나 검색어가 없을 경우 전체 게시글 개수 조회
            sql = "SELECT COUNT(*) FROM board";
        } else {
            // 검색 결과가 있는 경우
            sql = "SELECT COUNT(*) FROM board WHERE " + items + " LIKE '%" + keyword + "%'";
        }
        int count = 0;
        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1); // 집계 함수의 결과 = 게시물 개수
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return count;
    }

    public List<BoardVo> selectBoards(int pageNum, int limit, String items, String keyword) {
        /* DB에서 게시글 목록을 조회하는 메서드
        pageNum : 현재 페이지 번호
        limit : 페이지당 게시글 수
        items : 검색 항목 (ex. 제목, 내용 등)
        keyword : 검색어
         */
        List<BoardVo> boardVOList = new ArrayList<>();
//        int start = (pageNum - 1) * limit;
        int start = pageNum * limit - limit;
        // 1page -> limit 0, 10
        // 2page -> limit 10, 10
        // 3page -> limit 20, 10

        String sql;
        if (items == null || items.isEmpty() || keyword == null || keyword.isEmpty()) {
            // 검색 항목이나 검색어가 없을 경우 전체 게시글 개수 조회
            // 최근 등록된 것부터 나열 = add_date로 하면 속도가 느려지기 때문에 bno로 정렬
            sql = "SELECT * FROM board ORDER BY bno DESC";
        } else {
            // 검색 결과가 있는 경우
            sql = "SELECT * FROM board WHERE " + items + " LIKE '%" + keyword + "%' ORDER BY bno DESC";
        }
        sql += " LIMIT " + start + ", " + limit; // 페이지네이션을 위한 LIMIT절 추가
        log.info("sql : {}", sql); // 에러 나는지 확인용

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                BoardVo boardVO = BoardVo.builder()
                        .bno(resultSet.getInt("bno"))
                        .memberId(resultSet.getString("member_id"))
                        .name(resultSet.getString("name"))
                        .subject(resultSet.getString("subject"))
                        .content(resultSet.getString("content"))
                        .hit(resultSet.getInt("hit"))
                        .ip(resultSet.getString("ip"))
                        .addDate(resultSet.getString("add_date")).build();
                boardVOList.add(boardVO);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return boardVOList;
    }

    public BoardVo selectBoard(int bno) {
        String sql = "SELECT * FROM board WHERE bno = ?";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, bno);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                BoardVo boardVO = BoardVo.builder()
                        .bno(resultSet.getInt("bno"))
                        .memberId(resultSet.getString("member_id"))
                        .name(resultSet.getString("name"))
                        .subject(resultSet.getString("subject"))
                        .content(resultSet.getString("content"))
                        .hit(resultSet.getInt("hit"))
                        .ip(resultSet.getString("ip"))
                        .addDate(resultSet.getString("add_date")).build();
                log.info("boardVO : " + boardVO);
                return boardVO;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    public void updateHit(int bno) {
        String sql = "UPDATE board SET hit = hit + 1 WHERE bno = ?";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, bno);
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    public void updateBoard (BoardVo boardVo) {
        String sql = "UPDATE board SET subject = ?, content = ? WHERE bno = ?";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, boardVo.getSubject());
            preparedStatement.setString(2, boardVo.getContent());
            preparedStatement.setInt(3, boardVo.getBno());
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteBoard(int bno) {
        String sql = "DELETE FROM board WHERE bno = ?";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, bno);
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}

