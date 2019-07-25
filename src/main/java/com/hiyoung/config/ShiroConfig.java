package com.hiyoung.config;

import com.hiyoung.realm.UserRealm;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig  {
    @Bean("hashedCredentialsMatcher")
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher credentialsMatcher =
                new HashedCredentialsMatcher();
        //指定加密方式为MD5
        credentialsMatcher.setHashAlgorithmName("MD5");
        //加密次数
        credentialsMatcher.setHashIterations(1024);
        credentialsMatcher.setStoredCredentialsHexEncoded(true);
        return credentialsMatcher;
    }


    @Bean
    public ShiroFilterFactoryBean shiroFilter(@Qualifier("securityManager")
                                                     DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        // 设置 SecurityManager
        bean.setSecurityManager(securityManager);
        // 设置登录成功跳转Url
        bean.setSuccessUrl("/WEB-INF/jsp/index.jsp");
        // 设置登录跳转Url
        bean.setLoginUrl("/login.jsp");
        // 设置未授权提示Url
        bean.setUnauthorizedUrl("/WEB-INF/jsp/fail.jsp");

        /**
         * anon：匿名用户可访问
         * authc：认证用户可访问
         * user：使用rememberMe可访问
         * perms：对应权限可访问
         * role：对应角色权限可访问
         **/
        Map<String, String> filterMap = new LinkedHashMap<>();
        filterMap.put("/login","anon");
        filterMap.put("/static/**","anon");
        filterMap.put("/system/**","authc");
        filterMap.put("/jsp/**","authc");
        filterMap.put("/**", "authc");
        bean.setFilterChainDefinitionMap(filterMap);
        return bean;
    }

    @Bean(name="myRealm")
    public UserRealm realm() {
        UserRealm realm = new UserRealm();
        //realm.setCredentialsMatcher(credentialsMatcher);
        return realm ;
    }
    /**
     * 注入 securityManager
     */
    @Bean(name="securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(Realm myRealm){

        DefaultWebSecurityManager securityManager =
                new DefaultWebSecurityManager();
        // 关联realm.
        securityManager.setRealm(myRealm);
        return securityManager;
    }

}
