package com.se.team4.application.persistency.DAO;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.TestDTO;
import com.se.team4.common.sql.Config;

import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class TestDAO {
    public static TestDAO it;

    public static TestDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new TestDAO();
        return it;
    }
    //테스트 메소드
    public ArrayList<TestDTO> getSomething(int num) {
        ArrayList<TestDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            if(num==0){
                list = queryRunner.query(conn, "SELECT * FROM customer", new MapListHandler());
            }
            else{
                list = queryRunner.query(conn, "SELECT * FROM customer WHERE oid=?", new MapListHandler(), num);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<TestDTO>>() {
        }.getType());
        System.out.println(list);
        return result;
    }

    public String modifyContent(String data) {
        String arr[] = data.split("-/-/-"); // 0 oid 1 name 2 phoneNumber
        String oid = arr[0];
        String name = arr[1];
        String phoneNumber = arr[2];
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner que = new QueryRunner();
            que.update(conn, "UPDATE customer SET name=?, phoneNumber=? WHERE oid=?;", name, phoneNumber, oid);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
}
