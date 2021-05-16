package com.se.team4.application.persistency.DAO.Reservation;

import com.se.team4.application.persistency.DAO.TestDAO;

import java.util.ArrayList;

public class ReservationDAO {
    public static ReservationDAO it;

    public static ReservationDAO getInstance() { //인스턴스 생성
        if (it == null)
            it = new ReservationDAO();
        return it;
    }


    public ArrayList<?> getSchedule(String date) {
        return null;
    }
}
