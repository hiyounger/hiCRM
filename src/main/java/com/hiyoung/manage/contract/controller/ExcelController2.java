//package com.hiyoung.manage.contract.controller;
//
//import com.hiyoung.manage.contract.entity.Contacts1;
//import org.springframework.http.HttpRequest;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.persistence.criteria.Order;
//import javax.servlet.jsp.jstl.sql.Result;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ExcelController2 {
//    /**
//     * 导出excel
//     * @return
//     */
//    @ResponseBody
//    @PostMapping("/excelExport")
//    public Result excelExport() {
//        String[] ids = request.getParameterValues("ids[]");
//        List<Contacts1> list = new ArrayList<>();
//        for(int i=0;i<ids.length;i++){
//            //查询订订单信息
//            Order order =orderService.getById(ids[i]);
//            if(order!=null){
//                if(!order.getTradeStatus().equals(OrderEnum.STAY_SHIPMENTS.getCode())){
//                    return new Result(ReturnCodeEnum.ORDER_SHIPMENTS_ERR);
//                }
//                Contacts1 Contacts1=new Contacts1();
//                Contacts1.setTrackNumber(order.getTrackNumber());//快递单号
//                Contacts1.setShopOrderCode(order.getShopOrderCode());//订单号
//                list.add(Contacts1);
//            }
//        }
//        String path=pathUrl+"\\order_excel.xls";
//        if (!(new File(path)).getParentFile().exists()) {//判断该路径是否存在如果不存在就创建一个
//            (new File(path)).getParentFile().mkdirs();
//        }
//        log.info("excel开始导出.............................");
//        // 开始导出
//        ExcelUtil.excelExport(list, path);
//        log.info("excel导出结束.............................");
//        //返回这里是你的网页路径，可以访问到你导出的excel
//        return new Result(ReturnCodeEnum.SUCCESS,"http://localhost:8080/xxxx/order_excel.xls");
//    }
//
//    /**
//     * 导入excel
//     * @return
//     */
//    @ResponseBody
//    @PostMapping("/excelEntrance")
//    public Result excelEntrance(@RequestParam MultipartFile file) {
//        //获取上传文件名,包含后缀uploadOneFile
//        String originalFilename = file.getOriginalFilename();
//        //获取后缀
//        String substring = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
//        log.info("后缀：{}",substring);
//        if(substring.equals("xls")||substring.equals("xlsx")){
//            String img = "";
//            try {
//                // 上传文件
//                img = ImageUtils.uploadOneFile(file
//                        , AttachmentPathEnum.getPathById(99)
//                        , true);
//            } catch (Exception e) {
//                throw new WebJsonException(e, ReturnCodeEnum.UNKNOWN_ERR);
//            }
//            log.info("图片路径：{}",img);
//            log.info("完整路径:{}",pathUrl+img);
//            List<Contacts1> list = ExcelUtil.excelImport(pathUrl+img);
//            list.stream().filter((e)->!e.getTrackNumber().equals(""))
//                    .forEach(e->{
//                        Order order=orderService.getOne(new QueryWrapper<Order>().lambda()
//                                .eq(Order::getShopOrderCode, e.getShopOrderCode().replace(" ", "")));
//                        if(order!=null){
//                            if(order.getTradeStatus().equals(OrderEnum.STAY_SHIPMENTS.getCode())){//订单状态必须为待发货
//                                order.setTrackNumber(e.getTrackNumber().replace(" ", ""));
//                                order.setTradeStatus(OrderEnum.STAY_RECEIVING.getCode());
//                                orderService.updateById(order);
//                            }
//                        }
//                    });
//            ExcelUtil.deleteFile(pathUrl+img);
//            return new Result(ReturnCodeEnum.SUCCESS);
//        }
//        return new Result(ReturnCodeEnum.ORDER_EXCEL_UPLOAD_ERR);
//    }
//}
