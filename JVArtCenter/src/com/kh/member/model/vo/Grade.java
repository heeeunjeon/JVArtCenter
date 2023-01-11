package com.kh.member.model.vo;

public class Grade {
    
    private String grCode;
    private String grName;
    private double discount;
    
    public Grade() {}
    public Grade(String grCode, String grName, double discount) {
        super();
        this.grCode = grCode;
        this.grName = grName;
        this.discount = discount;
    }
    
    public String getGrCode() {
        return grCode;
    }
    public void setGrCode(String grCode) {
        this.grCode = grCode;
    }
    public String getGrName() {
        return grName;
    }
    public void setGrName(String grName) {
        this.grName = grName;
    }
    public double getDiscount() {
        return discount;
    }
    public void setDiscount(double discount) {
        this.discount = discount;
    }
    
    @Override
    public String toString() {
        return "Grade [grCode=" + grCode + ", grName=" + grName + ", discount=" + discount + "]";
    }
}
