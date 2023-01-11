package com.kh.reservation.model.vo;

public class Rate {

    private int rate; // 비율
    private String label; // 대상(10대 남성, 20대 여성, 30대 남성 ...)

    public Rate() {

    }

    public Rate(int rate, String label) {
        this.rate = rate;
        this.label = label;
    }

    public int getRate() {
        return rate;
    }

    public String getLabel() {
        return label;
    }
    
    public void setRate(int rate) {
        this.rate = rate;
    }
    
    public void setLabel(String label) {
        this.label = label;
    }
}
