package com.ecjtu.util;

import java.util.UUID;

/**
 * 生成激活码
 * @author 24255
 */
public class UUIDUtil {
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
