package com.mySqlJDBC.allConnect;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class selectCount {
    public static int selectBySQL(String sql){
        sql="select count(*) from ("+sql+") as a";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        int count=0;
        try {
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            resultSet=pstmt.executeQuery();
            if(resultSet.next()){
                count=resultSet.getInt("count(*)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return count;
    }

}
