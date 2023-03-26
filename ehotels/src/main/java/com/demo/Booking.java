package com.demo;

import java.util.Date;

public class Booking {
    int bookingId, periodOfTime, employeeID;
    String customerSin;

    public Booking(int bookingId, int periodOfTime, int employeeID, String customerSin) {
        this.bookingId = bookingId;
        this.periodOfTime = periodOfTime;
        this.employeeID = employeeID;
        this.customerSin = customerSin;
    }

    public int getBookingId() {
        return bookingId;
    }

    public int getPeriodOfTime() {
        return periodOfTime;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public String getCustomerSin() {
        return customerSin;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "bookingId=" + bookingId +
                ", periodOfTime=" + periodOfTime +
                ", employeeID=" + employeeID +
                ", customerSin='" + customerSin + '\'' +
                '}';
    }
}
