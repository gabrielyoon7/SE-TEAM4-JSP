package com.se.team4.application.domain.menu;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.MENU.MenuDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MenuAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        request.setAttribute("menuList", gson.toJson(MenuDAO.getInstance().getMenuList()));
        return "RequestDispatcher:jsp/menu/menu.jsp";
    }
}
