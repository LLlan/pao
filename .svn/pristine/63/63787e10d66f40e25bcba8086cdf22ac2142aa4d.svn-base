package com.didi.didims.redis.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import com.didi.common.util.PropertieUtil;
import com.didi.didims.redis.IRedisDao;

@Component
public class RedisDaoImpl implements IRedisDao {

    /**
     * Redis配置对象
     */
    private static PropertieUtil redisConfig = PropertieUtil.newInstance(Thread.currentThread().getContextClassLoader().getResource("").getPath() + "config/redis.properties");

    private final static String redisKey = redisConfig.getValue("redis.key");

    @Autowired
    private RedisTemplate<Serializable, Serializable> template;

    @Override
    public void putHash(String key, Map<String, String> map) {
        template.opsForHash().putAll(redisKey + key, map);
    }

    @Override
    public void putHash(String key, Map<String, String> map, long timeout, TimeUnit unit) {
        template.opsForHash().putAll(redisKey + key, map);
        template.expire(redisKey + key, timeout, unit);
    }

    @Override
    public Map<Object, Object> getHash(String key) {
        return template.opsForHash().entries(redisKey + key);
    }

    @Override
    public void deleteKey(String key) {
        template.delete(redisKey + key);
    }

    @Override
    public String getSequence(String key) {
        long squence = template.opsForValue().increment(redisKey + key, 1);
        return String.valueOf(squence);
    }

    public void createSequence(String key) {
        template.opsForValue().set(redisKey + key, "1");
    }

    @Override
    public void leftPushList(String key, String value) {
        template.opsForList().leftPush(redisKey + key, value);
    }

    @Override
    public void leftPushList(String key, Serializable value, long timeout, TimeUnit unit) {
        template.opsForList().leftPush(redisKey + key, value);
        template.expire(redisKey + key, timeout, unit);
    }

    @Override
    public String leftPopList(String key) {
        return (String) template.opsForList().leftPop(redisKey + key);
    }

    @Override
    public String rightPopList(String key) {
        return (String) template.opsForList().rightPop(redisKey + key);
    }

    @Override
    public List<Serializable> getAllByList(String key) {
        List<Serializable> list = template.opsForList().range(redisKey + key, 0L, -1L);
        return list;
    }

    @Override
    public void popToPush(String sourceKey, String destinationKey) {
        template.opsForList().rightPopAndLeftPush(redisKey + sourceKey, redisKey + destinationKey);
    }

    @Override
    public long lRem(String key, int count, String value) {
        return template.opsForList().remove(redisKey + key, count, value);
    }

    public RedisTemplate<Serializable, Serializable> getTemplate() {
        return template;
    }

    public void setTemplate(RedisTemplate<Serializable, Serializable> template) {
        this.template = template;
    }

    @Override
    public boolean exists(String key) {
        return template.hasKey(redisKey + key);
    }

    @Override
    public void set(String key, String value) {
        template.opsForValue().set(redisKey + key, value);
    }

    @Override
    public String get(String key) {
        Serializable sb = template.opsForValue().get(redisKey + key);
        return sb == null ? null : sb.toString();
    }
    
    @Override
    public void set(String key, String value, long outTime, TimeUnit unit) {
        template.opsForValue().set(redisKey + key, value, outTime, unit);
    }


}