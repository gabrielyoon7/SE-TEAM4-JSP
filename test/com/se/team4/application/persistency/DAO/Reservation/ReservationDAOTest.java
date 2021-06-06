package com.se.team4.application.persistency.DAO.Reservation;

import com.se.team4.application.persistency.DAO.Home.HomeDAO;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ReservationDAOTest {

    @Test
    void addReservationRequest() {
        ReservationDAO reservationDAO = new ReservationDAO();
        assertEquals("-1", reservationDAO.addReservationRequest("0"+"-/-/-"+"2020-01-01"+"-/-/-"+"0"+"-/-/-"+"윤주현"+"-/-/-"+"201713919"+"-/-/-"+"message"));
        //covers+"-/-/-"+date+"-/-/-"+time+"-/-/-"+user.name+"-/-/-"+user.id+"-/-/-"+message
    }
    @Test
    void checkReservationRequest() {
        ReservationDAO reservationDAO = new ReservationDAO();
        assertEquals("", reservationDAO.checkReservationRequest("0"+"-/-/-"+"2020-01-01"));
        /**        String arr[] = data.split("-/-/-");
         String time=arr[0];
         String date=arr[1];
         * */
    }

    @Test
    void modifyReservation(){
        ReservationDAO reservationDAO = new ReservationDAO();
        assertEquals("-1", reservationDAO.modifyReservation("2020-01-01"+"-/-/-"+"0"+"-/-/-"+"1"+"-/-/-"+"1"+"-/-/-"+"0"));
/**
 *         String arr[] = data.split("-/-/-"); //data=date+"-/-/-"+time+"-/-/-"+cover+"-/-/-"+name;
 *         String date = arr[0];
 *         String time=arr[1];
 *         String cover=arr[2];
 *         String table=arr[3];
 *         String oid=arr[4];
 *         */
    }

}