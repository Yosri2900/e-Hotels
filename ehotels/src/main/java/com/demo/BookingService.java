package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.LinkedList;
import java.util.Random;
import java.util.UUID;

public class BookingService {
    public LinkedList<Hotel> getHotels() throws Exception {
        // sql query
        String sql = "SELECT * FROM courseproject.hotel";
        // connection object
        ConnectionDB db = new ConnectionDB();

        LinkedList<Hotel> hotels = new LinkedList<>();

        try (Connection con = db.getConnection()) {
            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                Hotel hotel = new Hotel(rs.getString(1), rs.getString(2), rs.getString(5),rs.getString(6),rs.getString(7)
                        ,Integer.parseInt(rs.getString(3)), Integer.parseInt(rs.getString(4)));
                hotels.add(hotel);
            }

            // close result set
            rs.close();
            // close statement
            stmt.close();
            con.close();
            db.close();

            return hotels;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public LinkedList<Room> getRoomChildren(Hotel h) throws Exception {
        int paginations;
        String hotelName = h.getHotelName();

        String sql = "SELECT * FROM courseproject.room WHERE room.member_of = '?';";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, hotelName);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(1)+", "+rs.getString(2));
                if (rs.getString(1).equalsIgnoreCase(hotelName)) {
                    paginations = Integer.parseInt(rs.getString(2));
                }
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }


        return null;
    }

    public String insertBooking(Booking booking) throws SQLException {
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertStudentQuery = "INSERT INTO courseproject.booking (booking_id, tdate, period_of_time, customer_sin, employee_id) VALUES (?, ?, ?, ?, ?);";

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertStudentQuery);

            LocalDate localDate = LocalDate.now();//For reference
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String localDateString = localDate.format(formatter);


            // set every ? of statement
            stmt.setInt(1, booking.getBookingId());
            stmt.setString(2, localDateString);
            stmt.setInt(3, booking.getPeriodOfTime());
            stmt.setString(4, booking.getCustomerSin());
            stmt.setInt(5, booking.getEmployeeID());
            System.out.println("inserted booking infos");

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting customer: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.equals("")) message = "Customer successfully inserted!";

        }

        // return respective message
        return message;
    }

    public String deleteBooking(Integer id) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM courseproject.booking WHERE booking_id = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, id);

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();

        } catch (Exception e) {
            message = "Error while delete booking: " + e.getMessage();
        } finally {
            if (con != null) con.close();
            if (message.equals("")) message = "Booking successfully deleted!";
        }

        return message;
    }

    public String deleteCustomer(Integer id) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM courseproject.booking WHERE booking_id = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, id);

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();

        } catch (Exception e) {
            message = "Error while delete booking: " + e.getMessage();
        } finally {
            if (con != null) con.close();
            if (message.equals("")) message = "Booking successfully deleted!";
        }

        return message;
    }
}
