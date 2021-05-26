package com.se.team4.application.persistency.DAO.Reservation;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.Packing.PickupDTO;
import com.se.team4.application.persistency.DTO.Reservation.ReservationDTO;
import com.se.team4.application.persistency.DTO.Reservation.ReservationRequestDTO;
import com.se.team4.application.persistency.DTO.Reservation.TableDTO;
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

public class ReservationDAO {
    public static ReservationDAO it;

    public static ReservationDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new ReservationDAO();
        return it;
    }
    public ArrayList<ReservationRequestDTO> getReservatoinRequestList() {  //고객 예약 요청 리스트 db 불러오기
        ArrayList<ReservationRequestDTO> result = null;
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
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {
        }.getType());
//        System.out.println(list);
        return result;
    }
    public String addReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-");
        String covers = arr[0];
        String date = arr[1];
        String time = arr[2];
        String name = arr[3];
        String id = arr[4];
        String message = arr[5];
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn,"INSERT ReservationRequest SET covers=?, date=?,time=?,customer_name=?,customer_id=?, message=?, verifyCode=?;",new MapListHandler(),
                    covers,date,time,name,id,message,verifyCode );
//            System.out.println("ddd");
            list = que.query(conn, "SELECT * FROM ReservationRequest WHERE verifyCode=?", new MapListHandler(), verifyCode);
//            System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationRequestDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationRequestDTO>>() {}.getType());

//        System.out.println(result.get(0).getOid());
        return result.get(0).getOid();
    }

    public ArrayList<?> getSchedule(String date) {
        return null;
    }

    public ArrayList<TableDTO> getTables() {  //테이블 받아오기
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
