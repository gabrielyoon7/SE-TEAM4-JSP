package com.se.team4.application.persistency.DAO.Home;

import static org.junit.jupiter.api.Assertions.*;

class HomeDAOTest {

    @org.junit.jupiter.api.Test
    void loginCheck() {
        HomeDAO homeDAO = new HomeDAO();
        assertEquals(true, homeDAO.loginCheck("201713919"+"-/-/-"+"1234"));
        assertEquals(false, homeDAO.loginCheck("201713919"+"-/-/-"+"0000"));
    }
}