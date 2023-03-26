<%@ page import="com.demo.HotelService" %>
<%@ page import="com.demo.RoomService" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.Hotel" %>
<%@ page import="com.demo.Message" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
   //String currentCustomer = (String)session.getAttribute("cEmail");

   System.out.println("session has "+session.getAttribute("cEmail"));

   //display hotels
   HotelService hotels = new HotelService();
   RoomService rooms = new RoomService();
   LinkedList<Hotel> listOfHotels = null;
   LinkedList<Room> listOfRooms = null;
   try {
       listOfHotels = hotels.getHotels();
       listOfRooms = rooms.getRooms();
   } catch (Exception e) {
       e.printStackTrace();
   }

%>

<html>
<head>
    <title>Customer Page</title>
    	<style>
    		/* Sidebar container */
    		.sidebar {
    			width: 200px;
    			height: 100vh;
    			position: fixed;
    			top: 0;
    			left: -200px;
    			background-color: #f2f2f2;
    			padding: 20px;
    			box-sizing: border-box;
    			transition: left 0.3s ease;
    		}

    		/* Show sidebar when checkbox is checked */
    		#sidebar-toggle:checked ~ .sidebar {
    			left: 0;
    		}

    		/* Filter options */
    		.filter {
    			margin-bottom: 10px;
    		}

    		.filter label {
    			display: block;
    			font-weight: bold;
    		}

    		.filter input[type="checkbox"] {
    			margin-right: 5px;
    		}

    		/* Hide button */
    		.hide-btn {
    			margin-top: 10px;
    			background-color: #fff;
    			border: 1px solid #ccc;
    			padding: 5px 10px;
    			cursor: pointer;
    		}

    		.hide-btn:hover {
    			background-color: #f2f2f2;
    		}

    		/* Styling for hotels list and room list */
    		.hotels {
              margin: auto;
              width: 40%;
              border: 3px solid #7C8E88;
              padding: 3px;
            }

            .room-list {
                  width: 90vw;
                  max-width: 1170px;
                  margin: 5rem auto;
                  display: grid;
                  gap: 1rem;
            }
            @media screen and (min-width: 768px) {
              .room-list {
                grid-template-columns: repeat(3, 1fr);
                /* align-items: start; */
              }
            }

            .room {
              background: #7C8E88;
              border-radius: 1rem;
              padding: 1rem 2rem;
            }
            .room h1 {
              margin-top: 0.5rem;
            }
            .room h4 {
              //color: #617d98;
              font-size: 0.75rem;
              margin-top: 0.25rem;
            }
            .room p {
              margin-top: 0.5rem;
            }

            input[type=text], select, textarea {
              width: 100%;
              padding: 12px;
              border: 1px solid #ccc;
              border-radius: 4px;
              resize: vertical;
            }

            label {
              padding: 12px 12px 12px 0;
              display: inline-block;
            }

            input[type=submit] {
              background-color: #04AA6D;
              color: white;
              padding: 12px 20px;
              border: none;
              border-radius: 4px;
              cursor: pointer;
              float: right;
            }

            input[type=submit]:hover {
              background-color: #45a049;
            }

            .container {
              border-radius: 5px;
              background-color: #f2f2f2;
              padding: 20px;
            }

            .col-25 {
              float: left;
              width: 25%;
              margin-top: 6px;
            }

            .col-75 {
              float: left;
              width: 75%;
              margin-top: 6px;
            }

            /* Clear floats after the columns */
            .row:after {
              content: "";
              display: table;
              clear: both;
            }

            /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
            @media screen and (max-width: 600px) {
              .col-25, .col-75, input[type=submit] {
                width: 100%;
                margin-top: 0;
              }
            }

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

