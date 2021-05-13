package com.se.team4.application.persistency.DAO.Packing;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.Packing.PackingDTO;
import com.se.team4.common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PackingDAO {
    public static PackingDAO it;
    public static PackingDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new PackingDAO();
        return it;
    }
    public ArrayList<PackingDTO> getMenuList() {
        ArrayList<PackingDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();

            list = queryRunner.query(conn, "SELECT * FROM Menu", new MapListHandler());


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<PackingDTO>>() {
        }.getType());
//        System.out.println(list);
        return result;
    }
}
