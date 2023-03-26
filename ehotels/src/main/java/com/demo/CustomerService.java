package com.demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CustomerService {
    /**
     * Method to get all customers from database
     *
     * @return list of all customers found in database
     * @throws Exception when trying to connect to database
     */
    public LinkedList<CustomerAccount> getCustomers() throws Exception {
        // sql query
        String sql = "SELECT * FROM courseproject.customer_account";
        // connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all students retrieved from database
        LinkedList<CustomerAccount> accounts = new LinkedList<>();

        try (Connection con = db.getConnection()) {
            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                CustomerAccount customerAccount = new CustomerAccount(rs.getString(1), rs.getString(2));
                accounts.add(customerAccount);
            }

            // close result set
            rs.close();
            // close statement
            stmt.close();
            con.close();
            db.close();
//            System.out.println(employees);

            return accounts;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to create a customer account in the database
     *
     * @param customer student to be created
     * @return string returned that states if the student created or not
     * @throws Exception when trying to connect to database
     */
    public String createCustomer(CustomerAccount customer) throws Exception {
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();
//        String currentEmail = customer.getcEmail();
        LinkedList<CustomerAccount> list = this.getCustomers();
        if (list.contains(customer)) {
            message = "Customer successfully inserted!";
            return message;
        }

        if (!this.isValid(customer.getcEmail())) {
            message = "Error while inserting customer";
            return message;
        }

        // sql query
        String insertStudentQuery = "INSERT INTO courseproject.customer_account (cemail, cpwd) VALUES (?, ?);";

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertStudentQuery);

            // set every ? of statement
            stmt.setString(1, customer.getcEmail());
            stmt.setString(2, customer.getcPwd());

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
    /**
     * Method to verify if the input email is valid or not
     *
     * @param input input string entered by the customer
     * @return true only if the string is valid, false otherwise
     */
    public boolean isValid(String input) {
        Pattern pattern = Pattern.compile("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@" + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$");
        Matcher matcher = pattern.matcher(input);

        return matcher.find();
    }
    //username@.com -> False
    // john@gmail.com -> True

    public String insertCustomer(Customer customer) throws Exception {
        String message = "";
        Connection con = null;

        ConnectionDB db = new ConnectionDB();

        // sql query
        String insertStudentQuery = "INSERT INTO courseproject.customer (sin, address, first_name, last_name) VALUES (?, ?, ?, ?);";

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertStudentQuery);

            // set every ? of statement
            stmt.setString(1, customer.getSin());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getFirstName());
            stmt.setString(4, customer.getLastName());

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
}
