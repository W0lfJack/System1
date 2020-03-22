package com.mySqlJDBC.Student;

import com.mySqlJDBC.SC.deleteSC;
import com.connector.Connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class deleteStudent {
    public static int deleteByNO(int NO){
        String sql="delete from student where Sno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
            deleteSC.deleteByNO(NO);
        }
        return 1;
    }

    public static void main(String[] args) {
        deleteByNO(11111);
    }
}
