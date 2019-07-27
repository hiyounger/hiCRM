package com.hiyoung.system.user.dao;

import com.hiyoung.system.user.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@Mapper
public interface UserMapper {

    int insert(User record);

    User getUser(@Param("username") String username, @Param("password") String password);

    List<User> listUsers(@Param("offset")Integer offset,@Param("count") Integer count,@Param("id")int id);

    int getCount(int id);

    int deleteByIds( List<Integer> ids);
}