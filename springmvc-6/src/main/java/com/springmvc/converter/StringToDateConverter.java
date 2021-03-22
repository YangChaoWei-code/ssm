package com.springmvc.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringToDateConverter implements Converter<String, Date> {

    private String datePattern; // 日期类型模板: 如yyyy-MM-dd

    public void setDatePattern(String datePattern) {
        this.datePattern = datePattern;
    }

    @Override
    public Date convert(String data) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(this.datePattern);
        try {
            return dateFormat.parse(data); // 将字符创转换成Date类型
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("日期转换失败!");
            return null;
        }
    }
}
