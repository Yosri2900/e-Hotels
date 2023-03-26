package com.demo;

public class Customer {
    String firstName, lastName, sin, address;

    public Customer(String firstName, String lastName, String sin, String address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.sin = sin;
        this.address = address;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getSin() {
        return sin;
    }

    public String getAddress() {
        return address;
    }
}
