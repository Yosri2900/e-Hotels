package com.demo;

import java.rmi.server.ExportException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class RoomService {

    public LinkedList<Room> getRooms() throws Exception {
        // sql query
        String sql = "SELECT * FROM courseproject.room WHERE room.is_available='true' LIMIT 3";
        // connection object
        ConnectionDB db = new ConnectionDB();

        LinkedList<Room> rooms = new LinkedList<>();

        try (Connection con = db.getConnection()) {
            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                Room hotel = new Room(rs.getString(1), rs.getString(2), rs.getString(9),
                        Integer.parseInt(rs.getString(8)), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7));
                rooms.add(hotel);
            }

            // close result set
            rs.close();
            // close statement
            stmt.close();
            con.close();
            db.close();

            return rooms;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public int getRoomPagination(Room room) throws Exception {
        int paginations = 0;
        String roomMember = room.getMemberOf();

        String sql = "SELECT hotel_name, COUNT(*) FROM courseproject.hotel h join courseproject.room r on h.hotel_name = r.member_of GROUP BY hotel_name;";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                //System.out.println(rs.getString(1)+", "+rs.getString(2));
                if (rs.getString(1).equalsIgnoreCase(roomMember)) {
                    paginations = Integer.parseInt(rs.getString(2));
                }
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

        return paginations;
    }
}
