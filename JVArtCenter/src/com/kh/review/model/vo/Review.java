package com.kh.review.model.vo;

public class Review {
    
    private int reviewNo;
    private String memNo;
    private String exNo;
    private String reviewContent;
    private int rating;
    private String reviewDate;
    private String reviewStatus;
    
    public Review() {}
    public Review(int reviewNo, String memNo, String exNo, String reviewContent, int rating, String reviewDate,
            String reviewStatus) {
        super();
        this.reviewNo = reviewNo;
        this.memNo = memNo;
        this.exNo = exNo;
        this.reviewContent = reviewContent;
        this.rating = rating;
        this.reviewDate = reviewDate;
        this.reviewStatus = reviewStatus;
    }
    
    // 전시별 리뷰 조회용
    public Review(int reviewNo, String reviewContent, int rating, String reviewDate) {
        super();
        this.reviewNo = reviewNo;
        this.reviewContent = reviewContent;
        this.rating = rating;
        this.reviewDate = reviewDate;
    }
    
    // 관리자 리뷰 조회용
    public Review(int reviewNo, String memNo, String exNo, String reviewContent, int rating, String reviewDate) {
        super();
        this.reviewNo = reviewNo;
        this.memNo = memNo;
        this.exNo = exNo;
        this.reviewContent = reviewContent;
        this.rating = rating;
        this.reviewDate = reviewDate;
    }
    public Review(int reviewNo, String exNo, String reviewContent, int rating) {
        super();
        this.reviewNo = reviewNo;
        this.exNo = exNo;
        this.reviewContent = reviewContent;
        this.rating = rating;
    }
    public int getReviewNo() {
        return reviewNo;
    }
    public void setReviewNo(int reviewNo) {
        this.reviewNo = reviewNo;
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
    public String getReviewContent() {
        return reviewContent;
    }
    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }
    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }
    public String getReviewDate() {
        return reviewDate;
    }
    public void setReviewDate(String reviewDate) {
        this.reviewDate = reviewDate;
    }
    public String getReviewStatus() {
        return reviewStatus;
    }
    public void setReviewStatus(String reviewStatus) {
        this.reviewStatus = reviewStatus;
    }
    
    @Override
    public String toString() {
        return "Review [reviewNo=" + reviewNo + ", memNo=" + memNo + ", exNo=" + exNo + ", reviewContent="
                + reviewContent + ", rating=" + rating + ", reviewDate=" + reviewDate + ", reviewStatus=" + reviewStatus
                + "]";
    }
}
