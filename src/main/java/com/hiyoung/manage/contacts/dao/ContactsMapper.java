package com.hiyoung.manage.contacts.dao;

import com.hiyoung.manage.contacts.entity.Contacts;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ContactsMapper {
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
    int insert(Contacts record);

    /**
     * 批量插入
     * @param list
     * @return
     */
    int batchInsert(List<Contacts> list);

    /**
     * 获得总条数
     *
     * @return
     */
    int getCount(@Param("word") String word);

    /**
     * 分页展示
     *
     * @param offerset
     * @param rows
     * @return
     */
    List<Contacts> listBYPage(@Param("offerset") Integer offerset, @Param("rows") Integer rows,@Param("word") String word);

    /**
     * 通过联系人id查一条数据
     * @param id
     * @return
     */
    public Contacts selectById(Integer id);

}