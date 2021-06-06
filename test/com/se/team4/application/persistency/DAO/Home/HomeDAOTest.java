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




}