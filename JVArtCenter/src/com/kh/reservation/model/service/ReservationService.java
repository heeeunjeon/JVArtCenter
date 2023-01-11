package com.kh.reservation.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.exhibition.model.vo.Exhibition;
import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Rate;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.Sales;

public class ReservationService {
    
    public ArrayList<Exhibition> selectExList() {
        
        Connection conn = getConnection();
        
        ArrayList<Exhibition> list = new ReservationDao().selectExList(conn);
        
        close(conn);
        
        return list;
    }
    
    public ArrayList<Exhibition> searchList(String keyword) {
        
        Connection conn = getConnection();
        
        ArrayList<Exhibition> list = new ReservationDao().searchList(conn, keyword);
        
        close(conn);
        
        return list;
    }
    
    public Exhibition selectExOne(int exNo) {
        
        Connection conn = getConnection();
        
        Exhibition ex = new ReservationDao().selectExOne(conn, exNo);
        
        close(conn);
        
        return ex;
    }
    
    public double getDiscount(int memNo) {
        
        Connection conn = getConnection();
        
        double discount = new ReservationDao().getDiscount(conn, memNo);
        
        close(conn);
        
        return discount;
    }
    
    public int insertReservation(Reservation rv) {
        
        Connection conn = getConnection();
        
        int result = new ReservationDao().insertReservation(conn, rv);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return result;
    }
    
    public int selectResvNo() {
        
        Connection conn = getConnection();
        
        int resvNo = new ReservationDao().selectResvNo(conn);
        
        return resvNo;
    }
    
    public int updateReservation(Reservation rv) {
        
        Connection conn = getConnection();
        
        int result = new ReservationDao().updateReservation(conn, rv);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return result;
    }
    
    public int dropReservation(int resvNo) {
        
        Connection conn = getConnection();
        
        int result = new ReservationDao().dropReservation(conn, resvNo);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return result;
    }
    
    public int deleteReservation(String impUid) {
        
        Connection conn = getConnection();
        
        int result = new ReservationDao().deleteReservation(conn, impUid);
        
        if(result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        
        return result;
    }
    
    public ArrayList<Reservation> selectMyResvList(int memNo, int month) {
        
        Connection conn = getConnection();
        
        ArrayList<Reservation> list = new ReservationDao().selectMyResvList(conn, memNo, month);
        
        close(conn);
        
        return list;
    }
    
    public Reservation selectMyResvOne(int resvNo) {
        
        Connection conn = getConnection();
        
        Reservation rv = new ReservationDao().selectMyResvOne(conn, resvNo);
        
        close(conn);
        
        return rv;
    }
    
    public ArrayList<Reservation> searchResvDate(int memNo, String start, String end) {
        
        Connection conn = getConnection();
        
        ArrayList<Reservation> list = new ReservationDao().searchResvDate(conn, memNo, start, end);
        
        close(conn);
        
        return list;
    }
    

    public Sales selectTodaySales() {

        Connection conn = getConnection();

        Sales todaySales = new ReservationDao().selectTodaySales(conn);

        close(conn);

        return todaySales;
    }

    public Sales selectWeekSales() {

        Connection conn = getConnection();

        Sales weekSales = new ReservationDao().selectWeekSales(conn);

        close(conn);

        return weekSales;
    }

    public ArrayList<Sales> selectSalesPerMonth() {

        Connection conn = getConnection();

        ArrayList<Sales> list = new ReservationDao().selectSalesPerMonth(conn);

        close(conn);

        return list;
    }

    public ArrayList<Rate> selectResvRatePerGen() {

        Connection conn = getConnection();
        
        ArrayList<Rate> list =new ReservationDao().selectResvRatePerGen(conn);
        
        close(conn);
        
        return list;
    }
    
    public int selectAllCount() {
        
        Connection conn = getConnection();
        
        int count = new ReservationDao().selectAllCount(conn);
        
        close(conn);
        
        return count;
    }
    
    public ArrayList<Reservation> selectReservationListAll(PageInfo pi) {
        
        Connection conn = getConnection();
        
        ArrayList<Reservation> list = new ReservationDao().selectReservationListAll(conn, pi);
        
        close(conn);
        
        return list;
    }


}
