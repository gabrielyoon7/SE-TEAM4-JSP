package com.se.team4.application.domain.menu;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.MENU.MenuDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MenuInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String oid = request.getParameter("oid");
        request.setAttribute("menu", gson.toJson(MenuDAO.getInstance().getMenu(oid)));
        return "RequestDispatcher:jsp/menu/menuInfo.jsp";
    }
}
