<html>
<body>
<%
    java.util.Calendar cal = java.util.Calendar.getInstance();
    int hour = cal.get(java.util.Calendar.HOUR_OF_DAY);
    String greeting = (hour < 12) ? "Good morning" : "Good afternoon";
%>

<h1><%= greeting %>, Ryan, Welcome to COMP367</h1>
</body>
</html>
