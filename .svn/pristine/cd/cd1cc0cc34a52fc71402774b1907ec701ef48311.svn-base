package com.didi.didims.shiro.util;

import org.apache.shiro.crypto.hash.SimpleHash;

import com.didi.common.util.MD5Util;
import com.didi.common.util.NumberUtil;


/**
 * 密码策略器
 * 
 * @author liaochente
 * 
 */
public class PasswordPolicy {

    /**
     * 加密密码
     * 
     * @param username
     * @param password
     * @param salt
     *            随机数
     * @return
     */
    public static String passwordEncryt(String username, String password, String salt) {
        int hashIterations = 2;
        SimpleHash hash = new SimpleHash("md5", password, username + salt, hashIterations);
        String enPassword = hash.toHex();
        return enPassword;
    }

    /**
     * 生成加密随机数(6位)
     * 
     * @return
     */
    public static String randomSalt() {
        return NumberUtil.format(NumberUtil.randomNumber(1000000), "000000");
    }
    
    public static void main(String[] args) {
        String random = PasswordPolicy.randomSalt();
        String p = PasswordPolicy.passwordEncryt("admin", "123456", random);
        System.out.println(MD5Util.encryption(MD5Util.encryption("123456") + ("admin" + random)));
        System.out.println(random);
        System.out.println(p);
    }

}