</head>
    <body>
        <h1>Welcome Customer</h1>
        <p>Explore our different hotels!</p>
        <a href="index.jsp">back home</a>

        	<!-- Sidebar toggle -->
        	<label for="sidebar-toggle">Show Filters</label>
        	<input type="checkbox" id="sidebar-toggle">
        	<br>
        	<!-- List of Hotels -->
            <% if (listOfHotels.size() == 0) { %>
                <h2 style="margin-top: 5rem;">No Hotels Found!</h2>
            <% } else {%>
                <table>
                    <thead>
                        <tr>
                            <th>Hotel Name</th>
                            <th>Member of</th>
                            <th>Rating (out of 5)</th>
                            <!--<th></th>-->
                        </tr>
                    </thead>
                    <tbody>

        	<%
                for (Hotel h : listOfHotels) { %>
                <tr>
                    <td><%= h.getHotelName() %></td>
                    <td><%= h.getMember_of() %></td>
                    <td><%= h.getRating() %></td>
                </tr>
               <% } %>
                </tbody>
               </table>
           <% } %>

               <!-- List of Rooms -->
               <% if (listOfRooms.size() == 0) { %>
                   <h2 style="margin-top: 5rem;">No Rooms Found!</h2>
               <% } %>
                <section class="room-list">
                    <%
                    for (Room r : listOfRooms) { %>
                        <article class="room">
                            <img src=<%=r.getRoomImg()%> alt='image' height="100" width="100" />
                            <h1>Member of: <%=r.getMemberOf()%> </h1>
                            <h4>Capacity: <%=r.getCapacity()%> </h4>
                            <p>Vacant: <%=r.isAvailable()%></p>

                            <div class="container">
                              <form action="customer-booking-controller.jsp" method="POST">
                                <div class="row">
                                  <div class="col-25">
                                    <label for="fname">First Name</label>
                                  </div>
                                  <div class="col-75">
                                    <input type="text" id="fname" name="firstname" placeholder="Your first Name.." required>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-25">
                                    <label for="lname">Last Name</label>
                                  </div>
                                  <div class="col-75">
                                    <input type="text" id="lname" name="lastname" placeholder="Your last name.." required>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-25">
                                    <label for="sinnum">Sin Number</label>
                                  </div>
                                  <div class="col-75">
                                    <input type="text" id="fname" name="sinum" placeholder="Your Sin Number.." required>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-25">
                                    <label for="sinnum">Address</label>
                                  </div>
                                  <div class="col-75">
                                    <input type="text" id="fname" name="address" placeholder="Your Address.." required>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-25">
                                    <label for="from-date">From:</label>
                                  </div>
                                  <div class="col-75">
                                    <input type="date" id="from" name="from" required>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-25">
                                    <label for="to-date">To:</label>
                                  </div>
                                  <div class="col-75">
                                    <input type="date" id="to" name="to" required>
                                  </div>
                                </div>
                                <div class="row">
                                  <input type="submit" value="Submit">
                                </div>
                              </form>
                            </div>
                        </article>
                    <% } %>
                </section>


        	<!-- Sidebar -->
        	<div class="sidebar">
        		<div class="filter">
        			<label>Filter by:</label>
        			<input type="checkbox" id="filter-option-1">
        			<label for="filter-option-1">Option 1</label>

        			<input type="checkbox" id="filter-option-2">
        			<label for="filter-option-2">Option 2</label>

        			<input type="checkbox" id="filter-option-3">
        			<label for="filter-option-3">Option 3</label>
        		</div>

        		<button class="hide-btn" onclick="document.getElementById('sidebar-toggle').checked = false;">Hide sidebar</button>
        		<button>RESET</button>
        	</div>

        	<script>
                /*function setModalFields(row) {
                    document.getElementById("id").value = row.dataset.id;
                    document.getElementById("name").value = row.dataset.name;
                    document.getElementById("surname").value = row.dataset.surname;
                    document.getElementById("email").value = row.dataset.email;

                    document.getElementById("modal-form").action = "/update-student-controller.jsp";
                    document.getElementById("modal-form").method = "POST";
                }*/
        	    //john@gmail.com john123
        	</script>

    </body>
</html>

<%
   // session.removeAttribute("cEmail");
%>


