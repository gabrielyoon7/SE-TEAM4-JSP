package com.se.team4.common.controller;

import javax.servlet.http.*;

public interface Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
