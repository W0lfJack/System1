package com.mySqlJDBC.allConnect;

public class accurateSearch {
    public static String getSQLcomment(String condition){
        String sql="select * from student where "+condition;
        return sql;
    }
    public static String getSQLcomment(String condition,String table){
        String sql="select * from ("+table+") as a where "+condition;
        return sql;
    }

    //对学号和姓名进行处理
    public static String getCondition(String choose,String value,String codition){
        if(choose.equals("all")||value.equals("")){
            return "1=1";
        }
        else if(choose.equals("special")){
            return codition+"='"+value+"'";
        }
        else if(choose.equals("startWith")){
            return codition+" REGEXP '^"+value+"'";
        }
        else{
            return codition+" REGEXP '"+value+"'";
        }
    }

    public static String getSexCondition(String sexChoose){
        if(sexChoose.equals("all")){
            return "1=1";
        }
        else if(sexChoose.equals("男")){
            return "Ssex='男'";
        }
        else{
            return "Ssex='女'";
        }
    }

    public static String getAgeCondition(String choose,String value){
        if(choose.equals("all")||value.equals("")){
            return "1=1";
        }
        else if(choose.equals("older")){
            return "Sage>"+value;
        }
        else if(choose.equals("younger")){
            return "Sage<"+value;
        }
        else{
            return "Sage="+value;
        }
    }

    public static String getDeptCondition(String choose,String value){
        if(choose.equals("all")||value.equals("")){
            return "1=1";
        }
        else{
            return "Sdept='"+value+"'";
        }
    }
}
