package com.hiyoung.manage.leads.dao;




import com.hiyoung.manage.leads.entity.Leads;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface LeadsMapper {
    Integer addLeads(Leads record);

    int getCount();

    List<Leads> getLeadsList(@Param("page")int page,@Param("size") int size);


    List<Leads>fuzzyQueryByName(@Param("offsize")int offsize,@Param("size") int size,@Param("fuzzyQuery") String fuzzyQuery);

    /**
     *
     * @param fuzzyQuery 模糊查询的记录数
     * @return
     */
    int getCountFuzzy(String fuzzyQuery);


    int insertSelective(Leads record);

    Leads selectByPrimaryKey(Integer id);

    /**
     * 通过编号删除线索
     * @param id
     * @return
     */
    int  getDelleads(int id);

}