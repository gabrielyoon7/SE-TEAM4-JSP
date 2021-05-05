package com.se.team4.application.domain;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.TestDAO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        request.setAttribute("getSomething", gson.toJson(TestDAO.getInstance().getSomething(1)));
        return "RequestDispatcher:test.jsp";
    }
}
