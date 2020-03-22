package com.mySqlJDBC.course;

import com.connector.Connector;
import com.info.CourseInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class selectCourse {
    public static void selectByNO(CourseInfo course){
        String sql="select * from course where Cno=?";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            pstmt.setInt(1,course.getNO());
            resultSet=pstmt.executeQuery();
            if(resultSet.next()){
                int NO=resultSet.getInt("Cno");
                String name=resultSet.getString("Cname");
                String pno=resultSet.getString("Cpno");
                int credit=resultSet.getInt("Ccredit");

                course.setNO(NO);
                course.setName(name);
                course.setPno(pno);
                course.setCredit(credit);
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
        String sql="select count(*) from course";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        int count=0;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            resultSet=pstmt.executeQuery();
            if(resultSet.next()){
                count=resultSet.getInt("count(*)");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return count;
    }
    public static boolean exist(int NO){
        String sql="select * from course where Cno="+NO;
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
    public static int findLoophole(){
        int count=selectCount();
        String sql="select Cno from course";
        Connection connection=null;
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        try{
            connection= Connector.getConnection();
            pstmt=connection.prepareStatement(sql);
            resultSet=pstmt.executeQuery();
            if(resultSet.next()){
                for(int i=1;i<=count;i++){
                    int index=resultSet.getInt("Cno");
                    if(i!=index)return i;
                    resultSet.next();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Connector.close(resultSet);
            Connector.close(pstmt);
            Connector.close(connection);
        }
        return count+1;
    }
    public static void main(String[] args) {
//        CourseInfo c=new CourseInfo();
//        c.setNO(3);
//        selectCourse.selectByNOandCourse(c);
//        System.out.println(c.getNO()+" "+c.getName()+" "+c.getPno()+" "+c.getCredit());
//        System.out.println(selectCourse.selectCount());
        System.out.println(findLoophole());
    }
}
