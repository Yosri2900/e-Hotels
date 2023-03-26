<%@ page import="com.demo.Message" %>
<%@ page import="com.demo.Customer" %>
<%@ page import="com.demo.Booking" %>
<%@ page import="com.demo.BookingService" %>
<%@ page import="com.demo.CustomerService" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "java.time.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    //Date createTime = new Date(session.getCreationTime());

    String fName = request.getParameter("firstname");
    String lName = request.getParameter("lastname");
    String sinNumber = request.getParameter("sinum");
    String address = request.getParameter("address");
    String fromDate = request.getParameter("from");
    String toDate = request.getParameter("to");

   /*System.out.println(fName);
   System.out.println(lName);
   System.out.println(sinNumber);
   System.out.println(address);
   System.out.println(fromDate);
   System.out.println(toDate);*/

     LocalDate startDate = LocalDate.parse(fromDate);
     LocalDate endDate = LocalDate.parse(toDate);
     Period diff = Period.between(startDate, endDate);
     int periodOfTime = diff.getDays();


     String uniqueID = UUID.randomUUID().toString();
     int[] employees = {4529, 4238, 4329};
     Random random = new Random();

     int idx = random.nextInt(employees.length);
     int employeeId = employees[idx];
     int bookingId = random.nextInt(5000);

    Customer customer = new Customer(fName, lName, sinNumber, address);
    CustomerService customerService = new CustomerService();
    Booking booking = new Booking(bookingId, periodOfTime, employeeId, sinNumber);
    BookingService bookingService = new BookingService();

   Message msg;
       try {
           String valueCustomer = customerService.insertCustomer(customer);
           String valueBooking = bookingService.insertBooking(booking);

           if (valueCustomer.contains("Error") || valueCustomer.contains("error")) {
            msg = new Message("error", valueCustomer);
           } else if (valueBooking.contains("Error") || valueBooking.contains("error")) {
            msg = new Message("error", valueBooking);
           }

           else msg = new Message("success", "");
       } catch (Exception e) {
           e.printStackTrace();
           msg = new Message("error", "Something went wrong!");
       }

       ArrayList<Message> messages = new ArrayList<>();
       messages.add(msg);

       session.setAttribute("messages", messages);
       System.out.println(msg);
       if (msg.getType().equals("success")) {
            //String email = new String(customer.getcEmail());
            //session.setAttribute("cEmail", email);
            response.sendRedirect("customer-page.jsp");
       } else if (msg.getType().equals("error")) {
            out.println("ERROR: "+msg);
       }

       //john@gmail.com
       //john123

%>