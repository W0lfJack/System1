package com.mySqlJDBC.allConnect;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class selectCnameBySno {
    public static List<String> selectByNO(int NO){
        List<String> list=new ArrayList<>();
        String sql="select Cname from (select * from student\n" +
                "    left join sc using(Sno) where Sno=?) as a left join course using(Cno)";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            resultSet=pstmt.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("Cname");
                list.add(name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return list;
    }
}
