package com.se.team4.application.domain.admin;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.application.persistency.DAO.WalkIn.WalkInDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class StatisticsManagerAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받음
        request.setAttribute("date", gson.toJson(date));//다음 페이지로 date 파라미터를 그대로 넘김
        ArrayList<String> sevenDays = make7days(date);
        request.setAttribute("incomeOfDate7", gson.toJson(PackingDAO.getInstance().getOrderListOfDay(sevenDays.get(0))));
        request.setAttribute("incomeOfDate6", gson.toJson(PackingDAO.getInstance().getOrderListOfDay(sevenDays.get(1))));
        request.setAttribute("incomeOfDate5", gson.toJson(PackingDAO.getInstance().getOrderListOfDay(sevenDays.get(2))));
        request.setAttribute("incomeOfDate4", gson.toJson(PackingDAO.getInstance().getOrderListOfDay(sevenDays.get(3))));
        request.setAttribute("incomeOfDate3", gson.toJson(PackingDAO.getInstance().getOrderListOfDay(sevenDays.get(4))));
        request.setAttribute("incomeOfDate2", gson.toJson(PackingDAO.getInstance().getOrderListOfDay(sevenDays.get(5))));
        request.setAttribute("incomeOfDate1", gson.toJson(PackingDAO.getInstance().getOrderListOfDay(sevenDays.get(6))));
        request.setAttribute("date7", gson.toJson(sevenDays.get(0)));
        request.setAttribute("date6", gson.toJson(sevenDays.get(1)));
        request.setAttribute("date5", gson.toJson(sevenDays.get(2)));
        request.setAttribute("date4", gson.toJson(sevenDays.get(3)));
        request.setAttribute("date3", gson.toJson(sevenDays.get(4)));
        request.setAttribute("date2", gson.toJson(sevenDays.get(5)));
        request.setAttribute("date1", gson.toJson(sevenDays.get(6)));
        return "RequestDispatcher:jsp/manager/statisticsManager.jsp";
    }

    public ArrayList<String>  make7days(String date) throws Exception {
        ArrayList<String> days = new ArrayList<>();
        days.add(date);

        String arr[] = date.split("-");
        String year = arr[0];
        String month = arr[1];
        String day = arr[2];
        String newDate = year+month+day;
        for(int i=0; i<6;i++){
            newDate = AddDate(newDate, 0,0,-1);
            String newYear = newDate.substring(0,4);
            String newMonth = newDate.substring(4,6);
            String newDay = newDate.substring(6,8);
            String originalDateFormat = newYear+"-"+newMonth+"-"+newDay;
            days.add(originalDateFormat);
        }
        return days;
    }
    private static String AddDate(String strDate, int year, int month, int day) throws Exception {
        SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
        Calendar cal = Calendar.getInstance();
        Date dt = dtFormat.parse(strDate);
        cal.setTime(dt);
        cal.add(Calendar.YEAR, year);
        cal.add(Calendar.MONTH, month);
        cal.add(Calendar.DATE, day);
        return dtFormat.format(cal.getTime());
    }

}
