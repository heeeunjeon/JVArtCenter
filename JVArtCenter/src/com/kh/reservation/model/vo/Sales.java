package com.kh.reservation.model.vo;

public class Sales {

    private int total; // 총 매출액
    private String dateRange; // 날짜범위 (하루, 주, 개월)
    
    public Sales() {
        
    }

    public Sales(int total, String dateRange) {
        super();
        this.total = total;
        this.dateRange = dateRange;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getDateRange() {
        return dateRange;
    }

    public void setDateRange(String dateRange) {
        this.dateRange = dateRange;
    }

    @Override
    public String toString() {
        return "Sales [total=" + total + ", dateRange=" + dateRange + "]";
    }
    
    
}
