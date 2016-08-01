package com.didi.didims.redis;


import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Redis数据库操作Dao
 * 
 * @author liaochente
 * @date 2015-5-6 下午2:58:23
 */
public interface IRedisDao {

	/**
	 * 创建一个哈希键,并传值
	 * 
	 * @param key
	 *            哈希键
	 * @param map
	 *            值
	 */
	void putHash(String key, Map<String, String> map);

	/**
	 * 创建一个哈希键,并传值 (设置过期策略)
	 * 
	 * @param key
	 *            哈希键
	 * @param map
	 *            值
	 * @param timeout
	 *            超时时间
	 * @param unit
	 *            超时计算模式
	 */
	void putHash(String key, Map<String, String> map, long timeout,
			TimeUnit unit);

	/**
	 * 获取一个哈希键的值
	 * 
	 * @param key
	 *            键名
	 * @return 哈希值Map
	 */
	Map<Object, Object> getHash(String key);

	/**
	 * 从链表左侧Push一个数据
	 * 
	 * @param key
	 * @param value
	 */
	void leftPushList(String key, String value);

	/**
	 * 从链表左侧Push一个数据 (设置过期策略)
	 * 
	 * @param key
	 * @param value
	 * @param timeout
	 * @param unit
	 */
	void leftPushList(String key, Serializable value, long timeout,
			TimeUnit unit);

	/**
	 * 从链表左侧Pop一个数据
	 * 
	 * @param key
	 * @return
	 */
	String leftPopList(String key);

	/**
	 * 从链表右侧Pop一个数据
	 * 
	 * @param key
	 * @return
	 */
	String rightPopList(String key);

	/**
	 * 查询链表所有元素
	 * 
	 * @param key
	 * @return
	 */
	List<Serializable> getAllByList(String key);

	/**
	 * 链表元素转移，把源队列的元素转移到目标队列
	 * 
	 * @param sourceKey
	 * @param destinationKey
	 */
	void popToPush(String sourceKey, String destinationKey);

	/**
	 * 从链表左侧开始删除元素
	 * 
	 * @param key
	 * @param count
	 * @param value
	 */
	long lRem(String key, int count, String value);

	/**
	 * 创建一个字符类型的键
	 * 
	 * @param key
	 * @param value
	 */
	void set(String key, String value);

    /**
     * 创建一个字符类型的键，定期失效
     * 
     * @param key
     * @param value
     * @param outTime
     *            失效间隔
     * @param unit
     *            计时模式
     */
    void set(String key, String value, long outTime, TimeUnit unit);

	/**
	 * 获取一个字符类型键的值
	 * 
	 * @param key
	 * @return
	 */
	String get(String key);

	/**
	 * 删除键
	 * 
	 * @param key
	 */
	void deleteKey(String key);

	/**
	 * 获取序列号
	 * 
	 * @param key
	 * @return
	 */
	String getSequence(String key);

	/**
	 * 创建序列号
	 * 
	 * @param key
	 */
	void createSequence(String key);

	/**
	 * 判断键是否存在
	 * 
	 * @param key
	 * @return
	 */
	boolean exists(String key);

}
