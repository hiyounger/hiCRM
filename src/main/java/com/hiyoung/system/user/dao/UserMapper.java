package com.hiyoung.system.user.dao;

import com.hiyoung.system.user.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@Mapper
public interface UserMapper {

    int insert(User record);

    User getUser(@Param("phone") int phone, @Param("password") String password);

    List<User> listUsers(@Param("offset")int offset,@Param("count") int count,@Param("id")int id,@Param("name")String name,@Param("status")int status);

    int getCount(@Param("id")int id,@Param("name")String name,@Param("status")int status);

    int deleteByIds( List<Integer> ids);
}