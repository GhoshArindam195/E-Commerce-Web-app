/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.learn.mycart.helper;

/**
 *
 * @author Arindam-PC
 */
public class Helper {

    public static String get10Words(String st) {
        String str = "";
        
        st=st.trim();
        String s[]=st.split(" ");
        if(s.length<10)
            return st+"...";
        else
        {
            for(int i=0;i<10;i++)
                str+=s[i]+" ";
        }
        return str+"...";
    }
}
