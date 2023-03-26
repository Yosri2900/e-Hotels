<html>
<head>
    <title>Employee Login</title>
</head>
<style>
    <%@include file="/WEB-INF/css/style.css"%>
 </style>
<body>
<h2>Employee Login</h2>
<a href="index.jsp">back home</a>

<form action="employee-account-controller.jsp" method="GET">
  <div class="container"
    <label for="eid"><b>Username</b></label>
    <input type="text" name="eid" placeholder="Enter Your Employee ID" required maxlength="4">
    <button type="submit">Submit!</button>
  </div>

</form>
</body>
</html>