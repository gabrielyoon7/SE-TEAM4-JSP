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
import java.text.SimpleDateFormat;
import java.util.*;

public class ReservationDAO {
    public static ReservationDAO it;

    public static ReservationDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new ReservationDAO();
        return it;
    }
    public ArrayList<ReservationRequestDTO> getReservationRequestList() {  //고객 예약 요청 리스트 db 불러오기
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
       // System.out.println(list);
       // System.out.println(result.get(0).getDate());
        return result;
    }
    public ArrayList<ReservationDTO> getReservationList(String date) {  //고객 예약 리스트 db 불러오기
        ArrayList<ReservationDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM Reservation WHERE date=?", new MapListHandler(), date);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationDTO>>() {
        }.getType());
        // System.out.println(list);
        // System.out.println(result.get(0).getDate());
        return result;
    }
    public String addReservationRequest(String data) {    //고객 예약 요청 리스트 추가
        System.out.println(data);
        String arr[] = data.split("-/-/-"); //data = covers+"-/-/-"+date+"-/-/-"+time+"-/-/-"+user.name+"-/-/-"+user.id+"-/-/-"+message;
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
        System.out.println(result.get(0).getOid());
        String oid = result.get(0).getOid();
        return oid;
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

    public String addReservation(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //order.covers+"-/-/-"+order.date+"-/-/-"+order.time+"-/-/-"+order.customer_id;+"-/-/-"+order.customer_name
        String covers = arr[0];
        //	5월 26, 2021
//        String newDate[]=arr[1].split(", ");
//        String mmddyy[]=newDate[0].split("월 ");
//        mmddyy[2]=newDate[1];
//        if(mmddyy[1].length()<2)
//            mmddyy[1]="0"+mmddyy[1];
//        String date = mmddyy[2]+"-"+mmddyy[0]+"-"+mmddyy[1];

        String date = arr[1];

        String[] array = date.split("월 ");          // array[0]는 월, array[1]은 일이랑 년도


        String[] array2 =array[1].split(", ");      //array2[0]는 일, array2[1]는 년도


        date = array2[1]+"-"+array[0]+"-"+array2[0];




        String time = arr[2];
        String id = arr[3];
        String name=arr[4];
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn,"INSERT Reservation SET covers=?, date=?,time=?,customer_name=?,customer_id=?, table_id=?;",new MapListHandler(),
                    covers,date,time,name,id, 1 );
//            System.out.println("ddd");
//            System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<ReservationDTO>>() {}.getType());


        return result.get(0).getOid();
    }

//    public static String dateToString(Date date) {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        return sdf.format(date);
//    }

}
