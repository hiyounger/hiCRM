package com.hiyoung.manage.contract.service;

import com.hiyoung.manage.contract.entity.Contacts1;

import java.util.List;

public interface IContacts1 {

    List<Contacts1> getAll();

    Contacts1 selectByPrimaryKey(Integer i);

    int getCount(String contactName);

    List<Contacts1> listByPage(Integer page, Integer rows, String contactName, Boolean isSingle);

    Integer addContacts1(Contacts1 contacts1);



}
