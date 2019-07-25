package com.hiyoung.manage.contact.service.imp;

import com.hiyoung.manage.contact.dao.ContactsMapper;
import com.hiyoung.manage.contact.entity.Contacts;
import com.hiyoung.manage.contact.service.IContacts;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ContactsImp implements IContacts {

    @Resource
    ContactsMapper contactsMapper;

    @Override
    public int getCount() {
        return contactsMapper.getCount();
    }

    @Override
    public List<Contacts> getAll() {
        return contactsMapper.getAll();
    }

    @Override
    public List<Contacts> listByPage(Integer page, Integer rows) {
        //最大页码
        double count=contactsMapper.getCount();
        int pageCount = (int)Math.ceil(count/rows);
        if(page>=pageCount) {
            page=pageCount;
        }
        //最小页码
        if(page<1) {
            page=1;
        }
        return contactsMapper.listByPage((page-1)*rows, rows);

    }

    @Override
    public Contacts selectByPrimaryKey(Integer i) {
        return contactsMapper.selectByPrimaryKey(i);
    }

}
