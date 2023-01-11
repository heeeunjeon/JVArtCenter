package com.kh.reservation.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.exhibition.model.vo.Exhibition;
import com.kh.reservation.model.vo.Rate;
import com.kh.reservation.model.vo.Reservation;
import com.kh.reservation.model.vo.Sales;

public class ReservationDao {
    
    private Properties prop = new Properties();
    
    public ReservationDao() {
        
        String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-mapper.xml").getPath();
        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Exhibition> selectExList(Connection conn) {
        
        ArrayList<Exhibition> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectExList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Exhibition(rset.getInt("EX_NO")
                                      , rset.getString("LC_NAME")
                                      , rset.getString("EX_TITLE")
                                      , rset.getString("START_DATE")
                                      , rset.getString("END_DATE")
                                      , rset.getString("EX_THUMBNAIL")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    public ArrayList<Exhibition> searchList(Connection conn, String keyword) {
        
        ArrayList<Exhibition> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("searchList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, "%" + keyword + "%");
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Exhibition(rset.getInt("EX_NO")
                                      , rset.getString("LC_NAME")
                                      , rset.getString("EX_TITLE")
                                      , rset.getString("START_DATE")
                                      , rset.getString("END_DATE")
                                      , rset.getString("EX_THUMBNAIL")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    public Exhibition selectExOne(Connection conn, int exNo) {
        
        Exhibition ex = null;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectExOne");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, exNo);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                ex = new Exhibition(rset.getInt("EX_NO")
                                  , rset.getString("LC_NAME")
                                  , rset.getString("EX_TITLE")
                                  , rset.getString("START_DATE")
                                  , rset.getString("END_DATE")
                                  , rset.getInt("PRICE")
                                  , rset.getString("EX_THUMBNAIL"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return ex;
    }
    
    public double getDiscount(Connection conn, int memNo) {
        
        double discount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("getDiscount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, memNo);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                
                discount = rset.getDouble("DISCOUNT");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return discount;
    }
    
    public int insertReservation(Connection conn, Reservation rv) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("insertReservation");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, rv.getMemNo());
            pstmt.setString(2, rv.getExNo());
            pstmt.setString(3, rv.getResvDate());
            pstmt.setInt(4, rv.getCount());
            pstmt.setInt(5, rv.getPayment());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int selectResvNo(Connection conn) {
        
        int resvNo = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectResvNo");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                resvNo = rset.getInt("RESV_NO") - 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return resvNo;
    }
    
    public int updateReservation(Connection conn, Reservation rv) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("updateReservation");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, rv.getPayment());
            pstmt.setString(2, rv.getImpUid());
            pstmt.setString(3, rv.getPayStatus());
            pstmt.setString(4, rv.getReceipt());
            pstmt.setInt(5, rv.getResvNo());
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int dropReservation(Connection conn, int resvNo) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("dropReservation");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, resvNo);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public int deleteReservation(Connection conn, String impUid) {
        
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = prop.getProperty("deleteReservation");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, impUid);
            
            result = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }
    
    public ArrayList<Reservation> selectMyResvList(Connection conn, int memNo, int month) {
        
        ArrayList<Reservation> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectMyResvList");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, memNo);
            pstmt.setInt(2, month);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Reservation(rset.getInt("RESV_NO")
                                       , rset.getString("EX_TITLE")
                                       , rset.getString("RESV_DATE")
                                       , rset.getInt("COUNT")
                                       , rset.getInt("PAYMENT")
                                       , rset.getString("PAY_DATE")
                                       , rset.getString("PAY_STATUS")
                                       , rset.getString("RECEIPT")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }
    
    public Reservation selectMyResvOne(Connection conn, int resvNo) {
        
        Reservation rv = null;
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("selectMyResvOne");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, resvNo);
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) {
                
                rv = new Reservation(rset.getInt("RESV_NO")
                                   , rset.getString("EX_NO")
                                   , rset.getString("RESV_DATE")
                                   , rset.getInt("COUNT")
                                   , rset.getInt("PAYMENT")
                                   , rset.getString("IMP_UID")
                                   , rset.getString("PAY_DATE")
                                   , rset.getString("PAY_STATUS")
                                   , rset.getString("RECEIPT"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return rv;
    }
    
    public ArrayList<Reservation> searchResvDate(Connection conn, int memNo, String start, String end) {
        
        ArrayList<Reservation> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        
        String sql = prop.getProperty("searchResvDate");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, memNo);
            pstmt.setString(2, start);
            pstmt.setString(3, end);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Reservation(rset.getInt("RESV_NO")
                                       , rset.getString("EX_TITLE")
                                       , rset.getString("RESV_DATE")
                                       , rset.getInt("COUNT")
                                       , rset.getInt("PAYMENT")
                                       , rset.getString("PAY_DATE")
                                       , rset.getString("PAY_STATUS")
                                       , rset.getString("RECEIPT")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        
        return list;
    }

    public Sales selectTodaySales(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("selectTodaySales");
        Sales todaySales = new Sales();

        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                todaySales.setTotal(rset.getInt("TOTAL"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            close(rset);
            close(pstmt);
        }
        return todaySales;
    }

    public Sales selectWeekSales(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        Sales weekSales = new Sales();
        String sql = prop.getProperty("selectWeekSales");
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();

            if (rset.next()) {
                weekSales.setTotal(rset.getInt("TOTAL"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            close(rset);
            close(pstmt);
        }
        return weekSales;
    }

    public ArrayList<Sales> selectSalesPerMonth(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Sales> list = new ArrayList<>();
        String sql = prop.getProperty("selectSalesPerMonth");

        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();
            while (rset.next()) {
                list.add(new Sales(rset.getInt("TOTAL"),
                        rset.getString("DATE_RANGE")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }

    public ArrayList<Rate> selectResvRatePerGen(Connection conn) {

        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Rate> list = new ArrayList<>();
        String sql = prop.getProperty("selectResvRatePerGen");
        try {
            pstmt = conn.prepareStatement(sql);
            rset = pstmt.executeQuery();

            while (rset.next()) {
                list.add(new Rate(rset.getInt("RATE"),
                                  rset.getString("LABEL")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
    }
    
    public int selectAllCount(Connection conn) {
        
        int listCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = prop.getProperty("selectAllCount");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            rset = pstmt.executeQuery();
            if(rset.next()) {
                listCount = rset.getInt("COUNT");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return listCount;
    }
    
    public ArrayList<Reservation> selectReservationListAll(Connection conn, PageInfo pi) {
        
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        ArrayList<Reservation> list = new ArrayList<>();
        
        String sql = prop.getProperty("selectReservationListAll");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() - 1;
            
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            
            rset = pstmt.executeQuery();
            
            while(rset.next()) {
                
                list.add(new Reservation(rset.getInt("RESV_NO")
                                       , rset.getString("MEM_NAME")
                                       , rset.getString("EX_TITLE")
                                       , rset.getString("RESV_DATE")
                                       , rset.getInt("COUNT")
                                       , rset.getInt("PAYMENT")
                                       , rset.getString("IMP_UID")
                                       , rset.getString("PAY_DATE")
                                       , rset.getString("PAY_STATUS")
                                       , rset.getString("RECEIPT")));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            close(rset);
            close(pstmt);
        }
        
        return list;
        
    }
}

