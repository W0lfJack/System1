package com.mySqlJDBC.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connector.Connector;
import com.info.StudentInfo;

public class selectStudent {
    public static void selectByNo(StudentInfo student){
        String sql="select * from student where Sno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        try {
            connection=Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,student.getNo());
            resultSet=pstmt.executeQuery();
            if(resultSet.next()){
                int Sno=resultSet.getInt("Sno");
                String Sname=resultSet.getString("Sname");
                String Ssex=resultSet.getString("Ssex");
                int Sage=resultSet.getInt("Sage");
                String Sdept=resultSet.getString("Sdept");
                student.setNo(Sno);
                student.setName(Sname);
                student.setAge(Sage);
                student.setSex(Ssex);
                student.setDept(Sdept);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }
    public static int selectCount(){
        String sql="select count(*) from student";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        int count=0;
        try {
            connection=Connector.getConnection();
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
    public static boolean existNO(int NO){
        String sql="select * from student where Sno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        Boolean exist=false;
        try{
            connection=Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,NO);
            resultSet=pstmt.executeQuery();
            if(resultSet.next())exist=true;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return exist;
    }

    public static void main(String[] args) {
        System.out.println(selectCount());
    }
}
