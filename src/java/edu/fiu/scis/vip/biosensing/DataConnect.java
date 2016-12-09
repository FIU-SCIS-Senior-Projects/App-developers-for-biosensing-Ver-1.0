/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fiu.scis.vip.biosensing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author Sung
 */
public class DataConnect {
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
        
    String url = "jdbc:mysql://localhost:3306/biosensing";
    String user = "root";
    String passwd = "Aa462991731";
    
    public void getData(){
        try{
            con = DriverManager.getConnection(url, user, passwd);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM UserInfo");
            
            while(rs.next()){
                System.out.println(rs.getString(2));
            }
            
        }catch(SQLException ex){
            Logger lgr = Logger.getLogger(DataConnect.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
            
        }finally {
            try{
                if(rs != null){
                    rs.close();
                }
                if (st != null){
                    st.close();
                }
                if (con != null){
                    con.close();
                }
            }catch (SQLException ex){
                Logger lgr = Logger.getLogger(DataConnect.class.getName());
                lgr.log(Level.WARNING, ex.getMessage(), ex);
                
            }
        }
        
    }
    public void sendData(String TABLE_NAME, String[] args){
        
        String exp = "insert into " + TABLE_NAME + " values(";
        
        for(int i = 0; i < args.length; i ++){
            exp = exp + "\'" + args[i] + "\'";
            if(i < args.length - 1){
                exp = exp + ",";
            }
        }
        exp = exp + ")";
        
        //Print out the expression
        System.out.println(exp);
        
        //excute the insertion
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, passwd);
            st = con.createStatement();
            st.executeUpdate(exp);
            
        }catch(SQLException ex){
            Logger lgr = Logger.getLogger(DataConnect.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataConnect.class.getName()).log(Level.SEVERE, null, ex);
            
        }finally {
            try{
                if (st != null){
                    st.close();
                }
                if (con != null){
                    con.close();
                }
            }catch (SQLException ex){
                Logger lgr = Logger.getLogger(DataConnect.class.getName());
                lgr.log(Level.WARNING, ex.getMessage(), ex);
                
            }
        }
        
    }
    
}