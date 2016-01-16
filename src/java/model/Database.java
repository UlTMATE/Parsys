package model;

import beans.Parcel;
/**
 *
 * @author ultmate
 */
import java.sql.*;


public class Database {
    
//    Connection conn;
    
    public Database(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/?", "root", "root");
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS parsys");
            stmt.close();
            conn.close();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parsys", "root", "root");
            stmt = conn.createStatement();
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS student ("
                    + "student_id VARCHAR(8) NOT NULL, "
                    + "pwd VARCHAR(20) NOT NULL, "
                    + "name VARCHAR(30) NOT NULL, "
                    + "dob DATE NOT NULL, "
                    + "sex CHARACTER NOT NULL, "
                    + "mobile BIGINT NOT NULL, "
                    + "hostel VARCHAR(4), "
                    + "wing CHARACTER, "
                    + "room INTEGER, "
                    + "PRIMARY KEY(student_id), "
                    + "CHECK(sex in ('M', 'F')))");
            
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS official ("
                    + "official_id VARCHAR(20) NOT NULL,"
                    + "pwd VARCHAR(20) NOT NULL,"
                    + "name VARCHAR(30) NOT NULL,"
                    + "mobile BIGINT NOT NULL,"
                    + "designation VARCHAR(20) NOT NULL,"
                    + "PRIMARY KEY(official_id))");
            
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS parcel ("
                    + "parcel_id INTEGER NOT NULL AUTO_INCREMENT, "
                    + "posted_on TIMESTAMP NOT NULL, "
                    + "sender VARCHAR(30) NOT NULL, "
                    + "sender_mobile BIGINT, "
                    + "sent_for VARCHAR(30) NOT NULL, "
                    + "to_mobile BIGINT, "
                    + "description VARCHAR(1024), "
                    + "PRIMARY KEY (parcel_id))");
            
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS received_parcel("
                    + "parcel_id INTEGER NOT NULL, "
                    + "receiver_id VARCHAR(8) NOT NULL, "
                    + "received_at TIMESTAMP NOT NULL, "
                    + "PRIMARY KEY(parcel_id), "
                    + "FOREIGN KEY(parcel_id) REFERENCES parcel(parcel_id), "
                    + "FOREIGN KEY(receiver_id) REFERENCES student(student_id))");
            stmt.close();
            conn.close();
        } catch(ClassNotFoundException | SQLException exc1){
            exc1.printStackTrace();
        }
    }
    
    public static void main(String args[]) {
        new Database();
    }
    
    static public boolean validateStudent(String id, String pwd) throws SQLException {
        String query = "SELECT * FROM student WHERE student_id=? AND pwd=?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parsys", "root", "root");
                PreparedStatement pstmt = conn.prepareStatement(query);) {
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            ResultSet rst = pstmt.executeQuery();
            return rst.next();
        }
    }
    
    static public boolean validateOfficial(String id, String pwd, String designation) throws SQLException {
        String query = "SELECT * FROM official WHERE official_id=? AND pwd=? AND designation=?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parsys", "root", "root");
                PreparedStatement pstmt = conn.prepareStatement(query);) {
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            pstmt.setString(3, designation);
            ResultSet rst = pstmt.executeQuery();
            return rst.next();
        }
    }
    
    synchronized static public void postParcel(Parcel parcel) throws SQLException{
        String query = "INSERT INTO parcel(posted_on, sender, sender_mobile, sent_for, to_mobile, description)values(?,?,?,?,?,?)";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parsys", "root", "root");
                PreparedStatement pstmt = conn.prepareStatement(query);) {
            pstmt.setTimestamp(1, new Timestamp(new java.util.Date().getTime()));
            pstmt.setString(2, parcel.getSender());
            pstmt.setLong(3, parcel.getSenderMobile());
            pstmt.setString(4, parcel.getSent_for());
            pstmt.setLong(5, parcel.getRecMobile());
            pstmt.setString(6, parcel.getDescription());
            pstmt.executeUpdate();
        }
    }
    
    static public boolean isUserMale(String id) throws SQLException {
        String query = "SELECT * FROM student WHERE student_id=?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/parsys", "root", "root");
                PreparedStatement pstmt = conn.prepareStatement(query);) {
            pstmt.setString(1, id);
            ResultSet rst = pstmt.executeQuery();
            rst.next();
            return rst.getString("sex").equals("M");
        }
    }
}
