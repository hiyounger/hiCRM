package com.hiyoung.system.user.dao;

import com.hiyoung.system.user.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getUser(@Param("username") String username, @Param("password") String password);

    List<User> listUsers(@Param("offset")Integer offset,@Param("count") Integer count);

    int getCount();
}