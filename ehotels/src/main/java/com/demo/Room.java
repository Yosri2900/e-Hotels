package com.demo;

public class Room {
    String roomID, memberOf, roomImg;
    int capacity;
    boolean isAvailable, isExpandible, hasView, hasProblems, hasAmenities;

    public Room(String roomID, String memberOf, String roomImg, int capacity, String isAvailable, String isExpandible, String hasView, String hasProblems, String hasAmenities) {
        this.roomID = roomID;
        this.memberOf = memberOf;
        this.roomImg = roomImg;
        this.capacity = capacity;
        this.isAvailable = convertToBoolean(isAvailable);
        this.isExpandible = convertToBoolean(isExpandible);
        this.hasView = convertToBoolean(hasView);
        this.hasProblems = convertToBoolean(hasProblems);
        this.hasAmenities = convertToBoolean(hasAmenities);
    }

    public String getRoomID() {
        return roomID;
    }

    public String getMemberOf() {
        return memberOf;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public int getCapacity() {
        return capacity;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public boolean isExpandible() {
        return isExpandible;
    }

    public boolean isHasView() {
        return hasView;
    }

    public boolean isHasProblems() {
        return hasProblems;
    }

    public boolean isHasAmenities() {
        return hasAmenities;
    }

    private boolean convertToBoolean(String value) {
        boolean returnValue = false;
        if ("1".equalsIgnoreCase(value) || "yes".equalsIgnoreCase(value) ||
                "true".equalsIgnoreCase(value) || "on".equalsIgnoreCase(value))
            returnValue = true;
        return returnValue;
    }
    // true -> 4
    // false -> 5

    @Override
    public String toString() {
        return "Room{" +
                "roomID='" + roomID + '\'' +
                ", memberOf='" + memberOf + '\'' +
                ", roomImg='" + roomImg + '\'' +
                ", capacity=" + capacity +
                ", isAvailable=" + isAvailable +
                ", isExpandible=" + isExpandible +
                ", hasView=" + hasView +
                ", hasProblems=" + hasProblems +
                ", hasAmenities=" + hasAmenities +
                '}';
    }

}
