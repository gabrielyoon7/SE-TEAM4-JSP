package com.se.team4.application.domain.packing;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BasketAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String carts = request.getParameter("carts"); //?로 넘겨준 carts 값을 가져옴
        Gson gson = new Gson();
        request.setAttribute("selectedMenuList", gson.toJson(PackingDAO.getInstance().getSelectedMenuList(carts)));
        return "RequestDispatcher:jsp/packing/basket.jsp";
    }
}
