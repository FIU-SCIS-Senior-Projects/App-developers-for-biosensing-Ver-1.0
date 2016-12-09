<%-- 
    Document   : index
    Created on : Sep 22, 2016, 10:28:48 PM
    Author     : Xin Zhao
--%>

<%@page import="edu.fiu.scis.vip.biosensing.DataConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Sending</title>
    </head>
    <body>
<%
    String values = request.getParameter("parameter");
    DataConnect dc = new DataConnect();
    System.out.println(values);
    String[] para = values.split(":");
    //dc.sendData("Records", para);
    dc.sendData("SensorData", para);

    out.println("{\"message\":\"1\"}");
%>
    </body>
</html>


