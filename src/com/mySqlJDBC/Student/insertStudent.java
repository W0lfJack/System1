package com.mySqlJDBC.Student;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class insertStudent {
    public static void insertStudent(int NO,String name,int age,String sex,String dept){
        String sql="insert into student(Sno,Sname,Sage,Ssex,Sdept) value (?,?,?,?,?)";
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
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }
}
