package com.se.team4.application.domain.packing;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BasketAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        Gson gson = new Gson();
//        request.setAttribute("menuList", gson.toJson(BasketDAO.getInstance().getMenuList()));
        return "RequestDispatcher:jsp/packing/basket.jsp";
    }
}
