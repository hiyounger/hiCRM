package com.hiyoung.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class BeanUtil {
    public  static <T> T mapTOBean(T t, Map<String,?extends  Object> map){
        try {
            BeanUtils.populate(t,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return t;
    }

}
