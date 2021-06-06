package com.se.team4.application.persistency.DAO.Packing;

import com.se.team4.application.persistency.DAO.Home.HomeDAO;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PackingDAOTest {

    @Test
    void packingOrder() {
        PackingDAO packingDAO = new PackingDAO();
        assertEquals("-1", packingDAO.packingOrder("admin"+"~!~!~"+"admin"+"~!~!~"+"dd"+"~!~!~"+"onlinePayment"+"~!~!~"+"99999999"+"~!~!~"+"message"+"~!~!~"+"100000"));
//        String arr[] = data.split("~!~!~"); // 0 id, 1 name, 2 orderedList, 3 payment, 4 totalPrice, 5 message, 6 point
    }
}