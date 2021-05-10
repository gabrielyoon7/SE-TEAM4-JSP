package com.se.team4.application.domain.main;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.se.team4.common.controller.Action;


public class LogoutAction implements Action {

    /**
     * session에 있는 로그인 정보를 없애버리는 역할을 합니다.
     * */
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("Index");
        return null;
    }
}
