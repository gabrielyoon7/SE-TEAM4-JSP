package com.se.team4.application.domain.reservation;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.application.persistency.DAO.Reservation.ReservationDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectTimeAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받아서
        Gson gson = new Gson();
        request.setAttribute("date", gson.toJson(date));//다음 페이지로 date 파라미터를 그대로 넘기고
        request.setAttribute("getSchedule", gson.toJson(ReservationDAO.getInstance().getSchedule(date))); //해당 date의 스케쥴을 돌려줌 (미완성)
        return "RequestDispatcher:jsp/reservation/selectTime.jsp";
    }
}
