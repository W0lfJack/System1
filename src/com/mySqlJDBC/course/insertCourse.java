package com.mySqlJDBC.course;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class insertCourse {
    public static void insertCourse(int Cno,String name,String pno,int credit){
        String sql="insert into course (Cno,Cname,Cpno,Ccredit) value (?,?,?,?)";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,Cno);
            pstmt.setString(2,name);
            pstmt.setString(3,pno);
            pstmt.setInt(4,credit);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }

    public static void main(String[] args) {
        insertCourse.insertCourse(12,"test1","12",13);
    }
}
