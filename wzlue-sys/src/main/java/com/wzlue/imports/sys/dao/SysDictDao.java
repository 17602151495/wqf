package com.wzlue.imports.sys.dao;

import com.wzlue.imports.common.base.BaseDao;
import com.wzlue.imports.sys.entity.SysDictEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 数据字典表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-15 16:08:30
 */
@Mapper
public interface SysDictDao extends BaseDao<SysDictEntity> {


    SysDictEntity querySysDictEntitybyname(SysDictEntity a);
    /**
     * 根据字典名称获取结果集
     * @param name
     * @return
     */
    List<SysDictEntity> queryListNotPage(String name);

    SysDictEntity queryObjectByPar(SysDictEntity sysDictEntity);

    SysDictEntity query(SysDictEntity sysDictEntity);

    //更快类型获取结果
    List<SysDictEntity> querybytype(String name);

    //通过类型与名称判断字典值是否存在
    SysDictEntity queryByTypeAndName(@Param("type")String type, @Param("name")String name);

    List<SysDictEntity> getByType();

    SysDictEntity queryByTypeAndCode(Map<String, Object> params);

    Integer queryCountByTypeAndName(@Param("type")String type, @Param("name")String name);
}
