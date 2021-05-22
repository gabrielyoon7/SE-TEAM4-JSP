package com.se.team4.application.domain.admin;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Home.HomeDAO;
import com.se.team4.application.persistency.DAO.Reservation.ReservationDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomerManagerAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        request.setAttribute("TableList", gson.toJson(ReservationDAO.getInstance().getTables()));
        request.setAttribute("NewOrderList", gson.toJson(ReservationDAO.getInstance().getReservatoinRequestList()));
        return "RequestDispatcher:jsp/manager/customerManager.jsp";
    }
}
