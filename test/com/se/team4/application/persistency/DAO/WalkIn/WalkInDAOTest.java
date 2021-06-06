package com.se.team4.application.persistency.DAO.WalkIn;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class WalkInDAOTest {
    @Test
    void addWaitingListToWalkIn() {
        WalkInDAO walkInDAO = new WalkInDAO();
        assertEquals("", walkInDAO.addWaitingListToWalkIn("1"+"-/-/-"+"2020-01-01"+"-/-/-"+"김우중"+"-/-/-"+"10"));
        //data =waiting.covers+"-/-/-"+waiting.date+"-/-/-"+waiting.name;
    }
    @Test
    void deleteSchedule() {
        WalkInDAO walkInDAO = new WalkInDAO();
        assertEquals("", walkInDAO.deleteSchedule("2020-01-01"+"-/-/-"+"10"+"-/-/-"+"1"));
        //data=date+"-/-/-"+time+"-/-/-"+table;
    }
    @Test
    void modifyWalkIn() {
        WalkInDAO walkInDAO = new WalkInDAO();
        assertEquals("", walkInDAO.modifyWalkIn("2020-01-01"+"-/-/-"+"10"+"-/-/-"+"1"+"-/-/-"+"김우중"+"-/-/-"+"1"));
        //data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+name+"-/-/-"+oid;
    }
}
