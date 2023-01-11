package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {
    
    private int noticeNo;
    private String noticeCategory;
    private String noticeTitle;
    private String noticeContent;
    private Date noticeDate;
    private int noticeCount;
    private String noticeStatus;
    // 이전게시물. 다음게시물을 위한 필드
    private int nextNo;
    private int lastNo;
    private String nextTitle;
    private String lastTitle;
    
    public Notice() {}
    
    public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent, Date noticeDate,
            int noticeCount, String noticeStatus) {
        super();
        this.noticeNo = noticeNo;
        this.noticeCategory = noticeCategory;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeDate = noticeDate;
        this.noticeCount = noticeCount;
        this.noticeStatus = noticeStatus;
    }
    
    // 전체조회용 생성자
    public Notice(int noticeNo, String noticeCategory, String noticeTitle, Date noticeDate, int noticeCount) {
        super();
        this.noticeNo = noticeNo;
        this.noticeCategory = noticeCategory;
        this.noticeTitle = noticeTitle;
        this.noticeDate = noticeDate;
        this.noticeCount = noticeCount;
    }
    
    // 상세조회용 생성자
    public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent, Date noticeDate,
            int nextNo, int lastNo, String nextTitle, String lastTitle) {
        super();
        this.noticeNo = noticeNo;
        this.noticeCategory = noticeCategory;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeDate = noticeDate;
        this.nextNo = nextNo;
        this.lastNo = lastNo;
        this.nextTitle = nextTitle;
        this.lastTitle = lastTitle;
    }
    
    public int getNoticeNo() {
        return noticeNo;
    }

 

    public Notice(String noticeCategory, String noticeTitle, String noticeContent, Date noticeDate) {
        super();
        this.noticeCategory = noticeCategory;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeDate = noticeDate;
    }

    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }
    public String getNoticeCategory() {
        return noticeCategory;
    }
    public void setNoticeCategory(String noticeCategory) {
        this.noticeCategory = noticeCategory;
    }
    public String getNoticeTitle() {
        return noticeTitle;
    }
    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }
    public String getNoticeContent() {
        return noticeContent;
    }
    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }
    public Date getNoticeDate() {
        return noticeDate;
    }
    public void setNoticeDate(Date noticeDate) {
        this.noticeDate = noticeDate;
    }
    public int getNoticeCount() {
        return noticeCount;
    }
    public void setNoticeCount(int noticeCount) {
        this.noticeCount = noticeCount;
    }
    public String getNoticeStatus() {
        return noticeStatus;
    }
    public void setNoticeStatus(String noticeStatus) {
        this.noticeStatus = noticeStatus;
    }
    
    public int getNextNo() {
        return nextNo;
    }

    public void setNextNo(int nextNo) {
        this.nextNo = nextNo;
    }

    public int getLastNo() {
        return lastNo;
    }

    public void setLastNo(int lastNo) {
        this.lastNo = lastNo;
    }

    public String getNextTitle() {
        return nextTitle;
    }

    public void setNextTitle(String nextTitle) {
        this.nextTitle = nextTitle;
    }

    public String getLastTitle() {
        return lastTitle;
    }

    public void setLastTitle(String lastTitle) {
        this.lastTitle = lastTitle;
    }

    @Override
    public String toString() {
        return "Notice [noticeNo=" + noticeNo + ", noticeCategory=" + noticeCategory + ", noticeTitle=" + noticeTitle
                + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeCount=" + noticeCount
                + ", noticeStatus=" + noticeStatus + "]";
    }
}
