package com.hiyoung.manage.contracts.service;


import com.hiyoung.manage.contracts.entity.Contracts;

import java.util.List;

public interface ContractsService {

    /**
     * 按编号删除数据
     * @param id
     * @return
     */
    int deleteById(Integer id);
    /**
     * 插入数据
     * @param record
     * @return
     */
    int insert(Contracts record);

    /**
     * 获得总条数
     * @return
     */
    int getCount();

    /**
     * 分页展示
     * @param pageStr
     * @param rowStr
     * @return
     */
    List<Contracts> listBYPage(String pageStr, String rowStr);

    /**
     * 通过联系人姓名查一条数据
     * @param name
     * @return
     */
    public Contracts selectByName(String name);
}
