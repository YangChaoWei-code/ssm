package com.ssm.service.impl;

import com.ssm.service.ProductService;

public class ProductServiceImpl implements ProductService {
    @Override
    public void browse(String loginName, String ProductName) {
        System.out.println("执行业务方法browse");
        // 演示异常通知时,人为抛出该异常
//        throw new RuntimeException("这是特意抛出的异常信息!");
        int i = 100000000;
        while (i > 0) i--;
    }
}
