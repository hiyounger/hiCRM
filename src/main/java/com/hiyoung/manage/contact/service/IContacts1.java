package com.hiyoung.manage.contact.service;

import com.hiyoung.manage.contact.entity.Contacts1;

import java.util.List;

public interface IContacts1 {

    List<Contacts1> getAll();

    Contacts1 selectByPrimaryKey(Integer i);

    int getCount();

    List<Contacts1> listByPage(Integer page, Integer rows);

}
