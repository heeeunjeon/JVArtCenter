package com.kh.newsletter.model.vo;

import java.sql.Date;

public class Newsletter {
    
    private int newsNo;
    private String newsCategory;
    private String newsTitle;
    private String newsContent;
    private Date newsDate;
    private int newsCount;
    private String newsStatus;
    // 이전게시물. 다음게시물을 위한 필드
    private int nextNo;
    private int lastNo;
    private String nextTitle;
    private String lastTitle;
    private String titleImg; // 경로를 포함한 썸네일 파일의 수정명
    
    public Newsletter() {}
    public Newsletter(int newsNo, String newsCategory, String newsTitle, String newsContent, Date newsDate,
            int newsCount, String newsStatus) {
        super();
        this.newsNo = newsNo;
        this.newsCategory = newsCategory;
        this.newsTitle = newsTitle;
        this.newsContent = newsContent;
        this.newsDate = newsDate;
        this.newsCount = newsCount;
        this.newsStatus = newsStatus;
    }
    // 전체조회용 생성자
    public Newsletter(int newsNo, String newsCategory, String newsTitle, Date newsDate, int newsCount) {
        super();
        this.newsNo = newsNo;
        this.newsCategory = newsCategory;
        this.newsTitle = newsTitle;
        this.newsDate = newsDate;
        this.newsCount = newsCount;
    }
    // 상세조회용 생성자
    public Newsletter(int newsNo, String newsCategory, String newsTitle, String newsContent, Date newsDate, int nextNo,
            int lastNo, String nextTitle, String lastTitle) {
        super();
        this.newsNo = newsNo;
        this.newsCategory = newsCategory;
        this.newsTitle = newsTitle;
        this.newsContent = newsContent;
        this.newsDate = newsDate;
        this.nextNo = nextNo;
        this.lastNo = lastNo;
        this.nextTitle = nextTitle;
        this.lastTitle = lastTitle;
    }
    
    public int getNewsNo() {
        return newsNo;
    }
    public void setNewsNo(int newsNo) {
        this.newsNo = newsNo;
    }
    public String getNewsCategory() {
        return newsCategory;
    }
    public void setNewsCategory(String newsCategory) {
        this.newsCategory = newsCategory;
    }
    public String getNewsTitle() {
        return newsTitle;
    }
    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }
    public String getNewsContent() {
        return newsContent;
    }
    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }
    public Date getNewsDate() {
        return newsDate;
    }
    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
    }
    public int getNewsCount() {
        return newsCount;
    }
    public void setNewsCount(int newsCount) {
        this.newsCount = newsCount;
    }
    public String getNewsStatus() {
        return newsStatus;
    }
    public void setNewsStatus(String newsStatus) {
        this.newsStatus = newsStatus;
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
    public String getTitleImg() {
        return titleImg;
    }
    public void setTitleImg(String titleImg) {
        this.titleImg = titleImg;
    }
    
    @Override
    public String toString() {
        return "Newsletter [newsNo=" + newsNo + ", newsCategory=" + newsCategory + ", newsTitle=" + newsTitle
                + ", newsContent=" + newsContent + ", newsDate=" + newsDate + ", newsCount=" + newsCount
                + ", newsStatus=" + newsStatus + "]";
    }
}
