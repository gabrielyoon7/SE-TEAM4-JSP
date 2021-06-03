package com.se.team4.application.persistency.DAO.Table;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.Reservation.ReservationRequestDTO;
import com.se.team4.application.persistency.DTO.Reservation.TableDTO;
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
import java.util.Random;

public class TableDAO {

    public static TableDAO it;

    public static TableDAO getInstance(){
        if(it==null)
            it = new TableDAO();
        return it;
    }

    public String addTable(String data){      //테이블 추가
        String arr[] = data.split("-/-/-");

        String number = arr[0];
        String places = arr[1];
        String limits = arr[2];
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "INSERT  `Table` SET number=?, places=?,limits=?;", new MapListHandler(),
                    number, places, limits);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
    public String deleteTable(String number){     //테이블 삭제
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.query(conn, "DELETE FROM  `Table` WHERE number=?", new MapListHandler(), number);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
    public String modifyTable(String data){     //테이블 삭제
        String arr[] = data.split("-/-/-");
        String oid = arr[0];
        String number = arr[1];
        String places = arr[2];
        String limits = arr[3];
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.query(conn, "UPDATE `Table` SET number=?,places=?,limits=?  WHERE oid=?", new MapListHandler(),
                    number, places, limits, oid);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return "";
    }


    public ArrayList<TableDTO> getTable() {
        ArrayList<TableDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM `Table`", new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<TableDTO>>() {
        }.getType());
        return result;
    }

}
