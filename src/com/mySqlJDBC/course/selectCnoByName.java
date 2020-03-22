package com.mySqlJDBC.course;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class selectCnoByName {
    public static int selectByCname(String name){
        String sql="select Cno from course where Cname=?;";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        int NO=0;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setString(1,name);
            resultSet=pstmt.executeQuery();
            if (resultSet.next()){
                NO=resultSet.getInt("Cno");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return NO;
    }

    public static void main(String[] args) {
        System.out.println(selectByCname("数据库"));
    }
}
