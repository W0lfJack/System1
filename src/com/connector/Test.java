package com.connector;

import java.sql.*;

public class Test {
    private static final String user = "root";
    private static final String password = "123456";
    private  static  final String JDBC_Drive="com.mysql.jdbc.Driver";
    private  static  final String URL= "jdbc:mysql://localhost:3306/mydatabase?&useSSL=false&allowPublicKeyRetrieval=true";
    public static Connection getConnection(){
        Connection connection=null;
        try {
            Class.forName(JDBC_Drive);
            connection= DriverManager.getConnection(URL,user,password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return  connection;
    }
    public static void myclose(ResultSet res, PreparedStatement pst,Connection connection)
    {
        if(res!=null) {
            try {
                res.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        ;
        if (pst!=null) {
            try {
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection!=null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public static void main(String[] args) {
//        PreparedStatement pst=null;
//        String sql="select * from student";
//        ResultSet res=null;
//        Connection connection=getConnection();
//        try {
//            pst=connection.prepareStatement("select * from student");
//            res=pst.executeQuery();
//            while (res.next()){
//                int Sno = res.getInt("Sno");
//                String Sname = res.getNString("Sname");
//                String Ssex = res.getString("Ssex");
//                int Sage = res.getInt("Sage");
//                String Sdept = res.getString("Sdept");
//                System.out.println("NO:" + Sno + " Name:" + Sname + " Sex:" + Ssex +
//                        " Age:" + Sage + " Dept:" + Sdept);
//            }
//            res.close();
//            pst.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
        Test.getConnection();
    }
}