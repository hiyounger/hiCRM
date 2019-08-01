package com.hiyoung.realm;

import com.hiyoung.system.user.service.UserServiceIf;
import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;

public class UserRealm extends AuthorizingRealm {

    @Resource
    UserServiceIf userService;
    @Resource
    UserMapper mapper;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("-------身份认证方法--------");
        String phone = (String) authenticationToken.getPrincipal();
        String password = new String((char[]) authenticationToken.getCredentials());
        //根据用户名从数据库获取密码
       User user =mapper.getUser(phone);
        System.out.println(user);

        if (phone == null) {
            return null;
        } else if (user==null) {
            throw new IncorrectCredentialsException();
        }
        ByteSource salt = ByteSource.Util.bytes(user.getName());
        return new SimpleAuthenticationInfo(user,user.getPassword(),salt,getName());
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
       User user= (User)SecurityUtils.getSubject().getPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRole(user.getRole());
        return info;
    }
}
