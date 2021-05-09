package com.se.team4.application.persistency.DAO.Home;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DAO.TestDAO;
import com.se.team4.application.persistency.DTO.Home.UserDTO;
import com.se.team4.application.persistency.DTO.TestDTO;
import com.se.team4.common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HomeDAO {
    public static HomeDAO it;

    public static HomeDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new HomeDAO();
        return it;
    }
    //테스트 메소드
    public Boolean loginCheck(String data) {
        String arr[] = data.split("-/-/-"); // 0 id, 1 password
        String id = arr[0];
        String password = arr[1];

        ArrayList<UserDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner que = new QueryRunner();
            list = que.query(conn, "SELECT * FROM user WHERE id=?;", new MapListHandler(),id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
//        System.out.println(list);
        if(list.size()>0){//입력한 id가 존재할 때
            Gson gson = new Gson();
            result = gson.fromJson(gson.toJson(list), new TypeToken<List<UserDTO>>() {            }.getType());
            String realPassword=result.get(0).getPassword();
            if(password.equals(realPassword)){
                return true; //로그인 성공
            }
            return false;//로그인 실패
        }
        return false;//로그인 실패
    }

    public UserDTO getUserInfo(String id) {
        ArrayList<UserDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner que = new QueryRunner();
            list = que.query(conn, "SELECT * FROM user WHERE id=?;", new MapListHandler(), id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<UserDTO>>() {
        }.getType());
//        System.out.println(list);
        return result.get(0);
    }
}
