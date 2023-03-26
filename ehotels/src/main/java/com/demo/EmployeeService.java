package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class EmployeeService {

    /**
     * Method to get all students from database
     *
     * @return list of all students found in database
     * @throws Exception when trying to connect to database
     */
    public LinkedList<EmployeeAccount> getEmployees() throws Exception {
        // sql query
        String sql = "SELECT * FROM courseproject.employee";
        // connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all students retrieved from database
        LinkedList<EmployeeAccount> employees = new LinkedList<>();

        try (Connection con = db.getConnection()) {
            // prepare statement
           PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
//                System.out.println(rs.getString(1)+"\t"+rs.getString(2)+"\t"+rs.getString(3)+"\t");
                if (rs.getString(5) != null) {
                    EmployeeAccount eAccount = new EmployeeAccount(
                        Integer.parseInt(rs.getString(1))
                    );
                    employees.add(eAccount);
                }
            }

            // close result set
            rs.close();
            // close statement
            stmt.close();
            con.close();
            db.close();
//            System.out.println(employees);

            return employees;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public LinkedList<Booking> getBookings() throws Exception {
        // sql query
        String sql = "SELECT booking_id, period_of_time, employee_id, customer_sin FROM courseproject.booking, courseproject.customer WHERE booking.customer_sin = customer.sin;";
        // connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all students retrieved from database
        LinkedList<Booking> bookings = new LinkedList<>();

        try (Connection con = db.getConnection()) {
            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                Booking booking = new Booking(
                        Integer.parseInt(rs.getString(1)), Integer.parseInt(rs.getString(2)),
                        Integer.parseInt(rs.getString(3)), rs.getString(4));
                bookings.add(booking);
            }

            // close result set
            rs.close();
            // close statement
            stmt.close();
            con.close();
            db.close();
//            System.out.println(employees);

            return bookings;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
