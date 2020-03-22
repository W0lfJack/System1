package com.connector;

import java.util.Random;

public class divece {
    public static void de(int d_10,int d_100,int da){
        int result=d_100/d_10;
        if(da/d_10!=0){
            System.out.printf("%7d\n",result);
            System.out.printf("%2d |",d_10);
            System.out.printf("%3d\n",d_100);
            System.out.printf("%7d\n",result/10*10*d_10);
            System.out.println("  ———————");
            System.out.printf("%7d\n",d_100-result/10*10*d_10);
            if(d_100-result/10*10*d_10>d_10) {
                System.out.printf("%7d\n", result % 10 * d_10);
                System.out.println("  ———————");
                System.out.printf("%7d", d_100 - result / 10 * 10 * d_10 - result % 10 * d_10);
            }
        }
        else{
            System.out.printf("%7d\n",result);
            System.out.printf("%2d |",d_10);
            System.out.printf("%3d\n",d_100);
            System.out.printf("%7d\n",result*d_10);
            System.out.println("  ———————");
            System.out.printf("%7d\n",d_100-result*d_10);
        }
    }
    public static void main(String[] args) {
        Random random_10=new Random();
        int d_10=random_10.nextInt(8)+2;
        int d_100=random_10.nextInt(100);
        int da=d_100/10;
        de(d_10,d_100,da);
    }
}
