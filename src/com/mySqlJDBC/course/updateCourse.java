package com.mySqlJDBC.course;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class updateCourse {
    public static void updateStudentNO(int NO,String name,String pno,int credit){
        String sql="update course set Cname=?,Cpno=?,Ccredit=? where Cno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setString(1,name);
            pstmt.setString(2,pno);
            pstmt.setInt(3,credit);
            pstmt.setInt(4,NO);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }

    public static void main(String[] args) {
        updateStudentNO(10,"GO",null,10);
    }
}
