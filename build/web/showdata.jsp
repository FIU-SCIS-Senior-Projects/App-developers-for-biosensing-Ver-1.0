<%-- 
    Document   : showdata
    Created on : Sep 23, 2016, 2:00:31 PM
    Author     : Sung
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sensor Data</title>
    </head>
    <body>
        <div padding-left="100px">
        <%
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
        
            String url = "jdbc:mysql://localhost:3306/biosensing";
            String user = "root";
            String passwd = "Aa462991731";
            try{
                Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, passwd);
            st = conn.createStatement();
            rs = st.executeQuery("SELECT * FROM SensorData WHERE userId=\'00001\'");
            //rs = st.executeQuery("SELECT * FROM Records");

            out.println("UserID" + "\t\t" + "TimeStamp" + "\t" + "ACC-X" + "\t" + "Acc-Y" + "\t" + "Acc-Z" + "\t" + "Gyro-X" + "\t" + "Gyro-Y" + "\t" + "Gyro-Z" + "\t" +"Mag-X" + "\t" + "Mag-Y" + "\t" + "Mag-Z"+ "\t" + "Hum" + "\t" + "ObjTemp" + "\t" + "AmbTemp" + "\t" + "Bmp" + "\t" + "Optical"+"<br>");
            //out.println("UserID" + "\t" + "TimeStamp" + "\t" + "Acc-X" + "\t" + "Acc-Y" + "<br>");
            while(rs.next()){
                for (int i=0; i < 16; i ++){
                    out.print(rs.getString(i+1) + "\t");
                }
                out.println("<br>");
            }
            
        }catch(SQLException ex){
            
        }finally {
            try{
                if(rs != null){
                    rs.close();
                }
                if (st != null){
                    st.close();
                }
                if (conn != null){
                    conn.close();
                }
            }catch (SQLException ex){
                
            }                
            }
        %>
        <a href="test.xls">Download</a>
    </div>    
        <div align="center"><a href="BioSensingCloud.jsp">Home</a></div>
    </body>
</html>
