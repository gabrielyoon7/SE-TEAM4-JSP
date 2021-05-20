package com.se.team4.application.persistency.DAO.Reservation;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.Reservation.ReservationDTO;
import com.se.team4.common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReservationDAO {
    public static ReservationDAO it;

    public static ReservationDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new ReservationDAO();
        return it;
    }
    public ArrayList<ReservationDTO> getReservatoinRequestList() {  //고객 예약 요청 리스트 db 불러오기
        ArrayList<ReservationDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM ReservationRequest", new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationDTO>>() {
        }.getType());
//        System.out.println(list);
        return result;
    }
    public void addReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-");
        String oid = arr[0];
        String covers = arr[1];
        String date = arr[2];
        String time = arr[3];
        String table_id = arr[4];
        String customer_id = arr[5];
        String arrivalTime = arr[6];

        Connection conn = Config.getInstance().sqlLogin();

        try{
            QueryRunner que = new QueryRunner();
            que.update(conn,"INSERT ReservationRequest SET covers=?, date=?,time=?,table_id=?,customer_id=?,arrivalTime=?; WHERE oid=?;",covers,date,time,table_id,customer_id,arrivalTime );
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
    }

    public ArrayList<?> getSchedule(String date) {
        return null;
    }
}
