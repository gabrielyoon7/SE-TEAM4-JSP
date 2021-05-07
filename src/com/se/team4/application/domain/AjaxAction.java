package com.se.team4.application.domain;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import com.se.team4.application.persistency.DAO.TestDAO;
import com.se.team4.common.controller.Action;

public class AjaxAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String modify = null;
        String req = request.getParameter("req");
        String data = request.getParameter("data");
        HttpSession session = request.getSession();
        String result=null;
        switch(req) {
            case "updateTestInfo":   //직접 권한 확인
                result = TestDAO.getInstance().modifyContent(data);
                break;
        }
        return result;
    }

}