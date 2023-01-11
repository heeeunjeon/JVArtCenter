package com.kh.exhibition.model.vo;

public class Exhibition {
    
    private int exNo;
    private String lcCode;
    private String exTitle;
    private String exContent;
    private String startDate;
    private String endDate;
    private int price;
    private String artists;
    private String exThumbnail;
    private String exImage;
    private String exStatus;
    
    public Exhibition() {}
    public Exhibition(int exNo, String lcCode, String exTitle, String exContent, String startDate, String endDate,
            int price, String artists, String exThumbnail, String exImage, String exStatus) {
        super();
        this.exNo = exNo;
        this.lcCode = lcCode;
        this.exTitle = exTitle;
        this.exContent = exContent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
        this.artists = artists;
        this.exThumbnail = exThumbnail;
        this.exImage = exImage;
        this.exStatus = exStatus;
    }
    
    // 전시 상세조회용
    public Exhibition(int exNo, String lcCode, String exTitle, String exContent, String startDate, String endDate,
            int price, String artists, String exThumbnail, String exImage) {
        super();
        this.exNo = exNo;
        this.lcCode = lcCode;
        this.exTitle = exTitle;
        this.exContent = exContent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
        this.artists = artists;
        this.exThumbnail = exThumbnail;
        this.exImage = exImage;
    }
    
    // 메인 올해 전시 조회
    public Exhibition(String exTitle, String startDate, String endDate) {
        super();
        this.exTitle = exTitle;
        this.startDate = startDate;
        this.endDate = endDate;
    }
    
    // 관리자
    // 전체 전시 목록
    public Exhibition(int exNo, String lcCode, String exTitle, String startDate, String endDate) {
        super();
        this.exNo = exNo;
        this.lcCode = lcCode;
        this.exTitle = exTitle;
        this.startDate = startDate;
        this.endDate = endDate;
    }
    // 전시 추가용
    public Exhibition(String lcCode, String exTitle, String exContent, String startDate, String endDate, int price,
            String artists) {
        super();
        this.lcCode = lcCode;
        this.exTitle = exTitle;
        this.exContent = exContent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
        this.artists = artists;
    }
    
    // ----- 예매관련 -----
    // 예매 가능한 전시 목록 조회용
    public Exhibition(int exNo, String lcCode, String exTitle, String startDate, String endDate, String exThumbnail) {
        super();
        this.exNo = exNo;
        this.lcCode = lcCode;
        this.exTitle = exTitle;
        this.startDate = startDate;
        this.endDate = endDate;
        this.exThumbnail = exThumbnail;
    }
    
    // 예매한 전시 정보 조회용
    public Exhibition(int exNo, String lcCode, String exTitle, String startDate, String endDate, int price, String exThumbnail) {
        super();
        this.exNo = exNo;
        this.lcCode = lcCode;
        this.exTitle = exTitle;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
        this.exThumbnail = exThumbnail;
    }
    
    public int getExNo() {
        return exNo;
    }
    public void setExNo(int exNo) {
        this.exNo = exNo;
    }
    public String getLcCode() {
        return lcCode;
    }
    public void setLcCode(String lcCode) {
        this.lcCode = lcCode;
    }
    public String getExTitle() {
        return exTitle;
    }
    public void setExTitle(String exTitle) {
        this.exTitle = exTitle;
    }
    public String getExContent() {
        return exContent;
    }
    public void setExContent(String exContent) {
        this.exContent = exContent;
    }
    public String getStartDate() {
        return startDate;
    }
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }
    public String getEndDate() {
        return endDate;
    }
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public String getArtists() {
        return artists;
    }
    public void setArtists(String artists) {
        this.artists = artists;
    }
    public String getExThumbnail() {
        return exThumbnail;
    }
    public void setExThumbnail(String exThumbnail) {
        this.exThumbnail = exThumbnail;
    }
    public String getExImage() {
        return exImage;
    }
    public void setExImage(String exImage) {
        this.exImage = exImage;
    }
    public String getExStatus() {
        return exStatus;
    }
    public void setExStatus(String exStatus) {
        this.exStatus = exStatus;
    }
    
    @Override
    public String toString() {
        return "Exhibition [exNo=" + exNo + ", lcCode=" + lcCode + ", exTitle=" + exTitle + ", exContent=" + exContent
                + ", startDate=" + startDate + ", endDate=" + endDate + ", price=" + price + ", artists=" + artists
                + ", exThumbnail=" + exThumbnail + ", exImage=" + exImage + ", exStatus=" + exStatus + "]";
    }
}
