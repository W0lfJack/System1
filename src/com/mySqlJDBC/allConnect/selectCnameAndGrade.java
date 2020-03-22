package com.mySqlJDBC.allConnect;

import com.connector.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class selectCnameAndGrade {
    public static List<String> selectByNO(int NO){
        List<String> list=new ArrayList<>();
        String sql="select Cname,Grade from (select * from student\n" +
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
                String grade=resultSet.getString("Grade");
                list.add(name);
                list.add(grade);
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

    public static void main(String[] args) {
        List<String> list=new ArrayList<>();
        list=selectByNO(95004);
        while(!list.isEmpty()){
            if(list.get(0)!=null){
                System.out.println(list.remove(0)+":"+list.remove(0));
            }
            else break;
        }
    }
}
