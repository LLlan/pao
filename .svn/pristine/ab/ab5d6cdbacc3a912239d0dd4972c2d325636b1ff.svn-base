package com.didi.didims.shiro.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.config.Ini;
import org.slf4j.Logger;
import org.springframework.beans.factory.FactoryBean;

import com.didi.didims.service.IPermissionService;

/**
 * 自定义访问责任链数据源对象
 * 
 * @author liaochente
 * 
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {

//    private final static Logger log = LoggerFactory.getSystemLogger();

    @Resource
    private IPermissionService managePermissionService;

    // 配置文件中的默认权限配置
    private String filterChainDefinitions = null;

    public Ini.Section getObject() throws Exception {
        Ini ini = new Ini();
//        log.info(ChainDefinitionSectionMetaSource.class.getName() + "-责任链动态初始化-");
        // 加载默认的url
        ini.load(filterChainDefinitions);
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
        Map<String, Object> param = new HashMap<String, Object>();
        List<Map<String, Object>> permissions = managePermissionService.queryPermissions(param);
        for (Map<String, Object> map : permissions) {
//            log.info(ChainDefinitionSectionMetaSource.class.getName() + "-拦截配置加载:" + map.get("url") + " = perms[" + map.get("permissionCode") + "]");
            section.put((String) map.get("url"), "perms[" + map.get("permissionCode") + "]");
            section.put(map.get("url") + "/exec", "perms[" + map.get("permissionCode") + "]");
            System.out.println("****url**** " + map.get("url") + "=" + "perms[" + map.get("permissionCode") + "]");
            System.out.println("****url**** " + map.get("url") + "/exec=" + "perms[" + map.get("permissionCode") + "]");
        }
        /* section.put("/**", "authc"); */
        section.put("/**", "authc");
//        log.info(ChainDefinitionSectionMetaSource.class.getName() + "-拦截配置加载:/** = authc");
//        log.info(ChainDefinitionSectionMetaSource.class.getName() + "-责任链动态初始化完成");
        return section;
    }

    /**
     * 通过filterChainDefinitions对默认的url过滤定义
     * 
     * @param filterChainDefinitions
     *            默认的url过滤定义
     */
    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }

    public Class<?> getObjectType() {
        return this.getClass();
    }

    public boolean isSingleton() {
        return false;
    }

}
