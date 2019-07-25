package com.hiyoung.manage.contracts.dao;

import com.hiyoung.manage.contracts.entity.Contracts;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ContractsMapper {
    /**
     * 按编号删除数据
     * @param id
     * @return
     */
    int deleteById(Integer id);

    /**
     * 插入数据
     *
     * @param record
     * @return
     */
    int insert(Contracts record);

    /**
     * 获得总条数
     *
     * @return
     */
    int getCount();

    /**
     * 分页展示
     *
     * @param offerset
     * @param rows
     * @return
     */
    List<Contracts> listBYPage(@Param("offerset") Integer offerset, @Param("rows") Integer rows);
}