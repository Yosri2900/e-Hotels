package com.demo;

public class EmployeeAccount {
    private int id;

    public EmployeeAccount(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EmployeeAccount employee = (EmployeeAccount) o;
        return this.id == employee.id;
    }

    public String toString() {
        return "Employee{" +
                "id=" + id +
                '}';
    }
}
