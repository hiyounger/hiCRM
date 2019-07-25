package com.hiyoung.manage.contact.service;

import com.hiyoung.manage.contact.entity.Contacts;

import java.util.List;

public interface IContacts {

    List<Contacts> getAll();

    Contacts selectByPrimaryKey(Integer i);

    int getCount();

    List<Contacts> listByPage(Integer page, Integer rows);

}
