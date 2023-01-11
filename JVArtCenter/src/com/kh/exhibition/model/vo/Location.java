package com.kh.exhibition.model.vo;

public class Location {
    
    private String lcCode;
    private String lcName;
    private int floor;
    private int capacity;
    
    public Location() {}
    public Location(String lcCode, String lcName, int floor, int capacity) {
        super();
        this.lcCode = lcCode;
        this.lcName = lcName;
        this.floor = floor;
        this.capacity = capacity;
    }
    
    public String getLcCode() {
        return lcCode;
    }
    public void setLcCode(String lcCode) {
        this.lcCode = lcCode;
    }
    public String getLcName() {
        return lcName;
    }
    public void setLcName(String lcName) {
        this.lcName = lcName;
    }
    public int getFloor() {
        return floor;
    }
    public void setFloor(int floor) {
        this.floor = floor;
    }
    public int getCapacity() {
        return capacity;
    }
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
    
    @Override
    public String toString() {
        return "Location [lcCode=" + lcCode + ", lcName=" + lcName + ", floor=" + floor + ", capacity=" + capacity
                + "]";
    }
}
