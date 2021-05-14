package com.se.team4.application.domain.packing;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BasketAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null) //로그인하지 않은 사용자의 경우(비정상적 접근)
            return "RequestDispatcher:jsp/page/error.jsp";
        else {
            String carts = request.getParameter("carts"); //?로 넘겨준 carts 값을 가져옴
            Gson gson = new Gson();
            request.setAttribute("selectedMenuList", gson.toJson(PackingDAO.getInstance().getSelectedMenuList(carts)));
            return "RequestDispatcher:jsp/packing/basket.jsp";
        }
    }
}
