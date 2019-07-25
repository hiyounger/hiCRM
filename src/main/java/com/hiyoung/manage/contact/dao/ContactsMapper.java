package com.hiyoung.manage.contact.dao;

import com.hiyoung.manage.contact.entity.Contacts;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ContactsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Contacts record);

    int insertSelective(Contacts record);

    Contacts selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Contacts record);

    int updateByPrimaryKey(Contacts record);

    List<Contacts> getAll();

    int getCount();

    List<Contacts> listByPage(@Param("offset") Integer offset, @Param("rows") Integer rows);

}