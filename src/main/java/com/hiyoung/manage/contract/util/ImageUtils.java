//package com.hiyoung.manage.contract.util;
//
//import com.yd.mall.common.enums.GoodsImgSizeEnum;
//import net.coobird.thumbnailator.Thumbnails;
//import org.apache.commons.io.FileUtils;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.web.multipart.MultipartFile;
//
//import javax.activation.MimetypesFileTypeMap;
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStream;
//import java.nio.file.Paths;
//import java.nio.file.StandardCopyOption;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.Properties;
//import java.util.UUID;
//
///**
// * @Description 图片上传工具类
// * @Author pengar
// * @Date 2018-08-28 14:05
// * @Version 1.0
// */
//public class ImageUtils {
//
//    private static MimetypesFileTypeMap mtftp;
//
//    private static Properties props;
//
//    static{
//        try(InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("upload.properties")) {
//            props = new Properties();
//            props.load(in);
//            mtftp = new MimetypesFileTypeMap();
//            mtftp.addMimeTypes(getMimeTypes());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    /**
//     * 将数据库图片资源路径转换成网页url
//     * @param path
//     * @return
//     * @throws Exception
//     */
//    public static String convertDbUrl2WebUrl(String path){
//        if(StringUtils.isBlank(path)){
//            return getServerURL()+getDefaultImgPath();
//        }
//        if(path.indexOf("http://")==-1 || path.indexOf("https://")==-1){
//            path=getServerURL()+path;
//        }
//        return path;
//    }
//
//    /**
//     * 将网页url路径转换成数据库图片资源
//     * @param path
//     * @return
//     * @throws Exception
//     */
//    public static String convertWebUrl2DbUrl(String path){
//        if(StringUtils.isBlank(path)){
//            return "";
//        }
//        if(path.indexOf("http://")==0 || path.indexOf("https://")==0){
//            path=path.replaceAll(getServerURL(), "");
//        }
//        return path;
//    }
//
//    /**
//     * 切换成各种尺寸的图片
//     * @param url
//     * @param gis
//     * @param returnDB
//     * @return
//     */
//    public static String convert2SizeUrl(String url, GoodsImgSizeEnum gis, boolean returnDB){
//        if(url.indexOf("http://")==0 || url.indexOf("https://")==0){
//            url = convertDbUrl2WebUrl(url);
//        }
//
//        int index = url.lastIndexOf(".");
//        String suffix = url.substring(index);
//        url=url.substring(0, index) + gis.getSuffix()  + suffix;
//        if(returnDB)
//            url = convertWebUrl2DbUrl(url);
//        return url;
//    }
//
//    /**
//     * 获取默认图片地址
//     * @return
//     */
//    private static String getDefaultImgPath() {
//        String path = props.getProperty("img.default.Path");
//        if(StringUtils.isBlank(path)){
//            return "";
//        }
//        return path;
//    }
//
//    /**
//     * 获取文件类型
//     * @param filePath
//     * @return
//     * @throws Exception
//     */
//    public static String getSuffix(String filePath) throws Exception{
//        File img = new File(filePath);
//        String suffix="";
//        if(img.isFile()){
//            int i = img.getPath().lastIndexOf(".");
//            if(i!=-1){
//                suffix = img.getPath().substring(i);
//            }else{
//                suffix = ".jpg";
//            }
//        }
//        return suffix;
//    }
//
//    /**
//     * 处理不同系统的上传路径
//     * @param path
//     * @return
//     */
//    public static String dealOsPath(String path){
//        String os = System.getProperty("os.name");
//        if(os.toLowerCase().startsWith("win")){
//            if(path.startsWith(getServerURL())){
//                path = path.replaceFirst(getServerURL(), getUploadPath());
//            }else{
//                path = getUploadPath()+path;
//            }
//        }else{
//            path= getUploadPath()+path;
//        }
//        return path;
//    }
//
//    /**
//     * 删除原图
//     * @param path
//     * @return
//     * @throws Exception
//     */
//    public static int delLocalImg(String path) throws Exception{
//        path = dealOsPath(path);
//        File file = new File(path);
//        file.delete();
//        return 0;
//    }
//
//    /**
//     * 判断是否为指定图片类型
//     * @param file
//     * @return
//     */
//    public static void isImage(File file){
//        String mimetype= mtftp.getContentType(file);
//        String type = mimetype.split("/")[0];
//        if(!type.equals("image")){
//            throw new RuntimeException("请上传正确的图片类型");
//        }
//    }
//
//    /**
//     * 获取图片服务器的路径
//     * @return
//     */
//    public static String getServerURL(){
//        return props.getProperty("img.server.URL");
//    }
//
//    /**
//     * 获取随机文件名
//     * @return
//     * @throws Exception
//     */
//    public static String getRamdomName(){
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-");
//        String format = sdf.format(new Date());
//        format+=UUID.randomUUID();
//        return format;
//    }
//
//    /**
//     * 获取图片上传的根目录
//     * @return
//     */
//    public static String getUploadPath(){
//        return props.getProperty("img.upload.Path");
//    }
//
//    /**
//     * 获取定义为图片的文件类型
//     * @return
//     */
//    public static String getMimeTypes(){
//        return props.getProperty("img.file.types");
//    }
//
//    /**
//     * 上传图片
//     * @param mFile 文件
//     * @param targetDir 上传路径
//     * @return
//     */
//    public static String upload(MultipartFile mFile, String targetDir) {
//        return upload(mFile, targetDir, false);
//    }
//
//
//    //上传单个文件
//    public static String uploadOneFile(MultipartFile mFile, String targetDir, boolean isGoods) {
//        String dbPath = "";
//        try {
//            //获取上传文件名,包含后缀uploadOneFile
//            String originalFilename = mFile.getOriginalFilename();
//            String fileName = mFile.getOriginalFilename();
//            dbPath=targetDir+"/"+ fileName;
//            //获取后缀
//            String substring = originalFilename.substring(originalFilename.lastIndexOf("."));
//            // 实体路径
//            targetDir = dealOsPath(targetDir);
//            File dir = new File(targetDir);
//            if(!dir.isDirectory()){
//                dir.mkdirs();
//            }
//            File uploadFile  = new File(targetDir,fileName);
//            //将上传文件保存到路径
//            try {
//                mFile.transferTo(uploadFile);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return dbPath;
//    }
//}