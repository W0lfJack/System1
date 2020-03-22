package com.connector;

import java.sql.*;

public class Connector {
    //mysql版本8.0.19
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/" +
            "mydatabase?characterEncoding=UTF-8&useSSL=false&" +
            "allowPublicKeyRetrieval=true";
    //用户名和密码
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    //连接 的工具方法
    public static Connection getConnection() {
        Connection connection = null;
        try {
            //注册JDBC驱动
            Class.forName(JDBC_DRIVER);
            //打开链接
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.exit(0);
        }
        return connection;
    }
    //关闭 的三个重载 工具方法
    public static void close(PreparedStatement pstmt) {
        if(pstmt!=null){
            try{
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void close(Connection connection) {
        if(connection!=null){
            try{
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void close(ResultSet rs) {
        if(rs!=null){
            try{
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        String sql = "select * from student";
        Connection connection = getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = (PreparedStatement) connection.prepareStatement(sql);
            rs = (ResultSet) pstmt.executeQuery();
            while (rs.next()) {
                int Sno = rs.getInt("Sno");
                String Sname = rs.getNString("Sname");
                String Ssex = rs.getString("Ssex");
                int Sage = rs.getInt("Sage");
                String Sdept = rs.getString("Sdept");
                System.out.println("NO:" + Sno + " Name:" + Sname + " Sex:" + Ssex +
                        " Age:" + Sage + " Dept:" + Sdept);
            }

            close(rs);
            close(pstmt);
            close(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

