package com.mySqlJDBC.SC;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class updateSC {
    public static void updateStudentByNoAndCourse(int grade,int NO,int courseNO){
        String sql="update sc set Grade=? where Sno=? and Cno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,grade);
            pstmt.setInt(2,NO);
            pstmt.setInt(3,courseNO);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }

    public static void updateSno(int NO,int originNO){
        String sql="update sc set Sno=? where Sno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            pstmt.setInt(2,originNO);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }

    public static void main(String[] args) {
        int no=95001;
        int cn=1;
        int grade=66;
        updateSC.updateStudentByNoAndCourse(grade,no,cn);
    }
}
