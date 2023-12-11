package com.calanco.watchandlearn.adapters;

import com.calanco.watchandlearn.Strings;

import java.io.File;

public class FileAdapter {
    public static File openJsp(String name){
        return new File("../webapps/"+ Strings.mainPath+"/"+name);
    }
}
