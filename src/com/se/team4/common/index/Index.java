package com.se.team4.common.index;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 로그아웃을 위해 존재하는 페이지.
 * */

@WebServlet("/Index")
public class Index extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Index() {
        super();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("WEB-INF/jsp/page/main.jsp").forward(request, response);
        } catch(Exception ex) {
            throw new ServletException(ex.getMessage(), ex);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
