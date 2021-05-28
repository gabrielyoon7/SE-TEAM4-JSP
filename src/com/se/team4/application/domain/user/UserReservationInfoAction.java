package com.se.team4.application.domain.user;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Reservation.ReservationDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserReservationInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받음
        Gson gson = new Gson();
        request.setAttribute("ReservationList", gson.toJson(ReservationDAO.getInstance().getReservationList(date)));
        return "RequestDispatcher:jsp/user/userReservationInfo.jsp";
    }
}
