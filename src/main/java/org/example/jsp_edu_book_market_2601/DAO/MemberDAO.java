package org.example.jsp_edu_book_market_2601.DAO;

import lombok.Cleanup;
import org.example.jsp_edu_book_market_2601.database.DBConnection;
import org.example.jsp_edu_book_market_2601.vo.BoardVo;
import org.example.jsp_edu_book_market_2601.vo.MemberVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    private static MemberDAO instance;

    private MemberDAO() {
    }

    public static MemberDAO getInstance() {
        if (instance == null) {
            instance = new MemberDAO();
        }
        return instance;
    }

    public MemberVO selectMember(String memberId) {
        String sql = "SELECT * FROM member WHERE member_id = ?";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, memberId);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
            MemberVO memberVO = MemberVO.builder()
                    .memberId(resultSet.getString("member_id"))
                    .passwd(resultSet.getString("passwd"))
                    .memberName(resultSet.getString("member_name"))
                    .gender(resultSet.getString("gender"))
                    .birthday(resultSet.getString("birthday"))
                    .email(resultSet.getString("email"))
                    .phone(resultSet.getString("phone"))
                    .zipCode(resultSet.getString("zip_code"))
                    .address01(resultSet.getString("address01"))
                    .address02(resultSet.getString("address02"))
                    .addDate(resultSet.getString("add_date")).build();
                return memberVO;
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void insertMember(MemberVO memberVO) {
        // DB에 회원을 추가하는 메서드
        String sql = "INSERT INTO member " +
                "(member_id, passwd, member_name, gender, birthday, email, phone, zip_code, address01, address02, add_date) " +
                "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()) ";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, memberVO.getMemberId());
            preparedStatement.setString(2, memberVO.getPasswd());
            preparedStatement.setString(3, memberVO.getMemberName());
            preparedStatement.setString(4, memberVO.getGender());
            preparedStatement.setString(5, memberVO.getBirthday());
            preparedStatement.setString(6, memberVO.getEmail());
            preparedStatement.setString(7, memberVO.getPhone());
            preparedStatement.setString(8, memberVO.getZipCode());
            preparedStatement.setString(9, memberVO.getAddress01());
            preparedStatement.setString(10, memberVO.getAddress02());

            preparedStatement.executeUpdate(); // INSERT 실행

        } catch (SQLException | ClassNotFoundException e ) {
            throw new RuntimeException();
        }
    }

    public void updateMember(MemberVO memberVO) {
        String sql = "UPDATE member SET passwd = ?, member_name = ?, gender = ?, birthday = ?, email = ? " +
                ", phone = ?, zip_code = ?, address01 = ?, address02 = ? WHERE member_id = ?";

        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, memberVO.getPasswd());
            preparedStatement.setString(2, memberVO.getMemberName());
            preparedStatement.setString(3, memberVO.getGender());
            preparedStatement.setString(4, memberVO.getBirthday());
            preparedStatement.setString(5, memberVO.getEmail());
            preparedStatement.setString(6, memberVO.getPhone());
            preparedStatement.setString(7, memberVO.getZipCode());
            preparedStatement.setString(8, memberVO.getAddress01());
            preparedStatement.setString(9, memberVO.getAddress02());
            preparedStatement.setString(10, memberVO.getMemberId());

            preparedStatement.executeUpdate(); // INSERT 실행

        } catch (SQLException | ClassNotFoundException e ) {
            throw new RuntimeException();
        }
    }
}
