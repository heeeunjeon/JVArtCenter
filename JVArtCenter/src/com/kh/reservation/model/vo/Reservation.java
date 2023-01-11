package com.kh.reservation.model.vo;

public class Reservation {
    
    private int resvNo;
    private String memNo;
    private String exNo;
    private String resvDate;
    private int count;
    private int payment;
    private String impUid;
    private String payDate;
    private String payStatus;
    private String receipt;
    
    public Reservation() {}
    public Reservation(int resvNo, String memNo, String exNo, String resvDate, int count, int payment, String impUid,
            String payDate, String payStatus, String receipt) {
        super();
        this.resvNo = resvNo;
        this.memNo = memNo;
        this.exNo = exNo;
        this.resvDate = resvDate;
        this.count = count;
        this.payment = payment;
        this.impUid = impUid;
        this.payDate = payDate;
        this.payStatus = payStatus;
        this.receipt = receipt;
    }
    
    // 결제정보를 담아 DB에 담는 용도
    public Reservation(int resvNo, int payment, String impUid, String payStatus, String receipt) {
        super();
        this.resvNo = resvNo;
        this.payment = payment;
        this.impUid = impUid;
        this.payStatus = payStatus;
        this.receipt = receipt;
    }
    
    // 내 예매내역들 조회용
    public Reservation(int resvNo, String exNo, String resvDate, int count, int payment, String payDate, String payStatus,
            String receipt) {
        super();
        this.resvNo = resvNo;
        this.exNo = exNo;
        this.resvDate = resvDate;
        this.count = count;
        this.payment = payment;
        this.payDate = payDate;
        this.payStatus = payStatus;
        this.receipt = receipt;
    }
    
    public Reservation(int resvNo, String exNo, String resvDate, int count, int payment, String impUid,
            String payDate, String payStatus, String receipt) {
        super();
        this.resvNo = resvNo;
        this.exNo = exNo;
        this.resvDate = resvDate;
        this.count = count;
        this.payment = payment;
        this.impUid = impUid;
        this.payDate = payDate;
        this.payStatus = payStatus;
        this.receipt = receipt;
    }
    
    public int getResvNo() {
        return resvNo;
    }
    public void setResvNo(int resvNo) {
        this.resvNo = resvNo;
    }
    public String getMemNo() {
        return memNo;
    }
    public void setMemNo(String memNo) {
        this.memNo = memNo;
    }
    public String getExNo() {
        return exNo;
    }
    public void setExNo(String exNo) {
        this.exNo = exNo;
    }
    public String getResvDate() {
        return resvDate;
    }
    public void setResvDate(String resvDate) {
        this.resvDate = resvDate;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
    public int getPayment() {
        return payment;
    }
    public void setPayment(int payment) {
        this.payment = payment;
    }
    public String getImpUid() {
        return impUid;
    }
    public void setImpUid(String impUid) {
        this.impUid = impUid;
    }
    public String getPayDate() {
        return payDate;
    }
    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }
    public String getPayStatus() {
        return payStatus;
    }
    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }
    public String getReceipt() {
        return receipt;
    }
    public void setReceipt(String receipt) {
        this.receipt = receipt;
    }
    
    @Override
    public String toString() {
        return "Reservation [resvNo=" + resvNo + ", memNo=" + memNo + ", exNo=" + exNo + ", resvDate=" + resvDate
                + ", count=" + count + ", payment=" + payment + ", impUid=" + impUid + ", payDate=" + payDate
                + ", payStatus=" + payStatus + ", receipt=" + receipt + "]";
    }
}
