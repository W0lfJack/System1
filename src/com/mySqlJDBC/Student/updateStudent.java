package com.mySqlJDBC.Student;

import com.connector.Connector;
import com.mySqlJDBC.SC.updateSC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class updateStudent {
    public static void updateStudentNO(int NO,String name,int age,String sex,String dept,int originNO){
        String sql="update student set Sno=?,Sname=?,Sage=?,Ssex=?,Sdept=? where Sno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            pstmt.setString(2,name);
            pstmt.setInt(3,age);
            pstmt.setString(4,sex);
            pstmt.setString(5,dept);
            pstmt.setInt(6,originNO);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
        }
        updateSC.updateSno(NO,originNO);
    }
}
