package com.wzlue.imports.sys.dao;

import com.wzlue.imports.common.base.BaseDao;
import com.wzlue.imports.sys.entity.SysNumberRuleEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 编码规则
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-27 09:50:44
 */
@Mapper
public interface SysNumberRuleDao extends BaseDao<SysNumberRuleEntity> {

    SysNumberRuleEntity queryParams(SysNumberRuleEntity sysNumberRule);

    void updateCodeNumber();
}
