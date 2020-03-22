package com.mySqlJDBC.SC;

import com.info.SCInfo;
import com.connector.Connector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class selectSC {
    public static void selectByNOandCourse(SCInfo scInfo){
        String sql="select * from sc where Sno=? and Cno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        try{
            connection=Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,scInfo.getNO());
            pstmt.setInt(2,scInfo.getCourseNo());
            resultSet=pstmt.executeQuery();
            if(resultSet.next()){
                int Sno=resultSet.getInt("Sno");
                int Cno=resultSet.getInt("Cno");
                int grade=resultSet.getInt("Grade");
                scInfo.setCourseNo(Cno);
                scInfo.setNO(Sno);
                scInfo.setGrade(grade);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
    }

    public static int selectCount(){
        String sql="select count(*) from sc";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        int count=0;
        try{
            connection=Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            resultSet=pstmt.executeQuery();
            if(resultSet.next())count=resultSet.getInt("count(*)");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return count;
    }

    public static boolean exist(int NO,int courseNO){
        String sql="select * from sc where Sno="+NO+" and Cno="+courseNO;
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        boolean exist=false;
        try{
            connection=Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
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
        System.out.println(selectSC.exist(95002,5));
    }
}
