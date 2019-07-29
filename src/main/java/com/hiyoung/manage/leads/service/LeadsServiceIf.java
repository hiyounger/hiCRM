package com.hiyoung.manage.leads.service;


import com.hiyoung.manage.leads.entity.Leads;

import java.util.List;

public interface LeadsServiceIf {
    /**
     * 分页查询所有数据
     *
     * @param currentPage  当前页码
     * @param currentCount 一页展示的条数
     * @return
     */
    List<Leads> getLeadslist(int currentPage, int currentCount, int leadsId);

    List<Leads> fuzzyQueryByName(int currentPage, int currentCount, String fuzzyQuery);

    int getCountFuzzy(String fuzzyQuery);

    /**
     * 获得所有记录数
     *
     * @return
     */
    int getCount();


    /**
     * 删除线索
     */
    int deleteLeadsById(int id);


    int addLeads(Leads leads);

    /**
     * 添加的时候查询是否有此线索人
     *
     * @param leadsName
     * @return
     */
    boolean getLeadsName(String leadsName);

}
