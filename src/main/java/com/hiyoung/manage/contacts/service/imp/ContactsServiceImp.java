package com.hiyoung.manage.contacts.service.imp;

import com.hiyoung.manage.contacts.dao.ContactsMapper;
import com.hiyoung.manage.contacts.entity.Contacts;
import com.hiyoung.manage.contacts.service.ContactsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ContactsServiceImp implements ContactsService {
    @Resource
    ContactsMapper contactsMapper;
    @Override
    public int getCount(String word) {
        return contactsMapper.getCount(word);
    }

    @Override
    public Contacts selectById(Integer id) {
        return contactsMapper.selectById(id);
    }

    @Override
    public int insert(Contacts record) {
        return contactsMapper.insert(record);
    }

    @Override
    public int batchInsert(List<Contacts> list) {
        return contactsMapper.batchInsert(list);
    }

    @Override
    public List<Contacts> listBYPage(String pageStr, String rowStr,String word) {
        int page = pageStr==null?1:Integer.parseInt(pageStr);
        int rows =rowStr==null?10:Integer.parseInt(rowStr);
        double count=getCount(word);
        int pageCount=(int)Math.ceil(count/rows);
        if(page>pageCount){
            page=pageCount;
        }
        if(page<1){
            page=1;
        }
        return contactsMapper.listBYPage((page-1)*rows,rows,word);
    }

    @Override
    public int deleteById(Integer id) {
        return contactsMapper.deleteById(id);
    }
}
