package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
    
    private int memNo;
    private String grCode;
    private String memId;
    private String memPwd;
    private String memName;
    private String gender;
    private String email;
    private String birthDate;
    private String phone;
    private Date enrollDate;
    private String memStatus;
    
    public Member() {}
    
    public Member(int memNo, String grCode, String memId, String memPwd, String memName, String gender, String email,
            String birthDate, String phone, Date enrollDate, String memStatus) {
        super();
        this.memNo = memNo;
        this.grCode = grCode;
        this.memId = memId;
        this.memPwd = memPwd;
        this.memName = memName;
        this.gender = gender;
        this.email = email;
        this.birthDate = birthDate;
        this.phone = phone;
        this.enrollDate = enrollDate;
        this.memStatus = memStatus;
    }
    
    //회원가입용 생성자 - 아이디, 패스워드, 이름, 휴대폰번호, 이메일, 성별, 생년월일
    public Member(String memId, String memPwd, String memName, String phone, String email, String gender, String birthDate) {
        super();
        this.memId = memId;
        this.memPwd = memPwd;
        this.memName = memName;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.birthDate = birthDate;
    }
    
    // 회원 정보 수정용 생성자 - 아이디, 패스워드, 이메일, 생년월일, 핸드폰 
    public Member(String memId, String memPwd, String email, String birthDate, String phone) {
        super();
        this.memId = memId;
        this.memPwd = memPwd;
        this.email = email;
        this.birthDate = birthDate;
        this.phone = phone;
    }
    
    //비밀번호 찾기
    public Member(String memPwd) {this.memPwd = memPwd;}
    
    public Member(int memNo, String grCode, String memId, String memPwd, String memName, String gender, String email,
            String birthDate, String phone, Date enrollDate) {
        super();
        this.memNo = memNo;
        this.grCode = grCode;
        this.memId = memId;
        this.memPwd = memPwd;
        this.memName = memName;
        this.gender = gender;
        this.email = email;
        this.birthDate = birthDate;
        this.phone = phone;
        this.enrollDate = enrollDate;
    }
    
    //관리자 회원정보 수정용 생성자
    public Member(int memNo, String grCode, String memId, String memPwd, String memName, String phone, String email) {
        super();
        this.memNo = memNo;
        this.grCode = grCode;
        this.memId = memId;
        this.memPwd = memPwd;
        this.memName = memName;
        this.phone = phone;
        this.email = email;
    }
    
    public Member(String grCode, String memId, String memPwd, String memName, String phone, String email) {
        super();
        this.grCode = grCode;
        this.memId = memId;
        this.memPwd = memPwd;
        this.memName = memName;
        this.phone = phone;
        this.email = email;
    }

    public int getMemNo() {
        return memNo;
    }
    public void setMemNo(int memNo) {
        this.memNo = memNo;
    }
    public String getGrCode() {
        return grCode;
    }
    public void setGrCode(String grCode) {
        this.grCode = grCode;
    }
    public String getMemId() {
        return memId;
    }
    public void setMemId(String memId) {
        this.memId = memId;
    }
    public String getMemPwd() {
        return memPwd;
    }
    public void setMemPwd(String memPwd) {
        this.memPwd = memPwd;
    }
    public String getMemName() {
        return memName;
    }
    public void setMemName(String memName) {
        this.memName = memName;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getBirthDate() {
        return birthDate;
    }
    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public Date getEnrollDate() {
        return enrollDate;
    }
    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }
    public String getMemStatus() {
        return memStatus;
    }
    public void setMemStatus(String memStatus) {
        this.memStatus = memStatus;
    }
    
    @Override
    public String toString() {
        return "Member [memNo=" + memNo + ", grCode=" + grCode + ", memId=" + memId + ", memPwd=" + memPwd
                + ", memName=" + memName + ", gender=" + gender + ", email=" + email + ", birthDate=" + birthDate
                + ", phone=" + phone + ", enrollDate=" + enrollDate + ", memStatus=" + memStatus + "]";
    }
    
}
