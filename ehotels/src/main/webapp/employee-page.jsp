<%@ page import="com.demo.HotelService" %>
<%@ page import="com.demo.RoomService" %>
<%@ page import="com.demo.EmployeeService" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.Booking" %>
<%@ page import="com.demo.Hotel" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
       //display bookings
       EmployeeService employeeService = new EmployeeService();
       LinkedList<Booking> listOfBookings = null;
       try {
           listOfBookings = employeeService.getBookings();
       } catch (Exception e) {
           e.printStackTrace();
       }
%>

<html>
<head>
    <title>Employee Page</title>
    <style>

        table {
          margin-left: auto;
          margin-right: auto;
        }
        th, td {
          border: 1px solid #000;
          border-bottom: none;
          border-right: none;
          padding: 0.5em 1em;
        }

        a {
          text-decoration: none;
          color: black;
        }

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<h1>Welcome Employee</h1>
<p>Here are all the bookings</p>
<a href="index.jsp">back home</a>

 <% if (listOfBookings.size() == 0) { %>
                <h2 style="margin-top: 5rem;">No Booking Found!</h2>
            <% } else {%>
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Period Of Time (in days)</th>
                            <th>Customer Sin#</th>
                            <th>Employee ID responsible</th>
                            <th><i class="fa fa-trash-o" style="font-size:48px;color:red"></i></th>
                        </tr>
                    </thead>
                    <tbody>

        	<%  // Put in the form of a table
                for (Booking b : listOfBookings) { %>
                <tr>
                <% //System.out.println(h); %>
                    <td><%= b.getBookingId() %></td>
                    <td><%= b.getPeriodOfTime() %></td>
                    <td><%= b.getCustomerSin() %></td>
                    <td><%= b.getEmployeeID() %></td>
                    <form method="POST" action="delete-booking-controller.jsp">
                        <td>
                            <input value="<%= b.getBookingId() %>" name="id" />
                            <button style="all: unset; cursor: pointer;" type="submit"></button>
                        </td>
                    </form>
                </tr>
               <% } %>
                </tbody>
               </table>
           <% } %>

           <button>
                <a href="customer-page.jsp">No Booking</a>
           </button>
</body>
</html>
