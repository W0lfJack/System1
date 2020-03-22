package com.mySqlJDBC.course;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class deleteCourse {
    public static void deleteByNOandCourseNO(int NO){
        String sql="delete from course where Cno=?";
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
        deleteCourse.deleteByNOandCourseNO(20);
    }
}
