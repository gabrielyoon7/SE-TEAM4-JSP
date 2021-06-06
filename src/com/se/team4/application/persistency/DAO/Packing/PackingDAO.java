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
import java.text.SimpleDateFormat;
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
        String arr[] = data.split("~!~!~"); // 0 id, 1 name, 2 orderedList, 3 payment, 4 totalPrice, 5 message, 6 point
        String id = arr[0];
        String name = arr[1];
        String orderedList = arr[2];
        String payment=arr[3];
        String totalPrice=arr[4];
        String message=arr[5];
        String point=arr[6];
        int newPointInt=Integer.parseInt(point)-Integer.parseInt(totalPrice);
        String newPointString=Integer.toString(newPointInt);
        System.out.println(name);
        Date date=new Date();
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try {
            QueryRunner que = new QueryRunner();

            if(payment.equals("onlinePayment")){
                if(newPointInt>=0) {
                    que.query(conn, "UPDATE User SET point=? WHERE id=?", new MapListHandler(),
                            newPointString, id);
                }
                else {
                    return "-1";
                }
            }
            que.query(conn, "INSERT Pickup SET id=?, name=?, date=?, orderedList=?, payment=?, totalPrice=?, message=?, verifyCode=?;", new MapListHandler(),
                    id, name, date, orderedList, payment, totalPrice, message, verifyCode);
            list = que.query(conn, "SELECT * FROM Pickup WHERE verifyCode=?", new MapListHandler(), verifyCode);
//            System.out.println(list);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        ArrayList<PickupDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<PickupDTO>>() {}.getType());

//        System.out.println(result.get(0).getOid());
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

    public ArrayList<PickupDTO> getOrderList(){
        ArrayList<PickupDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM Pickup ORDER BY oid DESC", new MapListHandler());
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

    public String getOrderListOfDay(String date){
        List<Map<String, Object>> list = null;
        String totalPrice = "";
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT SUM(totalPrice) FROM Pickup WHERE date=?", new MapListHandler(), date);
            totalPrice=list.get(0).toString();
//            System.out.println(totalPrice);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        String arr[]=totalPrice.split("=");
        totalPrice=arr[1].substring(0,arr[1].length()-1);
        if(totalPrice.equals("null")){
            totalPrice="0";
        }
//        System.out.println(totalPrice);
        return totalPrice;
    }

    public String getOrderListOfWeek(String date) throws Exception {
//        System.out.println("dddd");
        String newDate = AddDate2(date, 0,0,-6);
//        System.out.println(newDate);
        List<Map<String, Object>> list = null;
        String totalPrice = "";
        Connection conn = Config.getInstance().sqlLogin();
        String queryString = "";
//        queryString += "SELECT DATE_FORMAT(DATE_SUB(`date`, INTERVAL (DAYOFWEEK(`date`)-1) DAY), '%Y/%m/%d') as start,"
//                +"DATE_FORMAT(DATE_SUB(`date`, INTERVAL (DAYOFWEEK(`date`)-7) DAY), '%Y/%m/%d') as end,"
//                +"DATE_FORMAT(`date`, '%Y%U') AS `date`,SUM(`totalPrice`) FROM Pickup GROUP BY date;";
//        queryString += "SELECT DATE_FORMAT(DATE_SUB(`"+date+"`, INTERVAL (DAYOFWEEK(`"+date+"`)-1) DAY), '%Y/%m/%d') as start,"
//                +"DATE_FORMAT(DATE_SUB(`"+date+"`, INTERVAL (DAYOFWEEK(`"+date+"`)-7) DAY), '%Y/%m/%d') as end,"
//                +"DATE_FORMAT(`"+date+"`, '%Y%U') AS `date`,SUM(`totalPrice`) FROM Pickup GROUP BY date;";
        queryString += "SELECT SUM(totalPrice) FROM Pickup" +
                " WHERE DATE(`date`) >= STR_TO_DATE('"+newDate+"', '%Y-%m-%d')" +
                "   AND DATE(`date`) <= STR_TO_DATE('"+date+"', '%Y-%m-%d');";
        System.out.println(queryString);
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, queryString, new MapListHandler());
            totalPrice=list.get(0).toString();
//            System.out.println(totalPrice);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
//        String arr[]=totalPrice.split("=");
//        totalPrice=arr[1].substring(0,arr[1].length()-1);
//        if(totalPrice.equals("null")){
//            totalPrice="0";
//        }
        String arr[]=totalPrice.split("=");
        totalPrice=arr[1].substring(0,arr[1].length()-1);
        if(totalPrice.equals("null")){
            totalPrice="0";
        }
        System.out.println("weektest: "+totalPrice);
        return totalPrice;
    }

    private static String AddDate2(String strDate, int year, int month, int day) throws Exception {
        SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        Date dt = dtFormat.parse(strDate);
        cal.setTime(dt);
        cal.add(Calendar.YEAR, year);
        cal.add(Calendar.MONTH, month);
        cal.add(Calendar.DATE, day);
        String dateString = dtFormat.format(cal.getTime());
//        System.out.println(dtFormat.format(cal.getTime()));
//        System.out.println("dddd");
        return dateString;
    }

    public void completeOrder(String id) {
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            queryRunner.query(conn, "UPDATE Pickup SET statement =? WHERE oid=?", new MapListHandler(), "주문완료",id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }

    }

    public ArrayList<PickupDTO> getUserOrder(String id){
        ArrayList<PickupDTO> result = null;
        List<Map<String, Object>> list = null;
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner queryRunner = new QueryRunner();
            list = queryRunner.query(conn, "SELECT * FROM Pickup WHERE id=?", new MapListHandler(), id);
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

    public String chargePoint(String data) {
        String arr[] = data.split("~!~!~"); // 0 id, 1 name, 2 orderedList, 3 payment, 4 totalPrice, 5 message, 6 point
        String id = arr[0];
        String point=arr[1];
        String charge=arr[2];
        System.out.println(point+" "+charge);
        int newPointInt=Integer.parseInt(point)+Integer.parseInt(charge);
        String newPointString=Integer.toString(newPointInt);
        Connection conn = Config.getInstance().sqlLogin();
        try {
            QueryRunner que = new QueryRunner();
            que.query(conn, "UPDATE User SET point=? WHERE id=?", new MapListHandler(),
                    newPointString, id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return newPointString;
    }
}
