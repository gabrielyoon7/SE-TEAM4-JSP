package com.se.team4.common.sql;
import java.sql.Connection;
import java.sql.DriverManager;
public class Config {
    /**
     * DB 로그인을 대신 해주는 클래스 입니다. 외부에선 DBUtils 라이브러리를 사용합니다.
     * */
    private Config() {}
    private static class Singleton {private static final Config instance = new Config();}
    public static Config getInstance() {
        return Singleton.instance;
    }

    // DB Connection 변수
    private Connection conn = null;

    // DB 정보
    private String url ="jdbc:mariadb://localhost:3306/booksys?user=root&password=****"; //교수님이 주신 파일을 최대한 유지하기 위해 가져옴.

    public Connection sqlLogin() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("[DB 연결 실패]MariaDB의 id/pw가 root/****인지 확인해주세요.");
        }
        return conn; //DB 사용을 요구했던 메소드에게 로그인 정보를 돌려줌.
    }
}
