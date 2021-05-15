package com.se.team4.application.domain.admin;

import com.google.gson.Gson;
import com.se.team4.application.persistency.DAO.Packing.PackingDAO;
import com.se.team4.application.persistency.DTO.Home.UserDTO;
import com.se.team4.common.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 온라인으로 주문한 내역을 확인하기 위한 페이지를 연결해줌.
 * */
public class PickupManagerAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        HttpSession session = request.getSession();
        Gson gson = new Gson();
        String user = (String) request.getSession().getAttribute("user");//session에 있는 로그인 정보(user)를 조회하기 위한 사전 작업
        UserDTO loadedUser = gson.fromJson(user, UserDTO.class);
        if(!loadedUser.getType().equals("관리자")) //관리자가 아닌경우 error 페이지 출력
            return "RequestDispatcher:jsp/page/error.jsp";
        else {
            request.setAttribute("orderInfo", gson.toJson(PackingDAO.getInstance().getOrderList())); //주문자 리스트 전체 불러오기
            return "RequestDispatcher:jsp/manager/pickupManager.jsp";
        }
    }
}
