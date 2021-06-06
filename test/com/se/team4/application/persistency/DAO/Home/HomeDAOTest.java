package com.se.team4.application.persistency.DAO.Home;

import static org.junit.jupiter.api.Assertions.*;

class HomeDAOTest {

    @org.junit.jupiter.api.Test
    void loginCheck() { //로그인 테스트
        HomeDAO homeDAO = new HomeDAO();
        assertTrue(homeDAO.loginCheck("201713919"+"-/-/-"+"1234"));
        assertFalse(homeDAO.loginCheck("201713919"+"-/-/-"+"0000"));
    }

    @org.junit.jupiter.api.Test
    void signUp(){ //회원가입 시 중복회원 있는지 테스트
        HomeDAO homeDAO = new HomeDAO();
        assertEquals("실패", homeDAO.signUp("name"+"-/-/-"+"2020-01-01"+"-/-/-"+"201713919"+"-/-/-"+"0000"+"-/-/-"+"010-0000-0000"));
    }
    @org.junit.jupiter.api.Test
    void changeBlacklist(){ //블랙리스트 점검
        HomeDAO homeDAO = new HomeDAO();
        assertEquals("true", homeDAO.changeBlacklist("201713919"+"-/-/-"+"false"));
    }
    @org.junit.jupiter.api.Test
    void addCovidLog(){ //블랙리스트 점검
        HomeDAO homeDAO = new HomeDAO();
        assertEquals("", homeDAO.addCovidLog("2020-01-01"+"-/-/-"+"10"+"-/-/-"+"3"+"-/-/-"+"김우중"+"-/-/-"+"경기도 수원시 영통구 광교산로 154-42"
                +"-/-/-"+"010-1111-1111"+"-/-/-"+"없음"+"-/-/-"+"36"));
        //date+"-/-/-"+time_num+"-/-/-"+table_num+"-/-/-"+name+"-/-/-"+address+"-/-/-"+phoneNumber+"-/-/-"+symptom+"-/-/-"+temperature;
    }
}