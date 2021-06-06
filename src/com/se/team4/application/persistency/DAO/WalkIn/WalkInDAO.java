package com.se.team4.application.persistency.DAO.WalkIn;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DAO.Reservation.ReservationDAO;
import com.se.team4.application.persistency.DTO.Reservation.ReservationDTO;
import com.se.team4.application.persistency.DTO.Reservation.ReservationRequestDTO;
import com.se.team4.application.persistency.DTO.WalkIn.WaitingListDTO;
import com.se.team4.application.persistency.DTO.WalkIn.WalkInDTO;
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

public class WalkInDAO {
    public static WalkInDAO it;

    public static WalkInDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new WalkInDAO();
        return it;
    }
    public String addWalkInRequest(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-");
        String date = arr[0];
        String time = arr[1];
        String covers = arr[2];
        String table = arr[3];
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> check_walkIn = null;
        List<Map<String, Object>> check_reservation = null;
        List<Map<String, Object>> watingListWalkIn = null;
        List<Map<String, Object>> watingListReservation = null;
        try{
            QueryRunner que = new QueryRunner();
            check_walkIn=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                    date,time,table);
            check_reservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                    date,time,table);
            watingListWalkIn=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=?", new MapListHandler(),
                    date,time);
            watingListReservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=?", new MapListHandler(),
                    date,time);
//            if(watingListWalkIn.size()+watingListReservation.size()==3){
//                return "-2"; // 대기리스트
//            }
            if(check_walkIn.size()+check_reservation.size()==0) {
                que.query(conn, "INSERT WalkIn SET covers=?, date=?, time=?, table_id=?, verifyCode=?;", new MapListHandler(),
                        covers, date, time, table, verifyCode);
            }
            else {
//              System.out.println("이미 입석한 손님 존재");
                return "-1"; // 오류의 표시
            }
//            System.out.println("ddd");
//            list = que.query(conn, "SELECT * FROM WalkIn WHERE verifyCode=?", new MapListHandler(), verifyCode);
//            System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{

            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationRequestDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<WalkInDTO>>() {}.getType());

//        System.out.println(result.get(0).getOid());
        return result.get(0).getOid();
    }
    public ArrayList<WalkInDTO> getWalkInList(String date) {  //고객 예약 리스트 db 불러오기
        ArrayList<WalkInDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM WalkIn WHERE date=?", new MapListHandler(), date);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<WalkInDTO>>() {
        }.getType());
        // System.out.println(list);
        // System.out.println(result.get(0).getDate());
        return result;
    }
    public String makeWaitingList(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+table+"-/-/-"+cover+-/-/-name;
        String date = arr[0];
//        String table_id = arr[1];
        String covers=arr[1];
        String name=arr[2];
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "INSERT WaitingList SET covers=?, date=?, name=?, verifyCode=? ;", new MapListHandler(),
                    covers, date, name, verifyCode);
//          System.out.println("ddd");
           list = que.query(conn, "SELECT * FROM WaitingList WHERE verifyCode=?", new MapListHandler(), verifyCode);
//          System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<ReservationRequestDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<WalkInDTO>>() {}.getType());

//        System.out.println(result.get(0).getOid());
        return result.get(0).getOid();
    }
    public ArrayList<WaitingListDTO> getWaitingList(String date) {  //고객 예약 리스트 db 불러오기
        ArrayList<WaitingListDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM WaitingList WHERE date=?", new MapListHandler(), date);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<WaitingListDTO>>() {
        }.getType());
        // System.out.println(list);
        // System.out.println(result.get(0).getDate());
        return result;
    }
    public String addWaitingListToWalkIn(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data =waiting.covers+"-/-/-"+waiting.date+"-/-/-"+waiting.name;
        String covers = arr[0];
        String date = arr[1];
//        String[] array = date.split("월 ");          // array[0]는 월, array[1]은 일이랑 년도
//        String[] array2 =array[1].split(", ");      //array2[0]는 일, array2[1]는 년도
//        date = array2[1]+"-"+array[0]+"-"+array2[0];
        String name=arr[2];
        String time=arr[3];
        System.out.println(time+date);
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        List<Map<String, Object>> table = null;
        List<Map<String, Object>> check_walkIn = null;
        List<Map<String, Object>> check_reservation = null;
        List<Map<String, Object>> check_walkIn1 = null;
        List<Map<String, Object>> check_reservation1 = null;
        try{
            QueryRunner que = new QueryRunner();
            table=que.query(conn,"SELECT * FROM `Table`",new MapListHandler());
            check_walkIn1=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=?", new MapListHandler(),
                    date,time);
            check_reservation1=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=?", new MapListHandler(),date,time);
            if(check_walkIn1.size()+check_reservation1.size()==3){
                return "-1";
            }
            for(int table_id = 1; table_id<=table.size();table_id++){//모든 테이블 좌석 검사
                check_walkIn=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                        date,time,table_id);
                check_reservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=? AND table_id=?", new MapListHandler(),date,time,table_id);
                if(check_walkIn.size()+check_reservation.size()==0){
                    que.query(conn,"INSERT WalkIn SET covers=?, date=?,time=?, table_id=?;",new MapListHandler(),
                            covers,date,time, table_id );
                    que.query(conn, "DELETE FROM WaitingList WHERE name=? AND date=?", new MapListHandler(), name, date);
                    break;
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
//        ArrayList<WaitingListDTO> result = null;
//        Gson gson = new Gson();
//        result = gson.fromJson(gson.toJson(list), new TypeToken<List<WaitingListDTO>>() {}.getType());
        return "";
    }
    public String deleteSchedule(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time+"-/-/-"+table;
        String date = arr[0];
        String time=arr[1];
        String table_id=arr[2];
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "DELETE FROM WalkIn WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                    date, time, table_id);
            que.query(conn, "DELETE FROM Reservation WHERE date=? AND time=? AND table_id=?", new MapListHandler(),
                    date, time, table_id);
//          System.out.println("ddd");
//            list = que.query(conn, "SELECT * FROM WaitingList WHERE verifyCode=?", new MapListHandler(), verifyCode);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
//        ArrayList<WaitingListDTO> result = null;
//        Gson gson = new Gson();
//        result = gson.fromJson(gson.toJson(list), new TypeToken<List<WaitingListDTO>>() {}.getType());
        return "";
    }
    public String modifyWalkIn(String data) {    //고객 예약 요청 리스트 추가
        String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+name;
        String date = arr[0];
        String time=arr[1];
        String cover=arr[2];
        String table=arr[3];
        String oid=arr[4];
        List<Map<String, Object>> check_reservation = null;
        List<Map<String, Object>> check_walkIn = null;
        Connection conn = Config.getInstance().sqlLogin();
        try{
            QueryRunner que = new QueryRunner();
            check_reservation=que.query(conn,"SELECT * FROM Reservation WHERE date=? AND time=? AND table_id=?",new MapListHandler(),
                    date, time, table);
            check_walkIn=que.query(conn,"SELECT * FROM WalkIn WHERE date=? AND time=? AND table_id=?",new MapListHandler(),
                    date, time, table);
            if(check_reservation.size()+check_walkIn.size()==0) {
                que.query(conn, "UPDATE WalkIn SET date=?, time=?, covers=?, table_id=? WHERE oid=?", new MapListHandler(),
                        date, time, cover, table, oid);
            }
            else return "-1";
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        return "";
    }
}
