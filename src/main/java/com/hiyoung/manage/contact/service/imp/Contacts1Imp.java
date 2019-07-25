package com.hiyoung.manage.contact.service.imp;

import com.hiyoung.manage.contact.dao.Contacts1Mapper;
import com.hiyoung.manage.contact.entity.Contacts1;
import com.hiyoung.manage.contact.service.IContacts1;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Contacts1Imp implements IContacts1 {

    @Resource
    Contacts1Mapper contactsMapper1;

    @Override
    public int getCount() {
        return contactsMapper1.getCount();
    }

    @Override
    public List<Contacts1> getAll() {
        return contactsMapper1.getAll();
    }

    @Override
    public List<Contacts1> listByPage(Integer page, Integer rows) {
        //最大页码
        double count=contactsMapper1.getCount();
        int pageCount = (int)Math.ceil(count/rows);
        if(page>=pageCount) {
            page=pageCount;
        }
        //最小页码
        if(page<1) {
            page=1;
        }
        return contactsMapper1.listByPage((page-1)*rows, rows);

    }

    @Override
    public Contacts1 selectByPrimaryKey(Integer i) {
        return contactsMapper1.selectByPrimaryKey(i);
    }

    @Override
    public Integer addContacts1(Contacts1 contacts1) {
        return contactsMapper1.insert(contacts1);
    }
}
