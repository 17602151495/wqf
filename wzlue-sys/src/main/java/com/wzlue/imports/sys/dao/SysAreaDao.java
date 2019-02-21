package com.wzlue.imports.sys.dao;

import com.wzlue.imports.sys.entity.SysAreaEntity;
import com.wzlue.imports.common.base.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author YJ
 * @email sunlightcs@gmail.com
 * @date 2018-06-11 14:13:34
 */
@Mapper
public interface SysAreaDao extends BaseDao<SysAreaEntity> {


    List<SysAreaEntity> areaList(Map<String,Object> params);
}
