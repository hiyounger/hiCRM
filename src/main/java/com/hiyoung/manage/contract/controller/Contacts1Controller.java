package com.hiyoung.manage.contract.controller;

import com.hiyoung.manage.contacts.service.ContactsService;
import com.hiyoung.manage.contract.entity.Contacts1;
import com.hiyoung.manage.contract.service.IContacts1;
import com.hiyoung.manage.contract.util.PoiUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.beans.IntrospectionException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@RestController
    @RequestMapping(value = "/api/xx")
    public class Contacts1Controller {

        private static final Logger LOG = LoggerFactory.getLogger(Contacts1Controller .class);
        @Resource
        private IContacts1 personService;

        @RequestMapping("/export")
        public void export(HttpServletResponse response) {

            List<Contacts1> Contacts1List = personService.getAll();

            try {
                PoiUtils.export(Contacts1List, "导出的文件", "Contact", response,Contacts1.class);
            } catch (IOException | IntrospectionException | InvocationTargetException | IllegalAccessException e) {
//                LOG.error("审计日志错误{}",e);
            }

        }

    /**
     * excle导入数据并保存到数据库
     *
     * @param file
     * @return
     */
    @RequestMapping("/import")
    public String batchImport(MultipartFile file) throws Exception {
        List<Contacts1> cs = new ArrayList<Contacts1>();
        // 编写解析代码逻辑
        // 基于.xls 格式解析 HSSF
        // 1、 加载Excel文件对象

        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(file.getInputStream());
        // 2、 读取一个sheet
        HSSFSheet sheet = hssfWorkbook.getSheetAt(0);
        // 3、 读取sheet中每一行
        for (Row row : sheet) {
            // 一行数据 对应 一个区域对象
            if (row.getRowNum() == 0) {
                // 第一行 跳过
                continue;
            }
            // 跳过空行
            if (row.getCell(0) == null || StringUtils.isBlank(row.getCell(0).getStringCellValue())) {
                continue;
            }
            Contacts1 c = new Contacts1();
            c.setId(Integer.valueOf(row.getCell(0).getStringCellValue()));
            c.setCustomername(row.getCell(1).getStringCellValue());
            c.setNumber(Integer.valueOf(row.getCell(2).getStringCellValue()));
            c.setContactname(row.getCell(3).getStringCellValue());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            c.setOrdertime(sdf.parse(row.getCell(4).getStringCellValue()));

            cs.add(c);
        }
        // 调用业务层
        cs.forEach(c->{ personService.addContacts1(c);});

        return "ok";
    }

    }

