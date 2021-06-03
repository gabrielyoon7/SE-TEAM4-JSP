package com.se.team4.application.domain.admin;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Home.HomeDAO;
import com.se.team4.application.persistency.DAO.Table.TableDAO;
import com.se.team4.application.persistency.DAO.WalkIn.WalkInDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RestaurantManagerAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        request.setAttribute("tableList", gson.toJson(TableDAO.getInstance().getTable()));
        request.setAttribute("covidLog", gson.toJson(HomeDAO.getInstance().getCovidLog()));
        return "RequestDispatcher:jsp/manager/restaurantManager.jsp";
    }
}
