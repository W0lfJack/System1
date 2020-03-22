package com.mySqlJDBC.SC;

import com.connector.Connector;
import com.info.SCInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class insertSC {
    public static void updateStudentByNoAndCourse(int NO,int courseNO,int grade){
        String sql="insert into sc (Sno,Cno,Grade) value (?,?,?)";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            pstmt.setInt(2,courseNO);
            pstmt.setInt(3,grade);
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
        int cno=9;
        int grade=100;
        insertSC.updateStudentByNoAndCourse(no,cno,grade);
    }
}
