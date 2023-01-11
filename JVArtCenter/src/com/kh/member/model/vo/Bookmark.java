package com.kh.member.model.vo;

public class Bookmark {
    
    private String memNo;
    private String exNo;
    
    public Bookmark() {}
    public Bookmark(String memNo, String exNo) {
        super();
        this.memNo = memNo;
        this.exNo = exNo;
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
    
    @Override
    public String toString() {
        return "Bookmark [memNo=" + memNo + ", exNo=" + exNo + "]";
    }
}
