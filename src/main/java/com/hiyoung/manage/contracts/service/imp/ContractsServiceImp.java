package com.hiyoung.manage.contracts.service.imp;

import com.hiyoung.manage.contracts.dao.ContractsMapper;
import com.hiyoung.manage.contracts.entity.Contracts;
import com.hiyoung.manage.contracts.service.ContractsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ContractsServiceImp implements ContractsService {
    @Resource
    ContractsMapper contractsMapper;
    @Override
    public int getCount() {
        return contractsMapper.getCount();
    }

    @Override
    public int insert(Contracts record) {
        return contractsMapper.insert(record);
    }

    @Override
    public List<Contracts> listBYPage(String pageStr, String rowStr) {
        int page=pageStr==null?1:Integer.parseInt(pageStr);
        int rows =rowStr==null?10:Integer.parseInt(rowStr);
        double count=getCount();
        int pageCount=(int)Math.ceil(count/rows);
        if(page>pageCount){
            page=pageCount;
        }
        if(page<1){
            page=1;
        }
        return contractsMapper.listBYPage((page-1)*rows,rows);
    }

    @Override
    public int deleteById(Integer id) {
        return contractsMapper.deleteById(id);
    }
}
