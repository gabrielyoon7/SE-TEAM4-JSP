package com.se.team4.application.domain.packing;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PackingAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null) //로그인하지 않은 사용자의 경우에만 로그인 페이지를 띄워줌
            return "RequestDispatcher:jsp/page/login.jsp";
        else{
            Gson gson = new Gson();
            request.setAttribute("menuList", gson.toJson(PackingDAO.getInstance().getMenuList()));
            return "RequestDispatcher:jsp/packing/packing.jsp";
        }
    }
}
