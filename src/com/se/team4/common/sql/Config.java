package com.se.team4.common.sql;
import java.sql.Connection;
import java.sql.DriverManager;

// Enum Singleton
public class Config {

    private Config() {}
    private static class Singleton {
        private static final Config instance = new Config();
    }

    public static Config getInstance() {
        return Singleton.instance;
    }
    // DB 커넥션 Variable
    private Connection conn = null;

    // DB 정보

    private final String tool = "jdbc:mariadb://";
    private final String port = "3306";

    private final String domain = "booksys";
    private final String id = "root";
    private final String pw = "****";
    private final String dbname = "booksys";

    private String url ="jdbc:mariadb://localhost:3306/booksys?user=root&password=****";

    public Connection sqlLogin() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url, id, pw);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("DB 연결 실패");
        }
        return conn;
    }
}
