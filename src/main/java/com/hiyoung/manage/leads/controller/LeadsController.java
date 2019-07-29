package com.hiyoung.manage.leads.controller;

import com.hiyoung.manage.leads.entity.Leads;
import com.hiyoung.manage.leads.service.LeadsServiceIf;
import com.sun.net.httpserver.Authenticator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Source;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage/leads")
public class LeadsController {
    @Resource
    private LeadsServiceIf leadsServiceIf;

    @ResponseBody
    @RequestMapping("/list.do")
    public Map<String, Object> list(@RequestParam("page") int page, @RequestParam("rows") int rows, Integer id) {
        int total = 1;
        System.out.println("page=" + page + "rows11=" + rows);
        HashMap<String, Object> map = new HashMap<>();
//        Object leadsId11 = session.getAttribute("leadsId");
        if (id == null) {
            //获取总记录数
            int count = leadsServiceIf.getCount();
            List<Leads> leadslist = leadsServiceIf.getLeadslist(page, rows, 0);
            map.put("rows", leadslist);
            map.put("total", count);
            return map;

        }

//        int leadsId= (Integer) leadsId11;
        System.out.println("添加的线索编号" + id);
        //计算出总jilu数
        List<Leads> leadslist = leadsServiceIf.getLeadslist(page, rows, id);
        System.out.println("一共有多少条数" + leadslist);
        map.put("rows", leadslist);
        map.put("total", total);
        return map;


    }

    @RequestMapping("/load")
    public String load() {
        return "leads/listTaxPayer";

    }

    /**
     * 按条件搜索线索
     *
     * @param request
     * @return
     */
    @RequestMapping("/fuzzyQuery.action")
    @ResponseBody
    public Map<String, Object> fuzzyQuery(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows) {
        String fuzzy = request.getParameter("fuzzyQuery");
        System.out.println("----------" + page + "=============" + rows);
        System.out.println("fuzzy" + fuzzy);
        HashMap<String, Object> map = new HashMap<>();
        List<Leads> leads = leadsServiceIf.fuzzyQueryByName(page, rows, fuzzy);
        System.out.println("mimimiimi" + leads.size());
        //获取模糊查询的总条数
        int total = leadsServiceIf.getCountFuzzy(fuzzy);
        map.put("rows", leads);
        map.put("total", total);
        return map;

    }


    /**
     * 创建线索
     *
     * @param leads
     * @return
     */
    @RequestMapping("/addleadsSingle.action")
    @ResponseBody
    public int addLeads(Leads leads) {
        System.out.println("leads=" + leads);
        Integer num = leadsServiceIf.addLeads(leads);
        //session.setAttribute("leadsId",id);
        if (num > 0) {
            int id = leads.getId();
            System.out.println("id编号为" + id);
            return id;
        }
        return -1;
    }

    @RequestMapping("/addleads.page")
    public String addleads() {
        return "leads/addleads";
    }

    /**
     * 删除
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/delUser.action")
    public boolean delete(HttpServletRequest request) {
        String fuserids = request.getParameter("fuserids");
        System.out.println("fuserids" + fuserids);
        // fuserids = fuserids.substr(0, fuserids.length - 1);
        // String subs = fuserids.substring(0, fuserids.length() - 1);
        String[] ids = fuserids.split(",");
        System.out.println("有几个编号" + ids.length);
        for (int i = 0; i < ids.length; i++) {
            int i1 = Integer.parseInt(ids[i]);
            int num1 = leadsServiceIf.deleteLeadsById(i1);
            System.out.println("返回json的数据是" + num1);
            if (num1 == 0) {
                return false;
            }
        }

        return true;
    }

    @RequestMapping("/getLeadsName.action")
    @ResponseBody
    public boolean getLeadsName(String leadsName) {
        //返回false 说明线索名称存在 前端得到false就会验证失败
        if (leadsServiceIf.getLeadsName(leadsName)) {
            System.out.println("leadsServiceIf.getLeadsName(leadsName)" + leadsServiceIf.getLeadsName(leadsName));
            return false;
        }
        return true;

    }
}
