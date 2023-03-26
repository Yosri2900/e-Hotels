<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.demo.BookingService" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.ArrayList" %>

<%
    // get the id that was sent
    Integer id = Integer.valueOf(request.getParameter("id"));

    // create a message object
    Message msg;
    // try to delete a grade
    try {
        BookingService bookingService = new BookingService();
        String value = bookingService.deleteBooking(id);

        if (value.contains("Error") || value.contains("error")) msg = new Message("error", value);

        else msg = new Message("success", value);
    } catch (Exception e) {
        e.printStackTrace();
        msg = new Message("error", "Something went wrong!");
    }

    // append the message in a messages arraylist
    ArrayList<Message> messages = new ArrayList<>();
    messages.add(msg);

    // set session attribute named messages with the messages arraylist
    session.setAttribute("messages", messages);

    response.sendRedirect("employee-page.jsp");
%>