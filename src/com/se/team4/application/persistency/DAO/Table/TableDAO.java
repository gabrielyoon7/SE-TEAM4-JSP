package com.se.team4.application.persistency.DAO.Table;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.Reservation.ReservationRequestDTO;
import com.se.team4.common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class TableDAO {

    public static TableDAO it;

    public static TableDAO getInstance(){
        if(it==null)
            it = new TableDAO();
        return it;
    }

    public void addTable(String data){      //테이블 추가
        String arr[] = data.split("-/-/-");

        String number = arr[0];
        String places = arr[1];
        String limits = arr[2];
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "INSERT table SET number=?, places=?,limits=?;", new MapListHandler(),
                    number, places, limits);
//          System.out.println("ddd");
            list = que.query(conn, "SELECT * FROM table", new MapListHandler());
//          System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationRequestDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {}.getType());


    }
    public void deleteTable(String number){     //테이블 삭제
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.query(conn, "DELETE FROM table WHERE number=?", new MapListHandler(), number);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
    }


}
