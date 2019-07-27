package com.hiyoung;

import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.entity.User;
import com.hiyoung.system.user.service.imp.UserServiceImp;
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
        User user=userMapper.getUser("zhangsan","111");
        System.out.println(user);

        List<User> users = userServiceImp.listUsers(1,2,2);
        System.out.println(users);

    }

}
