package com.hiyoung.manage.contact.dao;

import com.hiyoung.manage.contact.entity.Contacts1;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface Contacts1Mapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Contacts1 record);

    int insertSelective(Contacts1 record);

    Contacts1 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Contacts1 record);

    int updateByPrimaryKey(Contacts1 record);

    List<Contacts1> getAll();

    int getCount();

    List<Contacts1> listByPage(@Param("offset") Integer offset, @Param("rows") Integer rows);

}