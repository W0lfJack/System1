package com.mySqlJDBC.SC;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class deleteSC {
    public static void deleteByNOandCourseNO(int NO,int courseNO){
        String sql="delete from sc where Sno=? and Cno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            pstmt.setInt(2,courseNO);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }
    public static void deleteByNO(int NO){
        String sql="delete from sc where Sno=?";
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
        }
    }

    public static void main(String[] args) {
        deleteSC.deleteByNOandCourseNO(95001,9);
    }
}

