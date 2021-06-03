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


        ArrayList<String> sevenWeeks = make7weeks(date);
//        System.out.println("hhh");
        request.setAttribute("getOrderListOfWeek7", gson.toJson(PackingDAO.getInstance().getOrderListOfWeek(sevenWeeks.get(0))));
        request.setAttribute("getOrderListOfWeek6", gson.toJson(PackingDAO.getInstance().getOrderListOfWeek(sevenWeeks.get(1))));
        request.setAttribute("getOrderListOfWeek5", gson.toJson(PackingDAO.getInstance().getOrderListOfWeek(sevenWeeks.get(2))));
        request.setAttribute("getOrderListOfWeek4", gson.toJson(PackingDAO.getInstance().getOrderListOfWeek(sevenWeeks.get(3))));
        request.setAttribute("getOrderListOfWeek3", gson.toJson(PackingDAO.getInstance().getOrderListOfWeek(sevenWeeks.get(4))));
        request.setAttribute("getOrderListOfWeek2", gson.toJson(PackingDAO.getInstance().getOrderListOfWeek(sevenWeeks.get(5))));
        request.setAttribute("getOrderListOfWeek1", gson.toJson(PackingDAO.getInstance().getOrderListOfWeek(sevenWeeks.get(6))));
        request.setAttribute("week7", gson.toJson(sevenWeeks.get(0)));
        request.setAttribute("week6", gson.toJson(sevenWeeks.get(1)));
        request.setAttribute("week5", gson.toJson(sevenWeeks.get(2)));
        request.setAttribute("week4", gson.toJson(sevenWeeks.get(3)));
        request.setAttribute("week3", gson.toJson(sevenWeeks.get(4)));
        request.setAttribute("week2", gson.toJson(sevenWeeks.get(5)));
        request.setAttribute("week1", gson.toJson(sevenWeeks.get(6)));



        return "RequestDispatcher:jsp/manager/statisticsManager.jsp";
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
    public ArrayList<String>  make7weeks(String date) throws Exception {
//        System.out.println("hhh");
        ArrayList<String> weeks = new ArrayList<>();
        weeks.add(date);

        String arr[] = date.split("-");
        String year = arr[0];
        String month = arr[1];
        String day = arr[2];
        String newDate = year+month+day;
        for(int i=0; i<6;i++){
            newDate = AddDate(newDate, 0,0,-7);
            String newYear = newDate.substring(0,4);
            String newMonth = newDate.substring(4,6);
            String newDay = newDate.substring(6,8);
            String originalDateFormat = newYear+"-"+newMonth+"-"+newDay;
            weeks.add(originalDateFormat);
        }
        return weeks;
    }


}
