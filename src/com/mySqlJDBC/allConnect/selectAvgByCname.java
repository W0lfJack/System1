package com.mySqlJDBC.allConnect;

import com.connector.Connector;
import com.mySqlJDBC.course.selectCnoByName;
import com.mySqlJDBC.SC.selectCountStudent;
import com.mySqlJDBC.SC.selectCouseGradeSum;

public class selectAvgByCname {
    public static String selectByCname(String name){
        int NO=selectCnoByName.selectByCname(name);
        double sum=selectCouseGradeSum.selectByNO(NO);
        double count=selectCountStudent.selectByCno(NO);
        String result=String.format("%.1f",sum/count);
        return result;
    }

    public static void main(String[] args) {
        System.out.println(selectByCname("Java语言"));
    }
}
