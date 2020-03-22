package com.mySqlJDBC.SC;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class selectCouseGradeSum {
    public static int selectByNO(int NO){
        String sql="select Grade from sc where Cno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        int sum=0;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            resultSet=pstmt.executeQuery();
            while (resultSet.next()){
                sum+=resultSet.getInt("Grade");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return sum;
    }

    public static void main(String[] args) {
        System.out.println(selectByNO(2));

    }
}
