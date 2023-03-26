<%@ page import="com.demo.EmployeeAccount" %>
<%@ page import="com.demo.EmployeeService" %>
<%@ page import="java.util.LinkedList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
    <head>
        <title>Employee Login</title>
    </head>
</html>

<%
   String id = request.getParameter("eid");
   try {
           int iID = Integer.parseInt(id);
            //System.out.println(id + " is a valid integer");
           EmployeeAccount emp = new EmployeeAccount(iID);
           EmployeeService employeeService = new EmployeeService();

           LinkedList<EmployeeAccount> listOfEmployees = employeeService.getEmployees();
           //System.out.println("All employees are :"+listOfEmployees);
           boolean result = listOfEmployees.contains(emp);
           if (result) {
                //System.out.println("Success to login with "+ emp.getId());
                response.sendRedirect("employee-page.jsp");
           } else {
                response.sendRedirect("index.jsp");
           }
    } catch (NumberFormatException e){
            //System.out.println(input + " is not a valid integer");
            response.sendRedirect("index.jsp");
    } catch (Exception e) {

    }
   //System.out.println("ID from UI is: "+id);
%>

