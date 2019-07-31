package com.hiyoung;

import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.entity.User;
import com.hiyoung.system.user.service.imp.UserServiceImp;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JtcrmApplicationTests {

    @Resource
    UserMapper userMapper;

    @Resource
    UserServiceImp userServiceImp;
    @Test
    public void contextLoads() {
       /* User user=userMapper.getUser("110","admin");
        System.out.println(user);*/
        String hashAlgorithName = "MD5";
        String password = "abc123";
        int hashIterations = 1024;//加密次数
        ByteSource credentialsSalt = ByteSource.Util.bytes("lily");
        Object obj = new SimpleHash(hashAlgorithName, password, credentialsSalt, hashIterations);
        System.out.println(obj);
//        List<User> users = userServiceImp.listUsers(1,2,2);
//        System.out.println(users);

    }

}
