package com.kh.qna.model.vo;

import java.sql.Date;

public class Qna {
    
    private int qnaNo;               //    QNA_NO NUMBER PRIMARY KEY,
    private String memNo;             //    MEM_NO NUMBER NOT NULL, 
    private String qnaCategory;  //    QNA_CATEGORY VARCHAR2(30) NOT NULL,
    private String qnaTitle;         //    QNA_TITLE VARCHAR2(200) NOT NULL,
    private String qnaContent;   //    QNA_CONTENT VARCHAR2(3000) NOT NULL,
    private Date qnaDate;         //    QNA_DATE DATE DEFAULT SYSDATE NOT NULL,
    private String answer;        //    ANSWER VARCHAR2(3000),
    private Date answerDate;   //    ANSWER_DATE DATE,
    private String qnaStatus;    //    QNA_STATUS CHAR(1)
   
    public Qna() {}
    
    public Qna(int qnaNo, String memNo, String qnaCategory, String qnaTitle, String qnaContent, Date qnaDate,
            String answer, Date answerDate, String qnaStatus) {
        super();
        this.qnaNo = qnaNo;
        this.memNo = memNo;
        this.qnaCategory = qnaCategory;
        this.qnaTitle = qnaTitle;
        this.qnaContent = qnaContent;
        this.qnaDate = qnaDate;
        this.answer = answer;
        this.answerDate = answerDate;
        this.qnaStatus = qnaStatus;
    }
    
    // 전체조회용 생성자
    public Qna(int qnaNo, String qnaCategory, String qnaTitle,  Date qnaDate, String answer) {
        super();
        this.qnaNo = qnaNo;
        this.qnaCategory = qnaCategory;
        this.qnaTitle = qnaTitle;
        this.qnaDate = qnaDate;
        this.answer = answer;
    }

    // 전체조회용 생성자
    public Qna(int qnaNo, String memNo, String qnaCategory, String qnaTitle,  Date qnaDate,
            String answer, Date answerDate) {
        super();
        this.qnaNo = qnaNo;
        this.memNo = memNo;
        this.qnaCategory = qnaCategory;
        this.qnaTitle = qnaTitle;
        this.qnaDate = qnaDate;
        this.answer = answer;
        this.answerDate = answerDate;
    }
    
    // 상세조회용 생성자
    public Qna(int qnaNo, String memNo, String qnaCategory, String qnaTitle, String qnaContent, Date qnaDate, String answer) {
        super();
        this.qnaNo = qnaNo;
        this.memNo = memNo;
        this.qnaCategory = qnaCategory;
        this.qnaTitle = qnaTitle;
        this.qnaContent = qnaContent;
        this.qnaDate = qnaDate;
        this.answer = answer;
    }
 
    public int getQnaNo() {
        return qnaNo;
    }

    public void setQnaNo(int qnaNo) {
        this.qnaNo = qnaNo;
    }

    public String getMemNo() {
        return memNo;
    }

    public void setMemNo(String memNo) {
        this.memNo = memNo;
    }

    public String getQnaCategory() {
        return qnaCategory;
    }

    public void setQnaCategory(String qnaCategory) {
        this.qnaCategory = qnaCategory;
    }

    public String getQnaTitle() {
        return qnaTitle;
    }

    public void setQnaTitle(String qnaTitle) {
        this.qnaTitle = qnaTitle;
    }

    public String getQnaContent() {
        return qnaContent;
    }

    public void setQnaContent(String qnaContent) {
        this.qnaContent = qnaContent;
    }

    public Date getQnaDate() {
        return qnaDate;
    }

    public void setQnaDate(Date qnaDate) {
        this.qnaDate = qnaDate;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getAnswerDate() {
        return answerDate;
    }

    public void setAnswerDate(Date answerDate) {
        this.answerDate = answerDate;
    }

    public String getQnaStatus() {
        return qnaStatus;
    }

    public void setQnaStatus(String qnaStatus) {
        this.qnaStatus = qnaStatus;
    }

    @Override
    public String toString() {
        return "Qna [qnaNo=" + qnaNo + ", memNo=" + memNo + ", qnaCategory=" + qnaCategory + ", qnaTitle=" + qnaTitle
                + ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate + ", answer=" + answer + ", answerDate="
                + answerDate + ", qnaStatus=" + qnaStatus + "]";
    }
    
}
