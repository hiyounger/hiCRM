package com.hiyoung.manage.bussiness.dao;

import com.hiyoung.manage.bussiness.entity.Buiness;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface BuinessDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Buiness record);

    Buiness selectByPrimaryKey(Integer id);

    List<Buiness> selectAll();

    int updateByPrimaryKey(Buiness record);
    List<Buiness> selectByPage(@Param("offere") int offere, @Param("rows") int rows);
    int getcount();
}