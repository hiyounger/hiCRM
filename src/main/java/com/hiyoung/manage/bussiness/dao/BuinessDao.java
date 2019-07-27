package com.hiyoung.manage.bussiness.dao;



import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hiyoung.manage.bussiness.entity.Buiness;
@Mapper
public interface BuinessDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Buiness record);

    Buiness selectByPrimaryKey(Integer id);

    List<Buiness> selectAll();

    int updateByPrimaryKey(Buiness record);
    List<Buiness> selectByPageAnd(@Param("offere")int offere ,@Param("rows") int rows,@Param("namese")String name);
    
    List<Buiness> selectByPage(@Param("offere")int offere ,@Param("rows") int rows);
    List<Buiness> selectByPagetheone(@Param("offere")int offere ,@Param("rows") int rows,@Param("theone")int theone);
    int getcount();
}