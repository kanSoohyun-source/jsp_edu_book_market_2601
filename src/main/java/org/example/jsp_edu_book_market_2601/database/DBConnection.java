package org.example.jsp_edu_book_market_2601.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection connection = null;

        String url = "jdbc:mariadb://localhost:3306/jsp_ed_book_market";
        String user = "root";
        String pass = "6800";

        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, pass);
        return connection;
    }
}
