package com.se.team4.application.domain.admin;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PickupManagerAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null) //로그인하지 않은 사용자의 경우(비정상적 접근)
            return "RequestDispatcher:jsp/page/error.jsp";
        else {
            Gson gson = new Gson();
            request.setAttribute("orderInfo", gson.toJson(PackingDAO.getInstance().getOrderList()));
            return "RequestDispatcher:jsp/manager/pickupManager.jsp";
        }
    }
}
