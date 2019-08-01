package com.hiyoung.system.user.dao;

import com.hiyoung.system.user.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@Mapper
public interface UserMapper {

    int insert(User record);

    User getUser(@Param("phone") String phone);

    List<User> listUsers(@Param("offset")int offset,@Param("count") int count,@Param("id")int id,@Param("name")String name,@Param("status")int status);

    int getCount(@Param("id")int id,@Param("name")String name,@Param("status")int status);

    int deleteByIds( List<Integer> ids);

    @Select({"select count(id) from tb_user where phone = #{phone} and status !=0"})
    int validatePhone(String phone);
}