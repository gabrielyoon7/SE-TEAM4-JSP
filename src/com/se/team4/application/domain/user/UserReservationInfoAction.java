package com.se.team4.application.domain.user;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Reservation.ReservationDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserReservationInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String date = request.getParameter("date"); //이전 페이지로부터 date 파라미터를 받음
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        Gson gson = new Gson();
        if(session.getAttribute("user") == null){
            return "RequestDispatcher:jsp/page/error.jsp";
        }
        else{
            request.setAttribute("ReservationRequest", gson.toJson(ReservationDAO.getInstance().getUserReservationRequest(id)));
        }
        return "RequestDispatcher:jsp/user/userReservationInfo.jsp";
    }
}
