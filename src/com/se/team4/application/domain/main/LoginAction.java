package com.se.team4.application.domain.main;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Home.HomeDAO;
import com.se.team4.application.persistency.DAO.TestDAO;
import com.se.team4.application.persistency.DTO.Home.UserDTO;
import com.se.team4.common.controller.Action;
import com.se.team4.common.controller.LoginManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginManager manager = LoginManager.getInstance();
        String data = request.getParameter("data");
//        System.out.println(data);
        Boolean check = HomeDAO.getInstance().loginCheck(data);
//        System.out.println(check);
        Gson gson = new Gson();
        HttpSession session = request.getSession();
        if (check==false){ //로그인정보 미일치
            return "실패";//실패했다는걸 알려줘야함
        }
        else{//로그인 성공
            String arr[] = data.split("-/-/-");
            String id=arr[0];
            if (manager.isUsing(id)) {
                manager.removeSession(id);
            }
            session.setAttribute("user", gson.toJson(HomeDAO.getInstance().getUserInfo(id)));
            return "성공";//User정보를 함께 반환해야함
        }
    }
}
