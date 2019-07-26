package com.hiyoung.manage.leads.service.imp;

import com.hiyoung.manage.leads.dao.LeadsMapper;
import com.hiyoung.manage.leads.entity.Leads;
import com.hiyoung.manage.leads.service.LeadsServiceIf;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class LeadsServiceImp implements LeadsServiceIf {

    @Resource
    private LeadsMapper leadsMapper;
    /**
     * 实现接口的分页查询方法
     * @param currentPage 当前页码
     * @param currentCount 一页展示的条数
     */

    @Override
    public List<Leads> getLeadslist(int currentPage, int currentCount) {
        System.out.println("当前页"+currentPage+"当前页条数"+currentCount);
        if (currentPage<1){
            currentPage=1;
        }
        double count=leadsMapper.getCount();
        int pageCount=(int)Math.ceil(count/currentPage);
        if(currentPage>pageCount) {
            currentPage=pageCount;
        }

        return leadsMapper.getLeadsList((currentPage-1)*currentCount,currentCount);




    }

    /**
     * 获取所有记录数
     * @return
     */
    @Override
    public int getCount() {
        return leadsMapper.getCount();
    }

    /**
     * 根据id删除线索
     * @param id
     * @return
     */
    @Override
    public int deleteLeadsById(int id) {
        int num = leadsMapper.getDelleads(id);
        return num;
    }

    @Override
    public int addLeads(Leads leads) {
        // String leadsName = leads.getLeadsname();
//        System.out.println("线索名"+leadsName);
        int num = leadsMapper.addLeads(leads);
        System.out.println(num);
        return num;
    }
}
