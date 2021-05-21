package com.se.team4.application.domain.reservation;

import com.google.gson.Gson;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받음
        String time = request.getParameter("time"); //이전 페이지로부터 date 파라미터를 받아서
        Gson gson = new Gson();
        request.setAttribute("date", gson.toJson(date));//다음 페이지로 date 파라미터를 그대로 넘김
        request.setAttribute("time", gson.toJson(time));//다음 페이지로 time 파라미터를 그대로 넘김

        return "RequestDispatcher:jsp/reservation/reservationInfo.jsp";
    }
}
