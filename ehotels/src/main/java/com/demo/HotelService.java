package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class HotelService {

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

        String hotelName = h.getHotelName();

        String sql = "SELECT * FROM courseproject.room WHERE room.member_of = '?';";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, hotelName);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                //System.out.println(rs.getString(1)+", "+rs.getString(2));
//                if (rs.getString(1).equalsIgnoreCase(hotelName)) {
//                    paginations = Integer.parseInt(rs.getString(2));
//                }
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }


        return null;
    }
}
