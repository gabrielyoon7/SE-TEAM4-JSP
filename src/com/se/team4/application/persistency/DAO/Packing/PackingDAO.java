package com.se.team4.application.persistency.DAO.Packing;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.MENU.MenuDTO;
import com.se.team4.application.persistency.DTO.Packing.PickupDTO;
import com.se.team4.common.sql.Config;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

public class PackingDAO {
    public static PackingDAO it;
    public static PackingDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new PackingDAO();
        return it;
    }
    public ArrayList<MenuDTO> getMenuList() {
        ArrayList<MenuDTO> result = null;
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
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<MenuDTO>>() {
        }.getType());
//        System.out.println(list);
        return result;
    }
    public ArrayList<MenuDTO> getSelectedMenuList(String carts) {
        String selectedMenu[]=carts.split(",");
        String query="SELECT * FROM Menu WHERE ";
        for(String menu : selectedMenu){
            query+="name='"+menu+"' OR ";
        }
        query = query.substring(0,query.length()-4); //마지막 잉여 OR 잘라내기.
        ArrayList<MenuDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, query, new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<MenuDTO>>() {
        }.getType());
//        System.out.println(list);
        return result;
    }


    public String packingOrder(String data) {
        String arr[] = data.split("~!~!~"); // 0 id, 1 name, 2 orderedList, 3 payment, 4 totalPrice, 5 message
        String id = arr[0];
        String name = arr[1];
        String orderedList = arr[2];
        String payment=arr[3];
        String totalPrice=arr[4];
        String message=arr[5];
        Date date=new Date();
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try {
            QueryRunner que = new QueryRunner();
            que.query(conn, "INSERT Pickup SET id=?, name=?, date=?, orderedList=?, payment=?, totalPrice=?, message=?, verifyCode=?;", new MapListHandler(),
                    id, name, date, orderedList, payment, totalPrice, message, verifyCode);
            list = que.query(conn, "SELECT * FROM Pickup WHERE verifyCode=?", new MapListHandler(), verifyCode);
            System.out.println(list);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        ArrayList<PickupDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<PickupDTO>>() {}.getType());

        System.out.println(result.get(0).getOid());
        return result.get(0).getOid();
    }

    public ArrayList<PickupDTO> getOrderInfo(String oid) {
        ArrayList<PickupDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM Pickup WHERE oid =?", new MapListHandler(), oid);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<PickupDTO>>() {
        }.getType());
        return result;
    }
}
