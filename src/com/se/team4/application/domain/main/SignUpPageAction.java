package com.se.team4.application.domain.main;

import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignUpPageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null)
            return "RequestDispatcher:jsp/page/signup.jsp";
        else
            return "RequestDispatcher:jsp/page/main.jsp";
    }
}
