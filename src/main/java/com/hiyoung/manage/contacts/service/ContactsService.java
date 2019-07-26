package com.hiyoung.manage.contacts.service;


import com.hiyoung.manage.contacts.entity.Contacts;

import java.util.List;

public interface ContactsService {

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
    int insert(Contacts record);

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
    List<Contacts> listBYPage(String pageStr, String rowStr);

    /**
     * 通过联系人姓名查一条数据
     * @param name
     * @return
     */
    public Contacts selectByName(String name);
}
