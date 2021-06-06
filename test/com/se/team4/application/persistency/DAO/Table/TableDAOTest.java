package com.se.team4.application.persistency.DAO.Table;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

public class TableDAOTest {
    @Test
    void addTable() {
        TableDAO tableDAO = new TableDAO();
        assertEquals("", tableDAO.addTable("7"+"-/-/-"+"7"+"-/-/-"+"5"));
        //data =number+"-/-/-"+place+"-/-/-"+limits;
    }

    @Test
    void modifyTable() {
        TableDAO tableDAO = new TableDAO();
        assertEquals("", tableDAO.modifyTable("7"+"-/-/-"+"7"+"-/-/-"+"7"+"-/-/-"+"7"));
        //data =oid+"-/-/-"+number+"-/-/-"+places+"-/-/-"+"limits;
    }
    @Test
    void deleteTable() {
        TableDAO tableDAO = new TableDAO();
        assertEquals("", tableDAO.deleteTable("7"));
    }
}
