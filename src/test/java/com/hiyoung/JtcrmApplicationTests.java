package com.hiyoung;

import com.hiyoung.system.user.dao.UserMapper;
import com.hiyoung.system.user.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JtcrmApplicationTests {

    @Autowired
    UserMapper userMapper;
    @Test
    public void contextLoads() {
        User user=userMapper.getUser("zhangsan","111");
        System.out.println(user);
    }

}
