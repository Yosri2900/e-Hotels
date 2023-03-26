<%@ page import="com.demo.CustomerAccount" %>
<%@ page import="com.demo.CustomerService" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
   String cEmail = request.getParameter("cemail");
   String cPassword = request.getParameter("cpwd");

   CustomerAccount customer = new CustomerAccount(cEmail, cPassword);
   CustomerService customerService = new CustomerService();

   Message msg;
       try {
           String value = customerService.createCustomer(customer);
           if (value.contains("Error") || value.contains("error")) msg = new Message("error", value);

           else msg = new Message("success", value);
       } catch (Exception e) {
           e.printStackTrace();
           msg = new Message("error", "Something went wrong!");
       }

       ArrayList<Message> messages = new ArrayList<>();
       messages.add(msg);

       session.setAttribute("messages", messages);
       if (msg.getType().equals("success") && customerService.isValid(customer.getcEmail())) {
            String email = new String(customer.getcEmail());
            session.setAttribute("cEmail", email);
            response.sendRedirect("customer-page.jsp");
       } else {
            response.sendRedirect("index.jsp");
       }

       //john@gmail.com
       //john123
%>

