<html>
<head>
    <title>Customer Login</title>
</head>
<style>
    <%@include file="/WEB-INF/css/style.css"%>
 </style>
<body>
<h2>Creating Customer Account</h2>
<a href="index.jsp">back home</a>

<form action="customer-account-controller.jsp" method="POST">
  <div class="container">
    <label for="cemail"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="cemail" required maxlength="255">

    <label for="cpwd"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="cpwd" required maxlength="16">

    <button type="submit">Submit!</button>
  </div>

</form>
</body>
</html>
