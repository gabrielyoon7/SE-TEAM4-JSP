package com.se.team4.application.persistency.DAO.CovidLog;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.se.team4.application.persistency.DTO.CovidLog.CovidLogDTO;
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

public class CovidLogDAO {
    public static CovidLogDAO it;

    public static CovidLogDAO getInstance(){
        if(it==null)
            it = new CovidLogDAO();
        return it;
    }
    public String addCovidLog(String data){
        String arr[] = data.split("-/-/-");
        String name = arr[0];
        String address = arr[1];
        String phoneNumber = arr[2];
        String symptom = arr[3];
        String temperature = arr[4];
        String tableNumber = arr[5];
        Random random = new Random();
        int verifyCode=random.nextInt(100000000);
        Connection conn = Config.getInstance().sqlLogin();
        List<Map<String, Object>> list = null;
        try{
            QueryRunner que = new QueryRunner();
            que.query(conn, "INSERT covidlog SET name=?, address=?,phoneNumber=?,symptom=?,temperature=?, tableNumber=?;", new MapListHandler(),
                    name, address, phoneNumber, symptom, temperature, tableNumber);
//          System.out.println("ddd");
            list = que.query(conn, "SELECT * FROM covidlog ", new MapListHandler(), verifyCode);
//          System.out.println(list);
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            DbUtils.closeQuietly(conn);
        }
        ArrayList<CovidLogDTO> result = null;
        Gson gson = new Gson();
        result = gson.fromJson(gson.toJson(list), new TypeToken<List<CovidLogDTO>>() {}.getType());
        System.out.println(result.get(0).getName());
        String name1 = result.get(0).getName();
        return name1;
    }
}
