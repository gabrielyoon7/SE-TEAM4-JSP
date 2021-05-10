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

import com.se.team4.application.persistency.DAO.Home.HomeDAO;
import com.se.team4.application.persistency.DAO.TestDAO;
import com.se.team4.common.controller.Action;
import com.se.team4.common.controller.LoginManager;

public class AjaxAction implements Action {
// DB를 JSP에서 JAVA로 보낼 때 사용하는 클래스
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();
        String req = request.getParameter("req"); //JSP에서 넘겨준 req
        String data = request.getParameter("data"); //JSP에서 넘겨준 data
        HttpSession session = request.getSession(); //Session에 뭔가 해야할 때
        String result=null;
        switch(req) {
            case "updateTestInfo":   //직접 권한 확인
                result = TestDAO.getInstance().modifyContent(data); //수정 데이터를 보냅니다.
                break;
            case "login":
                LoginManager manager = LoginManager.getInstance();
                Boolean check = HomeDAO.getInstance().loginCheck(data); //받은 데이터를 일단 loginCheck으로 넘겨서 이 아이디와 비밀번호가 유효한지 검사합니다.
                if (check==false){ //로그인정보 미일치 시
                    return "실패";//실패했다는걸 JSP에게 알려줘야합니다.
                }
                else {//로그인 성공
                    String arr[] = data.split("-/-/-");
                    String id = arr[0];
                    if (manager.isUsing(id)) { //중복 접속 제한
                        manager.removeSession(id); //다른 세션에 접속되어있는 내 계정을 전부 로그아웃 시켜버립니다.
                    }
                    session.setAttribute("user", gson.toJson(HomeDAO.getInstance().getUserInfo(id))); //로그인 정보는 어디서든 사용되므로 세션에 넣습니다.
                    return "성공";//성공했다는 걸 JSP에게 알려줘야 합니다.
                }
            case "signup":
                result = HomeDAO.getInstance().signUp(data);
                break;

        }
        return result;
    }

}