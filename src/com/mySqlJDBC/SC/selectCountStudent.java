package com.mySqlJDBC.SC;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class selectCountStudent {
    public static int selectByCno(int NO){
        String sql="select count(*) from sc where Cno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        int count=1;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            resultSet=pstmt.executeQuery();
            if (resultSet.next()){
                count=resultSet.getInt("count(*)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return count==0?1:count;
    }

    public static void main(String[] args) {
        System.out.println(selectByCno(7));
    }
}
