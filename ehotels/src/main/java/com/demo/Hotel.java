package com.demo;

public class Hotel {
    private String hotelName, email, phoneNumber, address , member_of;
    private int rating, numOfRoom;

    public Hotel(String hotelName, String member_of, String email, String phoneNumber, String address, int rating, int numOfRoom) {
        this.hotelName = hotelName;
        this.member_of = member_of;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.rating = rating;
        this.numOfRoom = numOfRoom;
    }

    public String getHotelName() {
        return hotelName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getMember_of() {
        return member_of;
    }

    public String getAddress() {
        return address;
    }

    public int getRating() {
        return rating;
    }

    public int getNumOfRoom() {
        return numOfRoom;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "hotelName='" + hotelName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", rating=" + rating +
                ", numOfRoom=" + numOfRoom +
                '}';
    }
}
