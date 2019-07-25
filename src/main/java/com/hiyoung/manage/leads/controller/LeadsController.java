package com.hiyoung.manage.leads.controller;
import com.hiyoung.manage.leads.entity.Leads;
import com.hiyoung.manage.leads.service.LeadsServiceIf;
import com.sun.net.httpserver.Authenticator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    public Map<String,Object> list(@RequestParam("page") int page, @RequestParam("rows") int rows){
        System.out.println("page="+page+"rows11="+rows);
        HashMap<String,Object>map=new HashMap<>();
        //获取总记录数
        int count = leadsServiceIf.getCount();
        System.out.println("count="+count);
        //计算出总jilu数
        List<Leads> leadslist = leadsServiceIf.getLeadslist(page, rows);
        System.out.println("rows"+leadslist.size());
        map.put("rows",leadslist);
        map.put("total",count);

        return  map;

    }
    @RequestMapping("/load")
    public String  load(){
        return "listTaxPayer";

    }

    /**
     * 删除
     * @return
     */
    @ResponseBody
   @RequestMapping("/delUser.action")
      public boolean delete(HttpServletRequest request){
       String fuserids = request.getParameter("fuserids");
        System.out.println("fuserids"+fuserids);
      // fuserids = fuserids.substr(0, fuserids.length - 1);
       // String subs = fuserids.substring(0, fuserids.length() - 1);
        String[] ids= fuserids.split(",");
        System.out.println("有几个编号"+ids.length);
       for (int i = 0; i < ids.length; i++) {
           int i1 = Integer.parseInt(ids[i]);
           int num1 = leadsServiceIf.deleteLeadsById(i1);
           System.out.println("返回json的数据是"+num1);
          if (num1==0){
              return  false;
          }
       }

        return true;
    }
 @RequestMapping("/addleads.action")
  public String addLeads(Leads leads){
           leadsServiceIf.addLeads(leads);
         return "addleads";

}
}
